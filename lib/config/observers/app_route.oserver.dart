import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class AppRouteObserver extends AutoRouteObserver {
  @override
  void didChangeTabRoute(TabPageRoute route, TabPageRoute previousRoute) {
    print('Route: Tab change ${previousRoute.path} ---> ${route.path}');
  }

  @override
  void didInitTabRoute(TabPageRoute route, TabPageRoute? previousRoute) {
    print('Route: Tab initialized ${previousRoute?.path} ---> ${route.path}');
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    print(
      'Route: Did pop ${previousRoute?.data?.path} ---> ${route.data?.path}',
    );
  }

  @override
  void didPush(Route route, Route? previousRoute) {
    print(
      'Route: Did push ${previousRoute?.data?.path} ---> ${route.data?.path}',
    );
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    print('Route: Did remove');
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    print('Route: Did replace ${newRoute?.settings.arguments}');
  }

  @override
  void didStartUserGesture(Route route, Route? previousRoute) {}

  @override
  void didStopUserGesture() {}

  @override
  void subscribe(AutoRouteAware routeAware, RouteData route) {
    print('Route: Subscribed');
  }

  @override
  void unsubscribe(AutoRouteAware routeAware) {
    print('Route: UnSubscribed');
  }
}
