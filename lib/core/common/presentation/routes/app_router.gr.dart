// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i8;
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
import 'package:task_app/features/user/presentation/views/pages/user.page.dart'
    as _i6;

/// generated route for
/// [_i1.AddPostPage]
class AddPostRoute extends _i7.PageRouteInfo<void> {
  const AddPostRoute({List<_i7.PageRouteInfo>? children})
    : super(AddPostRoute.name, initialChildren: children);

  static const String name = 'AddPostRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i1.AddPostPage();
    },
  );
}

/// generated route for
/// [_i2.PostDetailPage]
class PostDetailRoute extends _i7.PageRouteInfo<PostDetailRouteArgs> {
  PostDetailRoute({
    required int postId,
    _i8.Key? key,
    List<_i7.PageRouteInfo>? children,
  }) : super(
         PostDetailRoute.name,
         args: PostDetailRouteArgs(postId: postId, key: key),
         initialChildren: children,
       );

  static const String name = 'PostDetailRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PostDetailRouteArgs>();
      return _i2.PostDetailPage(postId: args.postId, key: args.key);
    },
  );
}

class PostDetailRouteArgs {
  const PostDetailRouteArgs({required this.postId, this.key});

  final int postId;

  final _i8.Key? key;

  @override
  String toString() {
    return 'PostDetailRouteArgs{postId: $postId, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! PostDetailRouteArgs) return false;
    return postId == other.postId && key == other.key;
  }

  @override
  int get hashCode => postId.hashCode ^ key.hashCode;
}

/// generated route for
/// [_i3.PostListPage]
class PostListRoute extends _i7.PageRouteInfo<void> {
  const PostListRoute({List<_i7.PageRouteInfo>? children})
    : super(PostListRoute.name, initialChildren: children);

  static const String name = 'PostListRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i3.PostListPage();
    },
  );
}

/// generated route for
/// [_i4.PostWrapper]
class PostWrapper extends _i7.PageRouteInfo<void> {
  const PostWrapper({List<_i7.PageRouteInfo>? children})
    : super(PostWrapper.name, initialChildren: children);

  static const String name = 'PostWrapper';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return _i7.WrappedRoute(child: const _i4.PostWrapper());
    },
  );
}

/// generated route for
/// [_i5.SplashPage]
class SplashRoute extends _i7.PageRouteInfo<void> {
  const SplashRoute({List<_i7.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i5.SplashPage();
    },
  );
}

/// generated route for
/// [_i6.UserWrapper]
class UserWrapper extends _i7.PageRouteInfo<void> {
  const UserWrapper({List<_i7.PageRouteInfo>? children})
    : super(UserWrapper.name, initialChildren: children);

  static const String name = 'UserWrapper';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return _i7.WrappedRoute(child: const _i6.UserWrapper());
    },
  );
}
