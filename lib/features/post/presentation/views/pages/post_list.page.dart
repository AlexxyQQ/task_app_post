import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/constants/colors/primitive_colors.constant.dart';
import '../../../../../config/constants/fonts/all_text_styles.dart';
import '../../../../../config/theme/components_theme/app_icon.theme.dart';
import '../../../../../core/abstract/presentation/bloc/crud/crud.bloc.dart';
import '../../../../../core/app.dart';
import '../../../../../core/common/data/models/error/app_error.model.dart';
import '../../../../../core/common/domain/services/navigation/navigation.service.dart';
import '../../../../../core/common/presentation/extensions/size.extension.dart';
import '../../../../../core/common/presentation/extensions/snackbar_extension.dart';
import '../../../../../core/common/presentation/routes/app_router.gr.dart';
import '../../../../../core/common/presentation/views/widgets/app_button.widget.dart';
import '../../../../../core/common/presentation/views/widgets/app_icon.widget.dart';
import '../../../../../core/common/presentation/views/widgets/default_app_bar.dart';
import '../../../../../core/di/main.di.dart';
import '../../../data/models/post.model.dart';
import '../../bloc/post.bloc.dart';

import '../../../../../core/common/presentation/views/widgets/app_text.widget.dart';
import '../widgets/post_card.widget.dart';

@RoutePage(name: 'PostListRoute')
class PostListPage extends StatelessWidget {
  const PostListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PostBloc, CrudState<PostModel>>(
      listener: (context, state) {
        if (state.error != null) {
          context.showErrorSnackBar(message: state.error!.message);
        }
      },
      builder: (context, state) {
        Widget buildBody() {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.error != null) {
            return _PostErrorWidget(
              error: state.error!,
              onRetry: () {
                context.read<PostBloc>().add(GetAllEntitiesEvent());
              },
            );
          }

          if (state.entities.isNotEmpty) {
            return _ListViewWidget(data: state.entities);
          }

          return Center(
            child: AppText('No posts found.', style: AllTextStyle.f18W4),
          );
        }

        return Scaffold(
          appBar: DefaultAppBar(
            title: 'Posts',
            actions: [
              AppIcon.circular(
                Icons.person_2_outlined,
                size: 16,
                onTap: () {
                  sl<NavigationService>().push(const UserWrapper());
                },
              ),
              16.horizontalGap,
            ],
          ),
          body: buildBody(),
        );
      },
    );
  }
}

class _ListViewWidget extends StatelessWidget {
  const _ListViewWidget({required this.data});
  final List<PostModel> data;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<PostBloc>().add(GetAllEntitiesEvent());
      },
      child: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          final post = data[index];

          return PostCardWidget(
            post: post,
            onTap: () {
              sl<NavigationService>().push(PostDetailRoute(postId: post.id));
            },
          );
        },
      ),
    );
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
