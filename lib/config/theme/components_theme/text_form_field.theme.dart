import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/abstract/presentation/abstract.app_color.dart';

class FormFieldTheme {
  const FormFieldTheme({
    this.fillColor,
    this.contentStyle,
    this.hintTextStyle,
    this.labelTextStyle,
    this.titleStyle,
    this.errorTextStyle,
    this.borderRadius,
    this.enabledBorderColor,
    this.focusedBorderColor,
    this.errorBorderColor,
    this.disabledBorderColor,
    this.borderWidth,
    this.contentPadding,
    this.noBorder,
    this.iconColor,
    this.errorMaxLines,
    this.enableSuggestions,
    this.autocorrect,
    this.enableIMEPersonalizedLearning,
    this.textAlign,
    this.maxLines,
    this.readOnly,
    this.maxLength,
    this.inputAction,
    this.autofillHints,
    this.inputFormatters,
    this.keyboardType,
    this.obscureText,
    this.prefixIcon,
    this.suffixIcon,
    this.focusNode,
    this.isPasswordField,
    this.obscuringCharacter,
  });
  final CustomAppColor? fillColor;
  final TextStyle? contentStyle;
  final TextStyle? hintTextStyle;
  final TextStyle? labelTextStyle;
  final TextStyle? titleStyle;
  final TextStyle? errorTextStyle;
  final BorderRadius? borderRadius;
  final CustomAppColor? enabledBorderColor;
  final CustomAppColor? focusedBorderColor;
  final CustomAppColor? errorBorderColor;
  final CustomAppColor? disabledBorderColor;
  final double? borderWidth;
  final EdgeInsetsGeometry? contentPadding;
  final bool? noBorder;
  final CustomAppColor? iconColor;
  final int? errorMaxLines;
  final bool? enableSuggestions;
  final bool? autocorrect;
  final bool? enableIMEPersonalizedLearning;
  final TextAlign? textAlign;
  final int? maxLines;
  final bool? readOnly;
  final int? maxLength;
  final TextInputAction? inputAction;
  final List<String>? autofillHints;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final FocusNode? focusNode;
  final bool? isPasswordField;
  final String? obscuringCharacter;

  FormFieldTheme copyWith({
    CustomAppColor? fillColor,
    TextStyle? contentStyle,
    TextStyle? hintTextStyle,
    TextStyle? labelTextStyle,
    TextStyle? titleStyle,
    TextStyle? errorTextStyle,
    BorderRadius? borderRadius,
    CustomAppColor? enabledBorderColor,
    CustomAppColor? focusedBorderColor,
    CustomAppColor? errorBorderColor,
    CustomAppColor? disabledBorderColor,
    double? borderWidth,
    EdgeInsetsGeometry? contentPadding,
    bool? noBorder,
    CustomAppColor? iconColor,
    int? errorMaxLines,
    bool? enableSuggestions,
    bool? autocorrect,
    bool? enableIMEPersonalizedLearning,
    TextAlign? textAlign,
    int? maxLines,
    bool? readOnly,
    int? maxLength,
    TextInputAction? inputAction,
    List<String>? autofillHints,
    List<TextInputFormatter>? inputFormatters,
    TextInputType? keyboardType,
    bool? obscureText,
    Widget? prefixIcon,
    Widget? suffixIcon,
    FocusNode? focusNode,
    bool? isPasswordField,
    String? obscuringCharacter,
  }) {
    return FormFieldTheme(
      fillColor: fillColor ?? this.fillColor,
      contentStyle: contentStyle ?? this.contentStyle,
      hintTextStyle: hintTextStyle ?? this.hintTextStyle,
      labelTextStyle: labelTextStyle ?? this.labelTextStyle,
      titleStyle: titleStyle ?? this.titleStyle,
      errorTextStyle: errorTextStyle ?? this.errorTextStyle,
      borderRadius: borderRadius ?? this.borderRadius,
      enabledBorderColor: enabledBorderColor ?? this.enabledBorderColor,
      focusedBorderColor: focusedBorderColor ?? this.focusedBorderColor,
      errorBorderColor: errorBorderColor ?? this.errorBorderColor,
      disabledBorderColor: disabledBorderColor ?? this.disabledBorderColor,
      borderWidth: borderWidth ?? this.borderWidth,
      contentPadding: contentPadding ?? this.contentPadding,
      noBorder: noBorder ?? this.noBorder,
      iconColor: iconColor ?? this.iconColor,
      errorMaxLines: errorMaxLines ?? this.errorMaxLines,
      enableSuggestions: enableSuggestions ?? this.enableSuggestions,
      autocorrect: autocorrect ?? this.autocorrect,
      enableIMEPersonalizedLearning:
          enableIMEPersonalizedLearning ?? this.enableIMEPersonalizedLearning,
      textAlign: textAlign ?? this.textAlign,
      maxLines: maxLines ?? this.maxLines,
      readOnly: readOnly ?? this.readOnly,
      maxLength: maxLength ?? this.maxLength,
      inputAction: inputAction ?? this.inputAction,
      autofillHints: autofillHints ?? this.autofillHints,
      inputFormatters: inputFormatters ?? this.inputFormatters,
      keyboardType: keyboardType ?? this.keyboardType,
      obscureText: obscureText ?? this.obscureText,
      prefixIcon: prefixIcon ?? this.prefixIcon,
      suffixIcon: suffixIcon ?? this.suffixIcon,
      focusNode: focusNode ?? this.focusNode,
      isPasswordField: isPasswordField ?? this.isPasswordField,
      obscuringCharacter: obscuringCharacter ?? this.obscuringCharacter,
    );
  }

  @override
  String toString() {
    return 'FormFieldTheme(fillColor: $fillColor, contentStyle: $contentStyle, hintTextStyle: $hintTextStyle, labelTextStyle: $labelTextStyle, titleStyle: $titleStyle, errorTextStyle: $errorTextStyle, borderRadius: $borderRadius, enabledBorderColor: $enabledBorderColor, focusedBorderColor: $focusedBorderColor, errorBorderColor: $errorBorderColor, disabledBorderColor: $disabledBorderColor, borderWidth: $borderWidth, contentPadding: $contentPadding, noBorder: $noBorder, iconColor: $iconColor, errorMaxLines: $errorMaxLines, enableSuggestions: $enableSuggestions, autocorrect: $autocorrect, enableIMEPersonalizedLearning: $enableIMEPersonalizedLearning, textAlign: $textAlign, maxLines: $maxLines, readOnly: $readOnly, maxLength: $maxLength, inputAction: $inputAction, autofillHints: $autofillHints, inputFormatters: $inputFormatters, keyboardType: $keyboardType, obscureText: $obscureText, prefixIcon: $prefixIcon, suffixIcon: $suffixIcon, focusNode: $focusNode, isPasswordField: $isPasswordField, obscuringCharacter: $obscuringCharacter)';
  }

  @override
  bool operator ==(covariant FormFieldTheme other) {
    if (identical(this, other)) return true;

    return other.fillColor == fillColor &&
        other.contentStyle == contentStyle &&
        other.hintTextStyle == hintTextStyle &&
        other.labelTextStyle == labelTextStyle &&
        other.titleStyle == titleStyle &&
        other.errorTextStyle == errorTextStyle &&
        other.borderRadius == borderRadius &&
        other.enabledBorderColor == enabledBorderColor &&
        other.focusedBorderColor == focusedBorderColor &&
        other.errorBorderColor == errorBorderColor &&
        other.disabledBorderColor == disabledBorderColor &&
        other.borderWidth == borderWidth &&
        other.contentPadding == contentPadding &&
        other.noBorder == noBorder &&
        other.iconColor == iconColor &&
        other.errorMaxLines == errorMaxLines &&
        other.enableSuggestions == enableSuggestions &&
        other.autocorrect == autocorrect &&
        other.enableIMEPersonalizedLearning == enableIMEPersonalizedLearning &&
        other.textAlign == textAlign &&
        other.maxLines == maxLines &&
        other.readOnly == readOnly &&
        other.maxLength == maxLength &&
        other.inputAction == inputAction &&
        listEquals(other.autofillHints, autofillHints) &&
        listEquals(other.inputFormatters, inputFormatters) &&
        other.keyboardType == keyboardType &&
        other.obscureText == obscureText &&
        other.prefixIcon == prefixIcon &&
        other.suffixIcon == suffixIcon &&
        other.focusNode == focusNode &&
        other.isPasswordField == isPasswordField &&
        other.obscuringCharacter == obscuringCharacter;
  }

  @override
  int get hashCode {
    return fillColor.hashCode ^
        contentStyle.hashCode ^
        hintTextStyle.hashCode ^
        labelTextStyle.hashCode ^
        titleStyle.hashCode ^
        errorTextStyle.hashCode ^
        borderRadius.hashCode ^
        enabledBorderColor.hashCode ^
        focusedBorderColor.hashCode ^
        errorBorderColor.hashCode ^
        disabledBorderColor.hashCode ^
        borderWidth.hashCode ^
        contentPadding.hashCode ^
        noBorder.hashCode ^
        iconColor.hashCode ^
        errorMaxLines.hashCode ^
        enableSuggestions.hashCode ^
        autocorrect.hashCode ^
        enableIMEPersonalizedLearning.hashCode ^
        textAlign.hashCode ^
        maxLines.hashCode ^
        readOnly.hashCode ^
        maxLength.hashCode ^
        inputAction.hashCode ^
        autofillHints.hashCode ^
        inputFormatters.hashCode ^
        keyboardType.hashCode ^
        obscureText.hashCode ^
        prefixIcon.hashCode ^
        suffixIcon.hashCode ^
        focusNode.hashCode ^
        isPasswordField.hashCode ^
        obscuringCharacter.hashCode;
  }
}
