import 'dart:ui';

import '../../../../../config/constants/colors/primitive_colors.constant.dart';
import '../../../../../config/constants/fonts/all_text_styles.dart';
import '../../../../../config/constants/size/app_size.constant.dart';
import '../../../../../config/theme/components_theme/text_form_field.theme.dart';

class FormStyles {
  /// Creates a KTextFormFieldTheme based on the current context's theme
  static FormFieldTheme getTheme(FormFieldTheme? theme) {
    final defaultTheme = FormFieldTheme(
      fillColor: PrimitiveColors.stroke,
      borderRadius: AppSize.allRadius12,
      contentStyle: AllTextStyle.f14W5,
      hintTextStyle: AllTextStyle.f14W5.copyWith(
        color: PrimitiveColors.hintText,
      ),
      titleStyle: AllTextStyle.f14W5,
      contentPadding: AppSize.horizontalPadding16 + AppSize.verticalPadding12,
      enabledBorderColor: PrimitiveColors.stroke,
      focusedBorderColor: PrimitiveColors.primary,
      errorBorderColor: PrimitiveColors.red,
      disabledBorderColor: PrimitiveColors.stroke,
      borderWidth: 1.0,
      noBorder: false,
      iconColor: PrimitiveColors.black,
      errorMaxLines: 1,
      enableSuggestions: true,
      autocorrect: true,
      enableIMEPersonalizedLearning: true,
      textAlign: TextAlign.start,
      maxLines: 1,
      readOnly: false,
      isPasswordField: false,
      obscuringCharacter: '●',
    );
    final customTheme = defaultTheme.copyWith(
      fillColor: theme?.fillColor ?? defaultTheme.fillColor,
      contentStyle: theme?.contentStyle ?? defaultTheme.contentStyle,
      hintTextStyle: theme?.hintTextStyle ?? defaultTheme.hintTextStyle,
      labelTextStyle: theme?.labelTextStyle ?? defaultTheme.labelTextStyle,
      titleStyle: theme?.titleStyle ?? defaultTheme.titleStyle,
      errorTextStyle: theme?.errorTextStyle ?? defaultTheme.errorTextStyle,
      borderRadius: theme?.borderRadius ?? defaultTheme.borderRadius,
      enabledBorderColor:
          theme?.enabledBorderColor ?? defaultTheme.enabledBorderColor,
      focusedBorderColor:
          theme?.focusedBorderColor ?? defaultTheme.focusedBorderColor,
      errorBorderColor:
          theme?.errorBorderColor ?? defaultTheme.errorBorderColor,
      disabledBorderColor:
          theme?.disabledBorderColor ?? defaultTheme.disabledBorderColor,
      borderWidth: theme?.borderWidth ?? defaultTheme.borderWidth,
      contentPadding: theme?.contentPadding ?? defaultTheme.contentPadding,
      noBorder: theme?.noBorder ?? defaultTheme.noBorder,
      iconColor: theme?.iconColor ?? defaultTheme.iconColor,
      errorMaxLines: theme?.errorMaxLines ?? defaultTheme.errorMaxLines,
      enableSuggestions:
          theme?.enableSuggestions ?? defaultTheme.enableSuggestions,
      autocorrect: theme?.autocorrect ?? defaultTheme.autocorrect,
      enableIMEPersonalizedLearning:
          theme?.enableIMEPersonalizedLearning ??
          defaultTheme.enableIMEPersonalizedLearning,
      textAlign: theme?.textAlign ?? defaultTheme.textAlign,
      maxLines: theme?.maxLines ?? defaultTheme.maxLines,
      readOnly: theme?.readOnly ?? defaultTheme.readOnly,
      maxLength: theme?.maxLength ?? defaultTheme.maxLength,
      inputAction: theme?.inputAction ?? defaultTheme.inputAction,
      autofillHints: theme?.autofillHints ?? defaultTheme.autofillHints,
      inputFormatters: theme?.inputFormatters ?? defaultTheme.inputFormatters,
      keyboardType: theme?.keyboardType ?? defaultTheme.keyboardType,
      obscureText: theme?.obscureText ?? defaultTheme.obscureText,
      prefixIcon: theme?.prefixIcon ?? defaultTheme.prefixIcon,
      suffixIcon: theme?.suffixIcon ?? defaultTheme.suffixIcon,
      focusNode: theme?.focusNode ?? defaultTheme.focusNode,
      isPasswordField: theme?.isPasswordField ?? defaultTheme.isPasswordField,
      obscuringCharacter:
          theme?.obscuringCharacter ?? defaultTheme.obscuringCharacter,
    );

    return customTheme;
  }
}
