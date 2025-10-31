import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../../core/common/presentation/views/widgets/default_app_bar.dart';

@RoutePage(name: 'AddPostRoute')
class AddPostPage extends StatelessWidget {
  const AddPostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: DefaultAppBar(title: 'Add Post'));
  }
}
