import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage(name: 'PostWrapper')
class PostWrapper extends StatelessWidget implements AutoRouteWrapper {
  const PostWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoRouter();
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return this;
  }
}
