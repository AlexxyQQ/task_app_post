import 'package:auto_route/auto_route.dart';
import '../../../../config/constants/path/app_path.constant.dart';
import '../../../../features/post/presentation/routes/post.route.dart';
import 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: SplashRoute.page, path: AppPathConstant.splashRoute),
    AutoRoute(page: UserWrapper.page),
    PostRoutes.routes,
  ];
}
