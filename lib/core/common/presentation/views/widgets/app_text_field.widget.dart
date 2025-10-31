import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../config/theme/components_theme/text_form_field.theme.dart';
import '../components/text_form_field.component.dart';
import '../styles/form.style.dart';

class AppTextField extends StatelessWidget {
  const AppTextField._({
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

  //
  factory AppTextField.password({
    String? hintText,
    String? labelText,
    String? titleText,
    String? noteText,
    TextEditingController? controller,
    String? Function(String?)? validator,
    void Function(String?)? onChanged,
    void Function(String?)? onSaved,
    void Function(String?)? onFieldSubmitted,
    void Function()? onEditingComplete,
    void Function()? onTap,
    FormFieldTheme? theme,
  }) {
    return AppTextField._(
      hintText: hintText,
      labelText: labelText,
      titleText: titleText,
      noteText: noteText,
      controller: controller,
      validator: validator,
      onChanged: onChanged,
      onSaved: onSaved,
      onFieldSubmitted: onFieldSubmitted,
      onEditingComplete: onEditingComplete,
      onTap: onTap,
      theme: theme != null
          ? theme.copyWith(isPasswordField: true)
          : FormStyles.getTheme(theme).copyWith(isPasswordField: true),
    );
  }

  //Custom
  factory AppTextField.custom({
    String? hintText,
    String? labelText,
    String? titleText,
    String? noteText,
    TextEditingController? controller,
    String? Function(String?)? validator,
    void Function(String?)? onChanged,
    void Function(String?)? onSaved,
    void Function(String?)? onFieldSubmitted,
    void Function()? onEditingComplete,
    void Function()? onTap,
    FormFieldTheme? theme,
  }) {
    return AppTextField._(
      hintText: hintText,
      labelText: labelText,
      titleText: titleText,
      noteText: noteText,
      controller: controller,
      validator: validator,
      onChanged: onChanged,
      onSaved: onSaved,
      onFieldSubmitted: onFieldSubmitted,
      onEditingComplete: onEditingComplete,
      onTap: onTap,
      theme: FormStyles.getTheme(theme),
    );
  }

  factory AppTextField.search({
    String? hintText,
    String? labelText,
    String? titleText,
    String? noteText,
    TextEditingController? controller,
    String? Function(String?)? validator,
    void Function(String?)? onChanged,
    void Function(String?)? onSaved,
    void Function(String?)? onFieldSubmitted,
    void Function()? onEditingComplete,
    void Function()? onTap,
    FormFieldTheme? theme,
  }) {
    return AppTextField._(
      hintText: hintText ?? 'Search...',
      labelText: labelText,
      titleText: titleText,
      noteText: noteText,
      controller: controller,
      validator: validator,
      onChanged: onChanged,
      onSaved: onSaved,
      onFieldSubmitted: onFieldSubmitted,
      onEditingComplete: onEditingComplete,
      onTap: onTap,
      theme: FormStyles.getTheme(
        theme,
      ).copyWith(prefixIcon: const Icon(Icons.search)),
    );
  }
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
  Widget build(BuildContext context) {
    // Create a theme that combines the form styles with any custom theme provided
    print('theme: $theme');

    return KTextFormField(
      labelText: labelText,
      titleText: titleText,
      hintText: hintText?.tr(),
      controller: controller,
      validator: validator,
      onChanged: onChanged != null ? (value) => onChanged!(value ?? '') : null,
      theme: FormStyles.getTheme(theme),
      onTap: onTap,
      noteText: noteText,
      onSaved: onSaved,
      onFieldSubmitted: onFieldSubmitted,
      onEditingComplete: onEditingComplete,
    );
  }
}
