// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

import '../../../core/abstract/presentation/abstract.app_color.dart';

class PictureTheme {
  final CustomAppColor? color;
  final BoxFit? fit;
  final Alignment? alignment;
  final String? semanticsLabel;
  final bool? matchTextDirection;
  final CustomAppColor? backgroundColor;
  final double? containerHeight;
  final double? containerWidth;
  final EdgeInsets? containerPadding;
  final CustomAppColor? borderColor;
  final double? borderWidth;
  final BorderRadius? borderRadius;
  final BoxShape? shape;
  final TextStyle? altTextStyle;

  const PictureTheme({
    this.color,
    this.fit,
    this.alignment,
    this.semanticsLabel,
    this.matchTextDirection,
    this.backgroundColor,
    this.containerHeight,
    this.containerWidth,
    this.containerPadding,
    this.borderColor,
    this.borderWidth,
    this.borderRadius,
    this.shape,
    this.altTextStyle,
  });

  PictureTheme copyWith({
    CustomAppColor? color,
    BoxFit? fit,
    Alignment? alignment,
    String? semanticsLabel,
    bool? matchTextDirection,
    CustomAppColor? backgroundColor,
    double? containerHeight,
    double? containerWidth,
    EdgeInsets? containerPadding,
    CustomAppColor? borderColor,
    double? borderWidth,
    BorderRadius? borderRadius,
    BoxShape? shape,
    TextStyle? altTextStyle,
  }) {
    return PictureTheme(
      color: color ?? this.color,
      fit: fit ?? this.fit,
      alignment: alignment ?? this.alignment,
      semanticsLabel: semanticsLabel ?? this.semanticsLabel,
      matchTextDirection: matchTextDirection ?? this.matchTextDirection,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      containerHeight: containerHeight ?? this.containerHeight,
      containerWidth: containerWidth ?? this.containerWidth,
      containerPadding: containerPadding ?? this.containerPadding,
      borderColor: borderColor ?? this.borderColor,
      borderWidth: borderWidth ?? this.borderWidth,
      borderRadius: borderRadius ?? this.borderRadius,
      shape: shape ?? this.shape,
      altTextStyle: altTextStyle ?? this.altTextStyle,
    );
  }

  @override
  String toString() {
    return 'PictureTheme(color: $color, fit: $fit, alignment: $alignment, semanticsLabel: $semanticsLabel, matchTextDirection: $matchTextDirection, backgroundColor: $backgroundColor, containerHeight: $containerHeight, containerWidth: $containerWidth, containerPadding: $containerPadding, borderColor: $borderColor, borderWidth: $borderWidth, borderRadius: $borderRadius, shape: $shape)';
  }

  @override
  bool operator ==(covariant PictureTheme other) {
    if (identical(this, other)) {
      return true;
    }

    return other.color == color &&
        other.fit == fit &&
        other.alignment == alignment &&
        other.semanticsLabel == semanticsLabel &&
        other.matchTextDirection == matchTextDirection &&
        other.backgroundColor == backgroundColor &&
        other.containerHeight == containerHeight &&
        other.containerWidth == containerWidth &&
        other.containerPadding == containerPadding &&
        other.borderColor == borderColor &&
        other.borderWidth == borderWidth &&
        other.borderRadius == borderRadius &&
        other.shape == shape;
  }

  @override
  int get hashCode {
    return color.hashCode ^
        fit.hashCode ^
        alignment.hashCode ^
        semanticsLabel.hashCode ^
        matchTextDirection.hashCode ^
        backgroundColor.hashCode ^
        containerHeight.hashCode ^
        containerWidth.hashCode ^
        containerPadding.hashCode ^
        borderColor.hashCode ^
        borderWidth.hashCode ^
        borderRadius.hashCode ^
        shape.hashCode;
  }
}
