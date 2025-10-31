import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../config/constants/size/app_size.constant.dart';
import '../../../../../config/constants/colors/primitive_colors.constant.dart';
import '../../../../../config/constants/fonts/all_text_styles.dart';
import '../../../../../config/theme/components_theme/text_form_field.theme.dart';
import '../styles/form.style.dart';
import 'app_text.widget.dart';

class AppDropdownController<T> extends ValueNotifier<T?> {
  AppDropdownController([super.value]);
  bool _isValid = true;
  String? _errorText;

  bool get isValid => _isValid;
  String? get errorText => _errorText;

  void setValue(T? newValue) {
    if (value != newValue) {
      value = newValue;
      _isValid = true;
      _errorText = null;
    }
  }

  void setError(String error) {
    _isValid = false;
    _errorText = error;
    notifyListeners();
  }

  void clearError() {
    _isValid = true;
    _errorText = null;
    notifyListeners();
  }

  void reset() {
    value = null;
    _isValid = true;
    _errorText = null;
    notifyListeners();
  }
}

class AppDropdown<T> extends StatefulWidget {
  const AppDropdown({
    required this.items,
    super.key,
    this.hintText,
    this.labelText,
    this.titleText,
    this.noteText,
    this.controller,
    this.onChanged,
    this.validator,
    this.theme,
  });
  final String? hintText;
  final String? labelText;
  final String? titleText;
  final String? noteText;
  final AppDropdownController<T>? controller;
  final List<DropdownMenuItem<T>> items;
  final void Function(T?)? onChanged;
  final String? Function(T?)? validator;
  final FormFieldTheme? theme;

  // Get the effective theme by merging widget properties with theme
  FormFieldTheme get _effectiveTheme {
    return FormStyles.getTheme(theme);
  }

  @override
  State<AppDropdown<T>> createState() => _AppDropdownState<T>();
}

class _AppDropdownState<T> extends State<AppDropdown<T>> {
  late AppDropdownController<T> _controller;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? AppDropdownController<T>();
    _focusNode = FocusNode();
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  void _onFocusChange() {
    if (!_focusNode.hasFocus && widget.validator != null) {
      final error = widget.validator!(_controller.value);
      if (error != null) {
        _controller.setError(error);
      } else {
        _controller.clearError();
      }
    }
  }

  void _handleChanged(T? value) {
    _controller.setValue(value);
    widget.onChanged?.call(value);
  }

  @override
  Widget build(BuildContext context) {
    final theme = widget._effectiveTheme;

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
              Expanded(child: AppText.note(data: widget.noteText ?? '')),
            ],
          ),
          AppSize.verticalMargin4,
        ],
        ValueListenableBuilder(
          valueListenable: _controller,
          builder: (context, _, __) {
            return DropdownButtonFormField<T>(
              initialValue: _controller.value,
              items: widget.items,
              onChanged: _handleChanged,
              validator: widget.validator,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              style: theme.contentStyle ?? AllTextStyle.f14W5,
              focusNode: _focusNode,
              focusColor: theme.fillColor,
              decoration: InputDecoration(
                prefixIcon: theme.prefixIcon,
                suffixIcon: theme.suffixIcon,
                hintText: widget.hintText,
                labelText: widget.labelText,
                hintStyle: theme.hintTextStyle,
                labelStyle: theme.labelTextStyle,
                errorStyle: theme.errorTextStyle,
                errorText: _controller.errorText,
                errorMaxLines: theme.errorMaxLines,
                fillColor: theme.fillColor,
                contentPadding: theme.contentPadding,
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
              icon: Icon(Icons.arrow_drop_down, color: theme.iconColor),
              isExpanded: true,
              hint: AppText(widget.hintText ?? '', style: theme.hintTextStyle),
            );
          },
        ),
      ],
    );
  }
}
