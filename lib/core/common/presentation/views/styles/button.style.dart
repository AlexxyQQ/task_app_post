import '../../../../../config/constants/colors/primitive_colors.constant.dart';
import '../../../../../config/constants/size/app_size.constant.dart';
import '../../../../../config/theme/components_theme/button.theme.dart';

class ButtonStyles {
  /// Creates a CustomButtonTheme based on the current context's theme
  static CustomButtonTheme getTheme(CustomButtonTheme? theme) {
    final defaultTheme = CustomButtonTheme(
      backgroundColor: PrimitiveColors.primary,
      foregroundColor: PrimitiveColors.onPrimary,
      backgroundDisabledColor: PrimitiveColors.primaryDisabled,
      foregroundDisabledColor: PrimitiveColors.onPrimaryDisabled,
      radius: AppSize.allRadius12,
      padding: AppSize.horizontalPadding16 + AppSize.verticalPadding12,
      fixHeight: true,
      translate: true,
      showBorder: false,
    );

    final customTheme = defaultTheme.copyWith(
      backgroundColor: theme?.backgroundColor ?? defaultTheme.backgroundColor,
      foregroundColor: theme?.foregroundColor ?? defaultTheme.foregroundColor,
      backgroundDisabledColor:
          theme?.backgroundDisabledColor ??
          defaultTheme.backgroundDisabledColor,
      foregroundDisabledColor:
          theme?.foregroundDisabledColor ??
          defaultTheme.foregroundDisabledColor,
      labelColor: theme?.labelColor ?? defaultTheme.labelColor,
      radius: theme?.radius ?? defaultTheme.radius,
      padding: theme?.padding ?? defaultTheme.padding,
      showBorder: theme?.showBorder ?? defaultTheme.showBorder,
      border: theme?.border ?? defaultTheme.border,
      loaderColor: theme?.loaderColor ?? defaultTheme.loaderColor,
      fixHeight: theme?.fixHeight ?? defaultTheme.fixHeight,
      translate: theme?.translate ?? defaultTheme.translate,
    );

    return customTheme;
  }

  /// Primary button theme
  static CustomButtonTheme get primaryTheme => CustomButtonTheme(
    backgroundColor: PrimitiveColors.primary,
    foregroundColor: PrimitiveColors.onPrimary,
    backgroundDisabledColor: PrimitiveColors.primaryDisabled,
    foregroundDisabledColor: PrimitiveColors.onPrimaryDisabled,
    radius: AppSize.allRadius12,
    padding: AppSize.horizontalPadding16 + AppSize.verticalPadding12,
    fixHeight: true,
    translate: true,
    showBorder: false,
    loaderColor: PrimitiveColors.onPrimary,
  );

  /// Secondary button theme
  static CustomButtonTheme get secondaryTheme => CustomButtonTheme(
    backgroundColor: PrimitiveColors.secondary,
    foregroundColor: PrimitiveColors.onSecondary,
    backgroundDisabledColor: PrimitiveColors.secondaryDisabled,
    foregroundDisabledColor: PrimitiveColors.onSecondaryDisabled,
    radius: AppSize.allRadius12,
    padding: AppSize.horizontalPadding16 + AppSize.verticalPadding12,
    fixHeight: true,
    translate: true,
    showBorder: false,
    loaderColor: PrimitiveColors.white,
  );

  /// Stroke button theme
  static CustomButtonTheme get strokeTheme => CustomButtonTheme(
    backgroundColor: PrimitiveColors.white,
    foregroundColor: PrimitiveColors.primary,
    backgroundDisabledColor: PrimitiveColors.white,
    foregroundDisabledColor: PrimitiveColors.onPrimaryDisabled,
    radius: AppSize.allRadius12,
    padding: AppSize.horizontalPadding16 + AppSize.verticalPadding12,
    fixHeight: true,
    translate: true,
    showBorder: true,
    loaderColor: PrimitiveColors.primary,
  );

  /// Ghost button theme
  static CustomButtonTheme get ghostTheme => CustomButtonTheme(
    backgroundColor: PrimitiveColors.white,
    foregroundColor: PrimitiveColors.primary,
    backgroundDisabledColor: PrimitiveColors.white,
    foregroundDisabledColor: PrimitiveColors.onPrimaryDisabled,
    radius: AppSize.allRadius12,
    padding: AppSize.horizontalPadding16 + AppSize.verticalPadding12,
    fixHeight: true,
    translate: true,
    showBorder: false,
    loaderColor: PrimitiveColors.primary,
  );

  // Destructive button theme
  static CustomButtonTheme get destructiveTheme => CustomButtonTheme(
    backgroundColor: PrimitiveColors.red,
    foregroundColor: PrimitiveColors.white,
    backgroundDisabledColor: PrimitiveColors.red,
    foregroundDisabledColor: PrimitiveColors.white,
    radius: AppSize.allRadius12,
    padding: AppSize.horizontalPadding16 + AppSize.verticalPadding12,
    fixHeight: true,
    translate: true,
    showBorder: false,
    loaderColor: PrimitiveColors.white,
  );
}
