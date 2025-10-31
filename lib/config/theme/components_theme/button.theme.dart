// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

import '../../../core/abstract/presentation/abstract.app_color.dart';

class CustomButtonTheme {
  final CustomAppColor? backgroundColor;
  final CustomAppColor? foregroundColor;
  final CustomAppColor? backgroundDisabledColor;
  final CustomAppColor? foregroundDisabledColor;
  final CustomAppColor? labelColor;
  final BorderRadius? radius;
  final EdgeInsets? padding;
  final bool? showBorder;
  final BorderSide? border;
  final Color? loaderColor;
  final bool? fixHeight;
  final bool? translate;

  const CustomButtonTheme({
    this.backgroundColor,
    this.foregroundColor,
    this.backgroundDisabledColor,
    this.foregroundDisabledColor,
    this.labelColor,
    this.radius,
    this.padding,
    this.showBorder,
    this.border,
    this.loaderColor,
    this.fixHeight,
    this.translate,
  });

  CustomButtonTheme copyWith({
    CustomAppColor? backgroundColor,
    CustomAppColor? foregroundColor,
    CustomAppColor? backgroundDisabledColor,
    CustomAppColor? foregroundDisabledColor,
    CustomAppColor? labelColor,
    BorderRadius? radius,
    EdgeInsets? padding,
    double? height,
    double? width,
    bool? showBorder,
    BorderSide? border,
    Color? loaderColor,
    bool? fixHeight,
    bool? translate,
  }) {
    return CustomButtonTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      foregroundColor: foregroundColor ?? this.foregroundColor,
      backgroundDisabledColor:
          backgroundDisabledColor ?? this.backgroundDisabledColor,
      foregroundDisabledColor:
          foregroundDisabledColor ?? this.foregroundDisabledColor,
      labelColor: labelColor ?? this.labelColor,
      radius: radius ?? this.radius,
      padding: padding ?? this.padding,
      showBorder: showBorder ?? this.showBorder,
      border: border ?? this.border,
      loaderColor: loaderColor ?? this.loaderColor,
      fixHeight: fixHeight ?? this.fixHeight,
      translate: translate ?? this.translate,
    );
  }

  @override
  bool operator ==(covariant CustomButtonTheme other) {
    if (identical(this, other)) return true;

    return other.backgroundColor == backgroundColor &&
        other.foregroundColor == foregroundColor &&
        other.backgroundDisabledColor == backgroundDisabledColor &&
        other.foregroundDisabledColor == foregroundDisabledColor &&
        other.labelColor == labelColor &&
        other.radius == radius &&
        other.padding == padding &&
        other.showBorder == showBorder &&
        other.border == border &&
        other.loaderColor == loaderColor &&
        other.fixHeight == fixHeight &&
        other.translate == translate;
  }

  @override
  int get hashCode {
    return backgroundColor.hashCode ^
        foregroundColor.hashCode ^
        backgroundDisabledColor.hashCode ^
        foregroundDisabledColor.hashCode ^
        labelColor.hashCode ^
        radius.hashCode ^
        padding.hashCode ^
        showBorder.hashCode ^
        border.hashCode ^
        loaderColor.hashCode ^
        fixHeight.hashCode ^
        translate.hashCode;
  }

  @override
  String toString() {
    return 'CustomButtonTheme(backgroundColor: $backgroundColor, foregroundColor: $foregroundColor, backgroundDisabledColor: $backgroundDisabledColor, foregroundDisabledColor: $foregroundDisabledColor, labelColor: $labelColor, radius: $radius, padding: $padding, showBorder: $showBorder, border: $border, loaderColor: $loaderColor, fixHeight: $fixHeight, translate: $translate)';
  }
}
