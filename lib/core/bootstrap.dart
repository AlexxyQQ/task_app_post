import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../config/observers/bloc_observer.dart';
import 'di/main.di.dart';

FutureOr<void> bootstrap({
  required FutureOr<Widget> Function() builder,
  required Future<Null> Function() initializers,
}) async {
  await runZonedGuarded(
    () async {
      BindingBase.debugZoneErrorsAreFatal = true;
      WidgetsFlutterBinding.ensureInitialized();
      await EasyLocalization.ensureInitialized();

      await MainDI().register();
      // Background Task Handler
      // Main Bloc observer initialization
      // ! Comment this line to disable bloc observer
      Bloc.observer = sl<AppBlocObserver>();
      // Lock Rotation
      await SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
      ]);
      await initializers();

      // Run the app
      final app = await builder();
      runApp(app);
    },
    (error, stackTrace) {
      if (kDebugMode) {
        print('Error: ${error.toString()}, stackTrace: $stackTrace');
      }
    },
  );
}
