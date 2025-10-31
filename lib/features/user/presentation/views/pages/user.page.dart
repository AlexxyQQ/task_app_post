import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Assuming these imports are correct based on your project structure
import '../../../../../config/constants/colors/primitive_colors.constant.dart';
import '../../../../../core/abstract/presentation/bloc/crud/crud.bloc.dart';
import '../../../../../core/common/domain/services/navigation/navigation.service.dart';
import '../../../../../core/common/presentation/extensions/size.extension.dart';
import '../../../../../core/common/presentation/views/widgets/app_button.widget.dart';
import '../../../../../core/common/presentation/views/widgets/app_icon.widget.dart';
import '../../../../../core/common/presentation/views/widgets/app_text.widget.dart';
import '../../../../../core/common/presentation/views/widgets/default_app_bar.dart';
import '../../../../../core/di/main.di.dart';
import '../../../data/models/user.model.dart';
import '../../bloc/user/user.bloc.dart';

// Importing the bottom sheet from the file in the Canvas
import 'add_user_bottom_sheet.dart';

@RoutePage(name: 'UserWrapper')
class UserWrapper extends StatefulWidget implements AutoRouteWrapper {
  const UserWrapper({super.key});

  @override
  State<UserWrapper> createState() => _UserWrapperState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<UserBloc>()..add(GetAllEntitiesEvent()),
      child: this,
    );
  }
}

class _UserWrapperState extends State<UserWrapper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        title: 'User Form',
        actions: [
          AppIcon.circular(
            Icons.add,
            size: 16,
            onTap: () {
              // Correctly show the AddUserBottomSheet from the Canvas
              AddUserBottomSheet.show(
                context: context,
                title: 'Add User',
                description: 'Add User',
                onAdd: (data) {
                  context.read<UserBloc>().add(CreateEntityEvent(entity: data));
                },
              );
            },
          ),
          16.horizontalGap,
        ],
      ),
      body: BlocBuilder<UserBloc, CrudState<UserModel>>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.entities.isEmpty) {
            return const Center(child: AppText('No user found.'));
          }

          // Replaced Placeholder with a ListView.builder
          return ListView.builder(
            // Add some padding to the list
            padding: const EdgeInsets.all(16.0),
            itemCount: state.entities.length,
            itemBuilder: (context, index) {
              final user = state.entities[index];

              // Using a more detailed Card
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 8.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Top Row: Avatar + Name/Username
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 28,
                            backgroundImage:
                                (user.image != null && user.image!.isNotEmpty)
                                ? NetworkImage(user.image!)
                                : null,
                            child: (user.image == null || user.image!.isEmpty)
                                ? AppText(
                                    (user.fullName != null &&
                                            user.fullName!.isNotEmpty)
                                        ? user.fullName![0].toUpperCase()
                                        : 'U',
                                    style: const TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: PrimitiveColors.pink,
                                    ),
                                  )
                                : null,
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppText(
                                  user.fullName ?? 'No Name',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                if (user.username != null &&
                                    user.username!.isNotEmpty) ...[
                                  const SizedBox(height: 4),
                                  AppText(
                                    '@${user.username!}',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ],
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      const Divider(),
                      const SizedBox(height: 12),

                      // Info Section
                      _buildInfoRow(
                        context,
                        Icons.email_outlined,
                        user.email ?? 'No email provided',
                      ),
                      const SizedBox(height: 10),
                      _buildInfoRow(
                        context,
                        Icons.phone_outlined,
                        user.phone ?? 'No phone provided',
                      ),
                      const SizedBox(height: 10),
                      _buildInfoRow(
                        context,
                        Icons.location_on_outlined,
                        user.address ?? 'No address provided',
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  /// Helper widget to build a row with an icon and text
  Widget _buildInfoRow(BuildContext context, IconData icon, String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 18, color: Theme.of(context).colorScheme.primary),
        const SizedBox(width: 12),
        Expanded(
          child: AppText(
            text,
            style: TextStyle(fontSize: 14, color: Colors.grey[700]),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
