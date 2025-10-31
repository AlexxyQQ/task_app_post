import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/constants/colors/primitive_colors.constant.dart';
import '../../../../../config/constants/fonts/all_text_styles.dart';
import '../../../../../config/theme/components_theme/app_icon.theme.dart';
import '../../../../../core/abstract/presentation/bloc/crud/crud.bloc.dart';
import '../../../../../core/common/data/models/error/app_error.model.dart';
import '../../../../../core/common/presentation/extensions/size.extension.dart';
import '../../../../../core/common/presentation/extensions/snackbar_extension.dart';
import '../../../../../core/common/presentation/views/widgets/app_button.widget.dart';
import '../../../../../core/common/presentation/views/widgets/app_icon.widget.dart';
import '../../../../../core/common/presentation/views/widgets/app_text.widget.dart';
import '../../../../../core/common/presentation/views/widgets/app_text_field.widget.dart';
import '../../../../../core/common/presentation/views/widgets/default_app_bar.dart';
import '../../../data/models/post.model.dart';
import '../../bloc/post.bloc.dart';

@RoutePage(name: 'PostDetailRoute')
class PostDetailPage extends StatefulWidget {
  const PostDetailPage({required this.postId, super.key});
  final int postId;

  @override
  State<PostDetailPage> createState() => _PostDetailPageState();
}

class _PostDetailPageState extends State<PostDetailPage> {
  @override
  void initState() {
    super.initState();

    context.read<PostBloc>().add(
      GetEntityByIdEvent<PostModel>(id: widget.postId.toString()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PostBloc, CrudState<PostModel>>(
      listener: (context, state) {
        if (state.error == null &&
            !state.isLoading &&
            state.successMessage != null) {
          context.showSuccessSnackBar(message: state.successMessage!);
        } else if (state.error != null) {
          context.showErrorSnackBar(message: state.error!.message);
        }
      },
      builder: (context, state) {
        Widget buildBody() {
          final bool isFetching = (state.isLoading);

          if (isFetching || (state.isLoading && state.selectedEntity == null)) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.error != null && state.selectedEntity == null) {
            return _PostErrorWidget(
              error: state.error!,
              onRetry: () {
                context.read<PostBloc>().add(
                  GetEntityByIdEvent<PostModel>(id: widget.postId.toString()),
                );
              },
            );
          }

          if (state.selectedEntity != null) {
            final bool isUpdating = state.isLoading;
            return _PostDetailView(
              post: state.selectedEntity!,
              isUpdating: isUpdating,
            );
          }

          return Center(
            child: AppText('Post not found.', style: AllTextStyle.f18W4),
          );
        }

        return Scaffold(
          appBar: const DefaultAppBar(title: 'Post Detail'),
          body: buildBody(),
        );
      },
    );
  }
}

class _PostDetailView extends StatefulWidget {
  const _PostDetailView({required this.post, required this.isUpdating});
  final PostModel post;
  final bool isUpdating;

  @override
  State<_PostDetailView> createState() => _PostDetailViewState();
}

class _PostDetailViewState extends State<_PostDetailView> {
  late final TextEditingController _titleController;
  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.post.title);
  }

  @override
  void didUpdateWidget(_PostDetailView oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.post.title != oldWidget.post.title && !_isEditing) {
      _titleController.text = widget.post.title;
    }

    if (oldWidget.isUpdating && !widget.isUpdating) {
      setState(() {
        _isEditing = false;
      });
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  void _onSave() {
    if (!_isEditing || widget.isUpdating) return;

    final updatedPost = widget.post.copyWith(title: _titleController.text);

    context.read<PostBloc>().add(UpdateEntityEvent(entity: updatedPost));
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: 16.allPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppText('Title', style: AllTextStyle.f20W6),
              if (_isEditing)
                AppIcon.circular(
                  Icons.save_alt_outlined,
                  size: 20,
                  theme: const AppIconTheme(color: PrimitiveColors.blue),
                  onTap: _onSave,
                )
              else
                AppIcon.circular(
                  Icons.edit,
                  size: 20,
                  theme: const AppIconTheme(color: PrimitiveColors.blue),
                  onTap: () {
                    setState(() {
                      _isEditing = true;
                    });
                  },
                ),
            ],
          ),
          8.verticalGap,
          _isEditing
              ? _buildTitleEditor()
              : AppText(
                  widget.post.title,
                  style: AllTextStyle.f16W4.copyWith(
                    color: PrimitiveColors.grey700,
                  ),
                ),

          24.verticalGap,

          AppText('Body', style: AllTextStyle.f20W6),
          8.verticalGap,
          AppText(
            widget.post.body ?? 'No content available.',
            style: AllTextStyle.f16W4.copyWith(color: PrimitiveColors.grey700),
          ),
        ],
      ),
    );
  }

  Widget _buildTitleEditor() {
    return AppTextField.custom(controller: _titleController);
  }
}

class _PostErrorWidget extends StatelessWidget {
  const _PostErrorWidget({required this.error, required this.onRetry});
  final AppErrorModel error;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: 16.allPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const AppIcon(
              Icons.error_outline,
              theme: AppIconTheme(color: PrimitiveColors.red),
              size: 50,
            ),
            16.verticalGap,
            AppText(
              'An error occurred',
              style: AllTextStyle.f20W6,
              textAlign: TextAlign.center,
            ),
            8.verticalGap,
            AppText(
              error.message,
              style: AllTextStyle.f14W4,
              textAlign: TextAlign.center,
              maxLines: 6,
            ),
            24.verticalGap,
            AppButton.primary(onPressed: onRetry, label: 'Retry'),
          ],
        ),
      ),
    );
  }
}
