import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/constants/colors/primitive_colors.constant.dart';
import '../../../../../config/constants/fonts/app_text_style.dart';
import '../../../../../config/constants/gen/locale_keys.g.dart';
import '../../../../../config/constants/size/app_size.constant.dart';
import '../../extensions/size.extension.dart';
import '../styles/button.style.dart';
import 'app_bottom_sheet.widget.dart';
import 'app_button.widget.dart';
import 'app_text.widget.dart';

class DeleteItemBottomSheet extends StatelessWidget {
  const DeleteItemBottomSheet({
    required this.onDelete,
    required this.description,
    required this.title,
    super.key,
  });
  final VoidCallback onDelete;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header with warning icon
        Row(
          children: [
            Container(
              padding: 12.allPadding,
              decoration: BoxDecoration(
                color: PrimitiveColors.red.withValues(alpha: 0.1),
                borderRadius: 12.borderCircular,
              ),
              child: Icon(
                Icons.warning_outlined,
                color: PrimitiveColors.red,
                size: 24.sp,
              ),
            ),
            16.horizontalGap,
            Expanded(child: AppText(title, style: AppTextStyles.headline)),
          ],
        ),

        20.verticalGap,

        // Warning message
        AppText(description, style: AppTextStyles.body),

        8.verticalGap,

        AppText(
          LocaleKeys
              .core_common_presentation_views_widgets_deleteItemBottomSheetWidget_subTitle,
          style: AppTextStyles.caption,
        ),

        20.verticalGap,

        // Action buttons
        Row(
          children: [
            Expanded(
              child: AppButton.stroke(
                onPressed: () => Navigator.of(context).pop(),
                label: LocaleKeys.common_words_cancel,
              ),
            ),
            16.horizontalGap,
            Expanded(
              child: AppButton.custom(
                theme: ButtonStyles.destructiveTheme,
                onPressed: () {
                  onDelete();
                  Navigator.of(context).pop();
                },
                label: LocaleKeys.common_words_delete,
              ),
            ),
          ],
        ),
        24.verticalGap,
      ],
    );
  }

  /// Static method to show the delete confirmation bottom sheet
  static Future<void> show({
    required BuildContext context,
    required String title,
    required String description,
    required VoidCallback onDelete,
  }) {
    return AppBottomSheet.show(
      backgroundColor: PrimitiveColors.white,
      context: context,
      padding: AppSize.allPadding16,
      child: DeleteItemBottomSheet(
        description: description,
        onDelete: onDelete,
        title: title,
      ),
    );
  }
}
