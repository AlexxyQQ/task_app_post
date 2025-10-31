import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../../presentation/routes/app_router.dart';

typedef RouteFailure = void Function(NavigationFailure)?;

class NavigationService {
  const NavigationService._(this._appRouter);

  factory NavigationService._internal(AppRouter appRouter) =>
      NavigationService._(appRouter);

  factory NavigationService(AppRouter appRouter) {
    _instance ??= NavigationService._internal(appRouter);
    return _instance!;
  }
  final AppRouter _appRouter;
  static NavigationService? _instance;

  Future<void> push(PageRouteInfo route, {OnNavigationFailure? onFailure}) {
    return _appRouter.push(route, onFailure: onFailure);
  }

  Future<void> replace(PageRouteInfo route, {OnNavigationFailure? onFailure}) {
    return _appRouter.replace(route, onFailure: onFailure);
  }

  Future<void> pushNamed(String routeName, {Object? arguments}) {
    return _appRouter.pushPath(routeName);
  }

  Future<void> replaceNamed(
    String routeName, {
    OnNavigationFailure? onFailure,
  }) {
    return _appRouter.replacePath(routeName, onFailure: onFailure);
  }

  void popForced<T extends Object?>([T? result]) {
    _appRouter.pop(result);
  }

  Future<bool> maybePop() {
    return _appRouter.maybePop();
  }

  Future<bool> maybePopTop() {
    return _appRouter.maybePopTop();
  }

  Future<void> replaceAll(
    List<PageRouteInfo<dynamic>> routes, {
    RouteFailure onFailure,
    bool updateExistingRoutes = true,
  }) {
    return _appRouter.replaceAll(
      routes,
      onFailure: onFailure,
      updateExistingRoutes: updateExistingRoutes,
    );
  }

  void popUntil(RoutePredicate predicate, {bool scoped = true}) {
    return _appRouter.popUntil(predicate, scoped: scoped);
  }

  /// **MODIFIED METHOD**
  /// Pushes a widget as a new page and returns a result of type [T] when it's popped.
  Future<T?> pushWidget<T extends Object?>({
    required BuildContext context,
    required Widget widget,
  }) async {
    return Navigator.of(
      context,
    ).push<T>(MaterialPageRoute(builder: (context) => widget));
  }

  void popUntilRoot() {
    _appRouter.popUntilRoot();
  }

  bool canPop() {
    return _appRouter.canPop();
  }
}
