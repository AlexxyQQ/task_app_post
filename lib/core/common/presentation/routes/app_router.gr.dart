// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:task_app/features/post/presentation/views/pages/add_post.page.dart'
    as _i1;
import 'package:task_app/features/post/presentation/views/pages/post_detail.page.dart'
    as _i2;
import 'package:task_app/features/post/presentation/views/pages/post_list.page.dart'
    as _i3;
import 'package:task_app/features/post/presentation/views/wrappers/post.wrapper.dart'
    as _i4;
import 'package:task_app/features/splash/presentation/views/pages/splash.page.dart'
    as _i5;

/// generated route for
/// [_i1.AddPostPage]
class AddPostRoute extends _i6.PageRouteInfo<void> {
  const AddPostRoute({List<_i6.PageRouteInfo>? children})
    : super(AddPostRoute.name, initialChildren: children);

  static const String name = 'AddPostRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i1.AddPostPage();
    },
  );
}

/// generated route for
/// [_i2.PostDetailPage]
class PostDetailRoute extends _i6.PageRouteInfo<void> {
  const PostDetailRoute({List<_i6.PageRouteInfo>? children})
    : super(PostDetailRoute.name, initialChildren: children);

  static const String name = 'PostDetailRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i2.PostDetailPage();
    },
  );
}

/// generated route for
/// [_i3.PostListPage]
class PostListRoute extends _i6.PageRouteInfo<void> {
  const PostListRoute({List<_i6.PageRouteInfo>? children})
    : super(PostListRoute.name, initialChildren: children);

  static const String name = 'PostListRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i3.PostListPage();
    },
  );
}

/// generated route for
/// [_i4.PostWrapper]
class PostWrapper extends _i6.PageRouteInfo<void> {
  const PostWrapper({List<_i6.PageRouteInfo>? children})
    : super(PostWrapper.name, initialChildren: children);

  static const String name = 'PostWrapper';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return _i6.WrappedRoute(child: const _i4.PostWrapper());
    },
  );
}

/// generated route for
/// [_i5.SplashPage]
class SplashRoute extends _i6.PageRouteInfo<void> {
  const SplashRoute({List<_i6.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i5.SplashPage();
    },
  );
}
