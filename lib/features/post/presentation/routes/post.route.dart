import 'package:auto_route/auto_route.dart';

import '../../../../core/common/presentation/routes/app_router.dart';
import '../../../../core/common/presentation/routes/app_router.gr.dart';

class PostRoutes {
  static final routes = AutoRoute(
    page: PostWrapper.page,
    children: [
      AutoRoute(page: PostListRoute.page, initial: true),
      AutoRoute(page: AddPostRoute.page),
      AutoRoute(page: PostDetailRoute.page),
    ],
  );
}
