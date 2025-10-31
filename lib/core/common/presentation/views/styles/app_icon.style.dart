import 'package:flutter/material.dart';

import '../../../../../config/theme/components_theme/app_icon.theme.dart';

class AppIconStyles {
  /// Creates an AppIconTheme based on the current context's theme
  static AppIconTheme getTheme(AppIconTheme? theme) {
    const defaultTheme = AppIconTheme(
      size: 24.0,
      isCircular: false,
      shape: BoxShape.circle,
      containerPadding: EdgeInsets.all(8.0),
    );

    final customTheme = defaultTheme.copyWith(
      color: theme?.color ?? defaultTheme.color,
      size: theme?.size ?? defaultTheme.size,
      backgroundColor: theme?.backgroundColor ?? defaultTheme.backgroundColor,
      containerHeight: theme?.containerHeight ?? defaultTheme.containerHeight,
      containerWidth: theme?.containerWidth ?? defaultTheme.containerWidth,
      containerPadding:
          theme?.containerPadding ?? defaultTheme.containerPadding,
      borderColor: theme?.borderColor ?? defaultTheme.borderColor,
      borderWidth: theme?.borderWidth ?? defaultTheme.borderWidth,
      borderRadius: theme?.borderRadius ?? defaultTheme.borderRadius,
      shape: theme?.shape ?? defaultTheme.shape,
      isCircular: theme?.isCircular ?? defaultTheme.isCircular,
    );

    return customTheme;
  }
}
