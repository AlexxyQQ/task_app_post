import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/abstract/presentation/bloc/crud/crud.bloc.dart';
import '../../../../../core/di/main.di.dart';
import '../../bloc/post.bloc.dart';

@RoutePage(name: 'PostWrapper')
class PostWrapper extends StatelessWidget implements AutoRouteWrapper {
  const PostWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return const AutoRouter();
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<PostBloc>()..add(FetchPostLocally()),
        ),
      ],
      child: this,
    );
  }
}
