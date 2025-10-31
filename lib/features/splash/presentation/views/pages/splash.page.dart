import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../../config/constants/colors/primitive_colors.constant.dart';
import '../../../../../core/common/domain/services/navigation/navigation.service.dart';
import '../../../../../core/common/presentation/routes/app_router.gr.dart';
import '../../../../../core/common/presentation/views/widgets/default_app_bar.dart';
import '../../../../../core/di/main.di.dart';

@RoutePage(name: 'SplashRoute')
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1));
    sl<NavigationService>().push(const PostWrapper());
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: DefaultAppBar(),
      body: Center(
        child: CircularProgressIndicator(color: PrimitiveColors.primary),
      ),
    );
  }
}
