import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/constants/colors/primitive_colors.constant.dart';
import '../../../../../config/constants/fonts/all_text_styles.dart';
import '../../../../../config/constants/size/app_size.constant.dart';
import 'app_text.widget.dart';

class NoItemFoundWidget extends StatelessWidget {
  const NoItemFoundWidget({
    required this.icon,
    required this.title,
    required this.subtitle,
    super.key,
    this.actionWidget,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final Widget? actionWidget;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: AppSize.allPadding32,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 64.r, color: PrimitiveColors.grey700),
            AppSize.verticalMargin16,
            AppText(
              title,
              style: AllTextStyle.f18W6,
              textAlign: TextAlign.center,
            ),
            AppSize.verticalMargin8,
            AppText(
              subtitle,
              textAlign: TextAlign.center,
              style: AllTextStyle.f14W4.copyWith(
                color: PrimitiveColors.grey600,
              ),
            ),
            AppSize.verticalMargin16,
            if (actionWidget != null) actionWidget!,
          ],
        ),
      ),
    );
  }
}
