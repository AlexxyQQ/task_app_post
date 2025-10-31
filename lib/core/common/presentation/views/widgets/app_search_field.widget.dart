import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import '../../../../../../config/constants/colors/primitive_colors.constant.dart';
import '../../../../../config/constants/fonts/all_text_styles.dart';
import '../../../../../config/theme/components_theme/text_form_field.theme.dart';
import '../styles/form.style.dart';
import 'app_icon.widget.dart';
import 'app_text_field.widget.dart';

class AppSearchDropdown<T> extends StatefulWidget {
  const AppSearchDropdown({
    required this.label,
    required this.suggestionsCallback,
    required this.itemBuilder,
    required this.onSelected,
    required this.onClear,
    required this.displayStringForItem,
    super.key,
    this.hint,
    this.validator,
    this.focusNode,
    this.theme,
    this.isDisabled = false,
  });
  final String label;
  final String? hint;
  final Future<List<T>> Function(String) suggestionsCallback;
  final Widget Function(BuildContext, T) itemBuilder;
  final void Function(T) onSelected;
  final void Function() onClear;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;
  final FormFieldTheme? theme;
  final bool isDisabled;
  final String Function(T) displayStringForItem;

  @override
  State<AppSearchDropdown<T>> createState() => _AppSearchDropdownState<T>();
}

class _AppSearchDropdownState<T> extends State<AppSearchDropdown<T>> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final baseTheme = FormStyles.getTheme(widget.theme);
    final effectiveTheme = baseTheme.copyWith(
      enabledBorderColor: widget.isDisabled
          ? PrimitiveColors.primaryDisabled
          : baseTheme.enabledBorderColor,
      focusedBorderColor: widget.isDisabled
          ? PrimitiveColors.primaryDisabled
          : baseTheme.focusedBorderColor,
      errorBorderColor: widget.isDisabled
          ? PrimitiveColors.primaryDisabled
          : baseTheme.errorBorderColor,
      disabledBorderColor: widget.isDisabled
          ? PrimitiveColors.primaryDisabled
          : baseTheme.disabledBorderColor,
      iconColor: widget.isDisabled
          ? PrimitiveColors.onPrimaryDisabled
          : baseTheme.iconColor,
      hintTextStyle: AllTextStyle.f14W4.copyWith(
        color: widget.isDisabled
            ? PrimitiveColors.onPrimaryDisabled
            : baseTheme.hintTextStyle?.color,
      ),
      titleStyle: AllTextStyle.f14W4.copyWith(
        color: widget.isDisabled
            ? PrimitiveColors.onPrimaryDisabled
            : baseTheme.contentStyle?.color,
      ),
      contentStyle: AllTextStyle.f14W4.copyWith(
        color: widget.isDisabled
            ? PrimitiveColors.onPrimaryDisabled
            : baseTheme.contentStyle?.color,
      ),
    );

    return TypeAheadField<T>(
      controller: _controller,
      suggestionsCallback: widget.isDisabled
          ? (a) async => []
          : widget.suggestionsCallback,
      hideOnEmpty: widget.isDisabled,
      builder: (context, typeAheadController, focusNode) {
        return AppTextField.custom(
          titleText: widget.label,
          hintText: widget.hint ?? 'Type to search',
          controller: _controller,
          validator: widget.validator,
          theme: effectiveTheme.copyWith(
            readOnly: widget.isDisabled,
            focusNode: focusNode,
            suffixIcon: _controller.text.isNotEmpty && !widget.isDisabled
                ? AppIcon(
                    Icons.clear,
                    onTap: () {
                      _controller.clear();
                      widget.onClear();
                      setState(() {});
                    },
                  )
                : null,
            prefixIcon: AppIcon(
              Icons.search,
              color: widget.isDisabled
                  ? PrimitiveColors.onPrimaryDisabled
                  : baseTheme.iconColor,
            ),
          ),
        );
      },
      itemBuilder: widget.itemBuilder,
      onSelected: (T item) {
        FocusScope.of(context).unfocus();
        widget.onSelected(item);
        _controller.text = widget.displayStringForItem(item);
        setState(() {});
      },
    );
  }
}
