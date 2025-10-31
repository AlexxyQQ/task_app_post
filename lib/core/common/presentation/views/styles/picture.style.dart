import 'package:flutter/material.dart';

import '../../../../../config/theme/components_theme/picture.theme.dart';

class PictureStyles {
  /// Creates a KTextFormFieldTheme based on the current context's theme
  static PictureTheme getTheme(PictureTheme? theme) {
    const defaultTheme = PictureTheme(
      fit: BoxFit.cover,
      alignment: Alignment.center,
      semanticsLabel: 'Picture',
      matchTextDirection: false,
    );
    final customTheme = defaultTheme.copyWith(
      color: theme?.color ?? defaultTheme.color,
      fit: theme?.fit ?? defaultTheme.fit,
      alignment: theme?.alignment ?? defaultTheme.alignment,
      semanticsLabel: theme?.semanticsLabel ?? defaultTheme.semanticsLabel,
      matchTextDirection:
          theme?.matchTextDirection ?? defaultTheme.matchTextDirection,
      backgroundColor: theme?.backgroundColor ?? defaultTheme.backgroundColor,
      containerHeight: theme?.containerHeight ?? defaultTheme.containerHeight,
      containerWidth: theme?.containerWidth ?? defaultTheme.containerWidth,
      containerPadding:
          theme?.containerPadding ?? defaultTheme.containerPadding,
      borderColor: theme?.borderColor ?? defaultTheme.borderColor,
      borderWidth: theme?.borderWidth ?? defaultTheme.borderWidth,
      borderRadius: theme?.borderRadius ?? defaultTheme.borderRadius,
      shape: theme?.shape ?? defaultTheme.shape,
    );

    return customTheme;
  }
}
