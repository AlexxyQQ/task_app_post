import 'package:flutter/material.dart';

import '../../../../config/constants/colors/primitive_colors.constant.dart';
import '../helpers/snackbar_helper.dart';

extension SnackBarExtension on BuildContext {
  void showSuccessSnackBar({
    required String message,
    Duration duration = const Duration(seconds: 3),
    Color backgroundColor = PrimitiveColors.green,
    TextStyle? textStyle,
  }) {
    SnackbarHelper.show(
      context: this,
      message: message,
      duration: duration,
      backgroundColor: backgroundColor,
      textStyle: textStyle,
    );
  }

  void showErrorSnackBar({
    String? message,
    Duration duration = const Duration(seconds: 3),
    Color backgroundColor = PrimitiveColors.red,
    TextStyle? textStyle,
  }) {
    if (message != null && message.isNotEmpty) {
      SnackbarHelper.show(
        context: this,
        message: message,
        duration: duration,
        backgroundColor: backgroundColor,
        textStyle: textStyle,
        isError: true,
      );
    }
  }
}
