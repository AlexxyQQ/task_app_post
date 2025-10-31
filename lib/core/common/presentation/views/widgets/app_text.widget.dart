import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../../config/constants/colors/primitive_colors.constant.dart';
import '../../../../../../config/constants/fonts/all_text_styles.dart';

class AppText extends StatelessWidget {
  const AppText(
    this.data, {
    super.key,
    this.style,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.translate = true,
  });

  factory AppText.note({
    required String data,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) {
    return AppText(
      data,
      style: AllTextStyle.f10W4.copyWith(
        color: PrimitiveColors.hintText,
        fontStyle: FontStyle.italic,
      ),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
  final String data;
  final TextStyle? style;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final bool translate;

  @override
  Widget build(BuildContext context) {
    return Text(
      translate ? data.tr() : data,
      style: style,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}
