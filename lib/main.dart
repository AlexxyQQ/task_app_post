import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'config/constants/gen/assets.gen.dart';
import 'config/constants/locales/app_locales.constant.dart';
import 'core/app.dart';
import 'core/bootstrap.dart';

void main() async {
  // HttpOverrides.global = MyHttpOverrides();
  bootstrap(
    builder: () => EasyLocalization(
      supportedLocales: AppLocales.appLocales,
      startLocale: const Locale('en', 'GB'),
      path: 'assets/translations',
      fallbackLocale: const Locale('en', 'GB'),
      child: const App(),
    ),
    initializers: () async {
      // Load Env
      await dotenv.load(fileName: Assets.env.aEnv);
    },
  );
}
