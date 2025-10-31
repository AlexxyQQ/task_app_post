import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../config/constants/colors/primitive_colors.constant.dart';
import '../../../../../../config/constants/fonts/all_text_styles.dart';
import '../../../../../../config/constants/size/app_size.constant.dart';
import '../../../../../../config/theme/components_theme/button.theme.dart';
import '../styles/button.style.dart';
import 'app_text.widget.dart';

class AppButton extends StatelessWidget {
  const AppButton._({
    required this.onPressed,
    required this.label,
    required this.theme,
    this.isLoading = false,
    this.isDisabled = false,
    this.prefix,
    this.suffix,
    this.height,
    this.width,
  });

  factory AppButton.primary({
    required void Function()? onPressed,
    required String label,
    bool isLoading = false,
    bool isDisabled = false,
    Widget? prefix,
    Widget? suffix,
    CustomButtonTheme? theme,
    double? height,
    double? width,
  }) {
    return AppButton._(
      onPressed: onPressed,
      label: label,
      isLoading: isLoading,
      isDisabled: isDisabled,
      prefix: prefix,
      suffix: suffix,
      theme: ButtonStyles.primaryTheme,
      height: height,
      width: width,
    );
  }

  factory AppButton.secondary({
    required void Function()? onPressed,
    required String label,
    bool isLoading = false,
    bool isDisabled = false,
    Widget? prefix,
    Widget? suffix,
    CustomButtonTheme? theme,
    double? height,
    double? width,
  }) {
    return AppButton._(
      onPressed: onPressed,
      label: label,
      isLoading: isLoading,
      isDisabled: isDisabled,
      prefix: prefix,
      suffix: suffix,
      theme: ButtonStyles.secondaryTheme,
      height: height,
      width: width,
    );
  }

  factory AppButton.stroke({
    required void Function()? onPressed,
    required String label,
    bool isLoading = false,
    bool isDisabled = false,
    Widget? prefix,
    Widget? suffix,
    CustomButtonTheme? theme,
    double? height,
    double? width,
  }) {
    return AppButton._(
      onPressed: onPressed,
      label: label,
      isLoading: isLoading,
      isDisabled: isDisabled,
      prefix: prefix,
      suffix: suffix,
      theme: ButtonStyles.strokeTheme,
      height: height,
      width: width,
    );
  }

  factory AppButton.ghost({
    required void Function()? onPressed,
    required String label,
    bool isLoading = false,
    bool isDisabled = false,
    Widget? prefix,
    Widget? suffix,
    CustomButtonTheme? theme,
    double? height,
    double? width,
  }) {
    return AppButton._(
      onPressed: onPressed,
      label: label,
      isLoading: isLoading,
      isDisabled: isDisabled,
      prefix: prefix,
      suffix: suffix,
      theme: ButtonStyles.ghostTheme,
      height: height,
      width: width,
    );
  }

  factory AppButton.custom({
    required void Function()? onPressed,
    required String label,
    required CustomButtonTheme theme,
    bool isLoading = false,
    bool isDisabled = false,
    Widget? prefix,
    Widget? suffix,
    double? height,
    double? width,
  }) {
    return AppButton._(
      onPressed: onPressed,
      label: label,
      isLoading: isLoading,
      isDisabled: isDisabled,
      prefix: prefix,
      suffix: suffix,
      theme: ButtonStyles.getTheme(theme),
      height: height,
      width: width,
    );
  }
  final void Function()? onPressed;
  final String label;
  final bool isLoading;
  final bool isDisabled;
  final Widget? prefix;
  final Widget? suffix;
  final double? height;
  final double? width;
  final CustomButtonTheme? theme;

  @override
  Widget build(BuildContext context) {
    final buttonTheme = ButtonStyles.getTheme(theme);

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: buttonTheme.radius ?? AppSize.allRadius12,
          side: buttonTheme.showBorder ?? false
              ? buttonTheme.border ??
                    BorderSide(
                      color: isDisabled
                          ? PrimitiveColors.primaryDisabled
                          : PrimitiveColors.primary,
                    )
              : BorderSide.none,
        ),
        backgroundColor: buttonTheme.backgroundColor,
        disabledBackgroundColor: buttonTheme.backgroundDisabledColor,
        foregroundColor: buttonTheme.foregroundColor,
        disabledForegroundColor: buttonTheme.foregroundDisabledColor,
        elevation: 0,
        alignment: Alignment.center,
        fixedSize: buttonTheme.fixHeight ?? true
            ? Size(width ?? 1.sw, height ?? 60.h)
            : null,
        padding:
            buttonTheme.padding ??
            AppSize.horizontalPadding16 + AppSize.verticalPadding12,
        textStyle: AllTextStyle.f14W6,
      ),
      onPressed: isLoading ? () {} : (isDisabled ? null : onPressed),
      child: isLoading
          ? SizedBox(
              height: 30.h,
              width: 30.w,
              child: CircularProgressIndicator(
                color: buttonTheme.loaderColor ?? PrimitiveColors.white,
                strokeWidth: 3,
              ),
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (prefix != null) prefix!,
                if (prefix != null) AppSize.horizontalMargin8,
                AppText(
                  label,
                  style: buttonTheme.labelColor != null
                      ? AllTextStyle.f14W6.copyWith(
                          color: buttonTheme.labelColor,
                        )
                      : AllTextStyle.f14W6,
                  translate: buttonTheme.translate ?? true,
                ),
                if (suffix != null) AppSize.horizontalMargin8,
                if (suffix != null) suffix!,
              ],
            ),
    );
  }
}
