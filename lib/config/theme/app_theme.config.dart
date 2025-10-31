import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/colors/primitive_colors.constant.dart';
import '../constants/fonts/all_text_styles.dart';
import '../constants/size/app_size.constant.dart';

class AppTheme {
  static ThemeData appLightTheme() {
    return ThemeData(
      brightness: Brightness.light,
      useMaterial3: true,
      inputDecorationTheme: InputDecorationTheme(
        errorMaxLines: 1,
        errorStyle: AllTextStyle.f14W5.copyWith(color: PrimitiveColors.red),
        hintFadeDuration: const Duration(milliseconds: 400),
        hintStyle: AllTextStyle.f14W5.copyWith(color: PrimitiveColors.hintText),
        activeIndicatorBorder: const BorderSide(color: PrimitiveColors.primary),
        contentPadding: AppSize.verticalPadding16 + AppSize.horizontalPadding16,
        disabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: PrimitiveColors.inactive),
          borderRadius: AppSize.allRadius8,
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: PrimitiveColors.stroke),
          borderRadius: AppSize.allRadius8,
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: PrimitiveColors.primary),
          borderRadius: AppSize.allRadius8,
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: PrimitiveColors.red),
          borderRadius: AppSize.allRadius8,
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: PrimitiveColors.red),
          borderRadius: AppSize.allRadius8,
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: PrimitiveColors.stroke),
          borderRadius: AppSize.allRadius8,
        ),
        fillColor: PrimitiveColors.white,
        filled: true,
        focusColor: PrimitiveColors.primary,
        hoverColor: PrimitiveColors.primary,
        iconColor: PrimitiveColors.black,
        helperStyle: AllTextStyle.f14W5.copyWith(
          color: PrimitiveColors.hintText,
        ),
        labelStyle: AllTextStyle.f14W5.copyWith(color: PrimitiveColors.black),
        prefixStyle: AllTextStyle.f14W5.copyWith(color: PrimitiveColors.black),
        suffixStyle: AllTextStyle.f14W5.copyWith(color: PrimitiveColors.black),
        outlineBorder: const BorderSide(color: PrimitiveColors.stroke),
        prefixIconColor: PrimitiveColors.black,
        suffixIconColor: PrimitiveColors.black,
        helperMaxLines: 2,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: PrimitiveColors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        toolbarHeight: 50.h,
        iconTheme: const IconThemeData(color: PrimitiveColors.black),
      ),
      scaffoldBackgroundColor: PrimitiveColors.white,
      scrollbarTheme: ScrollbarThemeData(
        thumbColor: WidgetStateProperty.all(PrimitiveColors.primary),
        trackColor: WidgetStateProperty.all(PrimitiveColors.stroke),
        interactive: true,
        thumbVisibility: WidgetStateProperty.all(true),
        radius: const Radius.circular(12),
        trackVisibility: WidgetStateProperty.all(false),
      ),
      drawerTheme: const DrawerThemeData(
        elevation: 0,
        backgroundColor: PrimitiveColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(12),
            bottomRight: Radius.circular(12),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          textStyle: AllTextStyle.f16W8.copyWith(color: PrimitiveColors.white),
          elevation: 5,
          backgroundColor: PrimitiveColors.transparent,
        ),
      ),
      iconTheme: const IconThemeData(color: PrimitiveColors.white),
      primaryIconTheme: const IconThemeData(color: PrimitiveColors.white),
    );
  }
}
