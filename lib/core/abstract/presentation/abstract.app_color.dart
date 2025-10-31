import 'dart:ui';
import 'package:flutter/material.dart'; // Import for example usage

class CustomAppColor extends Color {
  const CustomAppColor(super.value);

  static CustomAppColor color(int value) => CustomAppColor(value);
  static CustomAppColor fromColor(Color value) =>
      CustomAppColor(value.value); // Using .value is slightly more direct
}

/// An extension to convert a standard [Color] to a [CustomAppColor].
extension CustomColorConverter on Color {
  /// Converts the current [Color] instance into a [CustomAppColor].
  CustomAppColor toCustomAppColor() {
    // Uses the static 'fromColor' method you defined on your class.
    return CustomAppColor.fromColor(this);
  }
}
