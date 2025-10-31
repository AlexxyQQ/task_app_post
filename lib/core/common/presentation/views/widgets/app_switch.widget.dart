import 'package:flutter/material.dart';

import '../../../../../config/constants/colors/primitive_colors.constant.dart';
import '../../../../../config/constants/fonts/app_text_style.dart';
import '../../../../../config/constants/size/app_size.constant.dart';
import 'app_text.widget.dart';

class AppSwitchController extends ValueNotifier<bool> {
  AppSwitchController([super.value = false]);

  void toggle() {
    value = !value;
  }

  void setValue(bool newValue) {
    value = newValue;
  }
}

class AppSwitch extends StatefulWidget {
  const AppSwitch({
    super.key,
    this.titleText,
    this.noteText,
    this.controller,
    this.onChanged,
    this.initialValue = false,
    this.titleStyle,
  });
  final String? titleText;
  final String? noteText;
  final AppSwitchController? controller;
  final void Function(bool)? onChanged;
  final bool initialValue;
  final TextStyle? titleStyle;

  @override
  State<AppSwitch> createState() => _AppSwitchState();
}

class _AppSwitchState extends State<AppSwitch> {
  late AppSwitchController _controller;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? AppSwitchController(widget.initialValue);
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  void _handleChanged(bool value) {
    _controller.setValue(value);
    widget.onChanged?.call(value);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.titleText?.isNotEmpty == true) ...[
          Row(
            children: [
              Expanded(
                child: AppText(
                  widget.titleText ?? '',
                  style: widget.titleStyle ?? AppTextStyles.body,
                ),
              ),
              ValueListenableBuilder<bool>(
                valueListenable: _controller,
                builder: (context, value, child) {
                  return Switch(
                    value: value,
                    onChanged: _handleChanged,
                    activeThumbColor: Theme.of(context).primaryColor,
                    inactiveThumbColor: PrimitiveColors.onPrimaryDisabled,
                    inactiveTrackColor: PrimitiveColors.stroke,
                  );
                },
              ),
            ],
          ),
        ] else ...[
          ValueListenableBuilder<bool>(
            valueListenable: _controller,
            builder: (context, value, child) {
              return Switch(
                value: value,
                onChanged: _handleChanged,
                activeThumbColor: Theme.of(context).primaryColor,
                inactiveThumbColor: PrimitiveColors.onPrimaryDisabled,
                inactiveTrackColor: PrimitiveColors.stroke,
              );
            },
          ),
        ],
        if (widget.noteText?.isNotEmpty == true) ...[
          AppSize.verticalMargin4,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                Icons.info_outline,
                size: 16,
                color: PrimitiveColors.hintText,
              ),
              AppSize.horizontalMargin4,
              Expanded(
                child: AppText(
                  widget.noteText ?? '',
                  style: AppTextStyles.caption.copyWith(
                    color: PrimitiveColors.hintText,
                  ),
                ),
              ),
            ],
          ),
        ],
      ],
    );
  }
}
