import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';

import '../../../../config/constants/colors/primitive_colors.constant.dart';
import '../../../../config/constants/fonts/all_text_styles.dart';
import '../views/widgets/app_text.widget.dart';

class SnackbarHelper {
  // Store the reference to the current overlay entry
  static OverlaySupportEntry? _overlaySupportEntry;

  static void show({
    required BuildContext context,
    required String message,
    Duration duration = const Duration(seconds: 3),
    Color backgroundColor = PrimitiveColors.green,
    TextStyle? textStyle,
    bool isError = false,
  }) {
    // Use post-frame callback to ensure we're not in build phase
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Dismiss any existing overlay before showing a new one
      _overlaySupportEntry?.dismiss();

      // Show the notification using showSimpleNotification
      _overlaySupportEntry = showSimpleNotification(
        Center(
          child: AppText(
            message,
            maxLines: 6,
            style:
                textStyle ??
                AllTextStyle.f14W4.copyWith(color: PrimitiveColors.white),
          ),
        ),
        background: isError ? PrimitiveColors.red : backgroundColor,
        duration: duration,
        slideDismissDirection: DismissDirection.vertical,
        context: context,
        elevation: 1,
      );

      // Automatically dismiss the notification after the specified duration
      Future.delayed(duration, () {
        _overlaySupportEntry?.dismiss();
        _overlaySupportEntry = null;
      });
    });
  }
}
