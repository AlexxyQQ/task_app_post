import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../../core/common/presentation/views/widgets/default_app_bar.dart';

@RoutePage(name: 'PostDetailRoute')
class PostDetailPage extends StatelessWidget {
  const PostDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: DefaultAppBar(title: 'Post Detail'));
  }
}
