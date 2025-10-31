import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/constants/colors/primitive_colors.constant.dart';
import '../../../../../config/constants/fonts/all_text_styles.dart';
import '../../../../../config/constants/size/app_size.constant.dart';
import '../../../../../config/theme/components_theme/app_icon.theme.dart';
import '../../../../../config/theme/components_theme/picture.theme.dart';
import '../../../../../config/theme/components_theme/text_form_field.theme.dart';
import '../../extensions/size.extension.dart';
import '../styles/form.style.dart';
import '../widgets/app_icon.widget.dart';
import '../widgets/app_svg_picture.widget.dart';
import '../widgets/app_text.widget.dart';

class KTextFormField extends StatefulWidget {
  const KTextFormField({
    super.key,
    this.hintText,
    this.labelText,
    this.titleText,
    this.noteText,
    this.controller,
    this.validator,
    this.onChanged,
    this.onSaved,
    this.onFieldSubmitted,
    this.onEditingComplete,
    this.onTap,
    this.theme,
  });
  final String? hintText;
  final String? labelText;
  final String? titleText;
  final String? noteText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String?)? onChanged;
  final void Function(String?)? onSaved;
  final void Function(String?)? onFieldSubmitted;
  final void Function()? onEditingComplete;
  final void Function()? onTap;
  final FormFieldTheme? theme;

  @override
  State<KTextFormField> createState() => _KTextFormFieldState();
}

class _KTextFormFieldState extends State<KTextFormField> {
  final ValueNotifier<bool> _isObscured = ValueNotifier(
    true,
  ); // Initial state for password visibility

  final textFocus = FocusNode();

  // Get the effective theme by merging widget properties with theme
  FormFieldTheme get _effectiveTheme {
    return FormStyles.getTheme(widget.theme);
  }

  @override
  Widget build(BuildContext context) {
    final theme = _effectiveTheme;

    return ValueListenableBuilder(
      valueListenable: TextEditingController(),
      builder: (context, _, __) {
        return ValueListenableBuilder(
          valueListenable: _isObscured,
          builder: (context, isObscured, child) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: widget.titleText?.isEmpty == false
                  ? CrossAxisAlignment.start
                  : CrossAxisAlignment.center,
              children: [
                if (widget.titleText?.isEmpty == false) ...[
                  AppText(
                    widget.titleText ?? '',
                    style: theme.titleStyle ?? AllTextStyle.f14W5,
                  ),
                  AppSize.verticalMargin4,
                ],
                if (widget.noteText?.isEmpty == false) ...[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.info_outline,
                        size: 16.r,
                        color: PrimitiveColors.hintText,
                      ),
                      AppSize.horizontalMargin4,
                      Expanded(
                        child: AppText.note(data: widget.noteText ?? ''),
                      ),
                    ],
                  ),
                  AppSize.verticalMargin4,
                ],
                TextFormField(
                  autofillHints: theme.autofillHints,
                  readOnly: theme.readOnly ?? false,
                  controller: widget.controller,
                  textAlign: theme.textAlign ?? TextAlign.start,
                  keyboardType: theme.keyboardType,
                  obscuringCharacter: theme.obscuringCharacter ?? '●',
                  obscureText: theme.isPasswordField ?? false
                      ? isObscured
                      : theme.obscureText ?? false,
                  inputFormatters: theme.inputFormatters,
                  enableSuggestions: theme.enableSuggestions ?? true,
                  autocorrect: theme.autocorrect ?? true,
                  textInputAction: theme.inputAction,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  enableIMEPersonalizedLearning:
                      theme.enableIMEPersonalizedLearning ?? true,
                  style: theme.contentStyle ?? AllTextStyle.f14W5,
                  focusNode: theme.focusNode ?? textFocus,
                  maxLines: theme.maxLines,
                  maxLength: theme.maxLength,
                  decoration: InputDecoration(
                    contentPadding: theme.contentPadding,
                    counterText: '',
                    errorMaxLines: theme.errorMaxLines,
                    fillColor: theme.fillColor,
                    hintText: widget.hintText,
                    hintStyle: theme.hintTextStyle,
                    labelText: widget.labelText,
                    prefixIcon: theme.prefixIcon,
                    hintTextDirection: TextDirection.ltr,
                    suffixIcon: theme.isPasswordField ?? false
                        ? GestureDetector(
                            onTap: _toggleObscureText,
                            child: Container(
                              padding: 12.allPadding,
                              width: 10.w,
                              child: AppIcon(
                                isObscured
                                    ? Icons.visibility_off
                                    : Icons.visibility_outlined,
                                size: 10.h,
                                theme: AppIconTheme(color: theme.iconColor),
                              ),
                            ),
                          )
                        : theme.suffixIcon,
                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: (theme.noBorder ?? false)
                            ? Colors.transparent
                            : theme.disabledBorderColor ?? Colors.transparent,
                        width: theme.borderWidth ?? 1.0,
                      ),
                      borderRadius: theme.borderRadius ?? AppSize.allRadius12,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: (theme.noBorder ?? false)
                            ? Colors.transparent
                            : theme.enabledBorderColor ?? Colors.transparent,
                        width: theme.borderWidth ?? 1.0,
                      ),
                      borderRadius: theme.borderRadius ?? AppSize.allRadius12,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: (theme.noBorder ?? false)
                            ? Colors.transparent
                            : theme.focusedBorderColor ?? Colors.transparent,
                        width: theme.borderWidth ?? 1.0,
                      ),
                      borderRadius: theme.borderRadius ?? AppSize.allRadius12,
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: (theme.noBorder ?? false)
                            ? Colors.transparent
                            : theme.errorBorderColor ?? Colors.transparent,
                        width: theme.borderWidth ?? 1.0,
                      ),
                      borderRadius: theme.borderRadius ?? AppSize.allRadius12,
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: (theme.noBorder ?? false)
                            ? Colors.transparent
                            : theme.errorBorderColor ?? Colors.transparent,
                        width: theme.borderWidth ?? 1.0,
                      ),
                      borderRadius: theme.borderRadius ?? AppSize.allRadius12,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: (theme.noBorder ?? false)
                            ? Colors.transparent
                            : theme.enabledBorderColor ?? Colors.transparent,
                        width: theme.borderWidth ?? 1.0,
                      ),
                      borderRadius: theme.borderRadius ?? AppSize.allRadius12,
                    ),
                  ),
                  validator: widget.validator,
                  onChanged: widget.onChanged,
                  onSaved: widget.onSaved,
                  onFieldSubmitted: widget.onFieldSubmitted,
                  onEditingComplete: widget.onEditingComplete,
                  onTap: widget.onTap,
                  onTapOutside: (details) {
                    textFocus.unfocus();
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }

  void _toggleObscureText() {
    _isObscured.value = !_isObscured.value;
  }
}
