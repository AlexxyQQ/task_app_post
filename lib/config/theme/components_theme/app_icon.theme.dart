// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

import '../../../core/abstract/presentation/abstract.app_color.dart';

class AppIconTheme {
  final CustomAppColor? color;
  final double? size;
  final CustomAppColor? backgroundColor;
  final double? containerHeight;
  final double? containerWidth;
  final EdgeInsets? containerPadding;
  final CustomAppColor? borderColor;
  final double? borderWidth;
  final BorderRadius? borderRadius;
  final BoxShape? shape;
  final bool? isCircular;

  const AppIconTheme({
    this.color,
    this.size,
    this.backgroundColor,
    this.containerHeight,
    this.containerWidth,
    this.containerPadding,
    this.borderColor,
    this.borderWidth,
    this.borderRadius,
    this.shape,
    this.isCircular,
  });

  AppIconTheme copyWith({
    CustomAppColor? color,
    double? size,
    CustomAppColor? backgroundColor,
    double? containerHeight,
    double? containerWidth,
    EdgeInsets? containerPadding,
    CustomAppColor? borderColor,
    double? borderWidth,
    BorderRadius? borderRadius,
    BoxShape? shape,
    bool? isCircular,
  }) {
    return AppIconTheme(
      color: color ?? this.color,
      size: size ?? this.size,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      containerHeight: containerHeight ?? this.containerHeight,
      containerWidth: containerWidth ?? this.containerWidth,
      containerPadding: containerPadding ?? this.containerPadding,
      borderColor: borderColor ?? this.borderColor,
      borderWidth: borderWidth ?? this.borderWidth,
      borderRadius: borderRadius ?? this.borderRadius,
      shape: shape ?? this.shape,
      isCircular: isCircular ?? this.isCircular,
    );
  }

  @override
  String toString() {
    return 'AppIconTheme(color: $color, size: $size, backgroundColor: $backgroundColor, containerHeight: $containerHeight, containerWidth: $containerWidth, containerPadding: $containerPadding, borderColor: $borderColor, borderWidth: $borderWidth, borderRadius: $borderRadius, shape: $shape, isCircular: $isCircular)';
  }

  @override
  bool operator ==(covariant AppIconTheme other) {
    if (identical(this, other)) return true;

    return other.color == color &&
        other.size == size &&
        other.backgroundColor == backgroundColor &&
        other.containerHeight == containerHeight &&
        other.containerWidth == containerWidth &&
        other.containerPadding == containerPadding &&
        other.borderColor == borderColor &&
        other.borderWidth == borderWidth &&
        other.borderRadius == borderRadius &&
        other.shape == shape &&
        other.isCircular == isCircular;
  }

  @override
  int get hashCode {
    return color.hashCode ^
        size.hashCode ^
        backgroundColor.hashCode ^
        containerHeight.hashCode ^
        containerWidth.hashCode ^
        containerPadding.hashCode ^
        borderColor.hashCode ^
        borderWidth.hashCode ^
        borderRadius.hashCode ^
        shape.hashCode ^
        isCircular.hashCode;
  }
}
