import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/constants/colors/primitive_colors.constant.dart';
import '../../../../../config/constants/fonts/all_text_styles.dart';
import '../../../../../config/constants/size/app_size.constant.dart';
import '../../../../../config/theme/components_theme/picture.theme.dart';
import '../../../../abstract/presentation/abstract.app_color.dart';
import 'app_icon.widget.dart';
import 'app_svg_picture.widget.dart';
import 'app_text.widget.dart';

class AppChipWidget extends StatelessWidget {
  factory AppChipWidget.icon({
    required bool isSelected,
    required CustomAppColor color,
    required IconData selectedIcon,
    required IconData unselectedIcon,
    required VoidCallback onTap,
    required String title,
    Key? key,
  }) {
    return AppChipWidget._(
      key: key,
      isSelected: isSelected,
      color: color,
      selectedIcon: selectedIcon,
      unselectedIcon: unselectedIcon,
      onTap: onTap,
      title: title,
      noBlend: false,
    );
  }

  factory AppChipWidget.svg({
    required bool isSelected,
    required CustomAppColor color,
    required String selectedSvgAsset,
    required String unselectedSvgAsset,
    required VoidCallback onTap,
    required String title,
    bool noBlend = false,
    Key? key,
  }) {
    return AppChipWidget._(
      key: key,
      isSelected: isSelected,
      color: color,
      selectedSvgAsset: selectedSvgAsset,
      unselectedSvgAsset: unselectedSvgAsset,
      onTap: onTap,
      title: title,
      noBlend: noBlend,
    );
  }

  factory AppChipWidget.detail({
    required bool isSelected,
    required CustomAppColor color,
    required VoidCallback onTap,
    required String title,
    Key? key,
  }) {
    return AppChipWidget._(
      key: key,
      isSelected: isSelected,
      color: color,
      onTap: onTap,
      title: title,
      noBlend: false,
    );
  }
  const AppChipWidget._({
    required this.isSelected,
    required this.color,
    required this.noBlend,
    required this.onTap,
    required this.title,
    super.key,
    this.unselectedIcon,
    this.selectedIcon,
    this.selectedSvgAsset,
    this.unselectedSvgAsset,
  });

  final bool isSelected;
  final CustomAppColor color;
  final IconData? unselectedIcon;
  final IconData? selectedIcon;
  final String? selectedSvgAsset;
  final String? unselectedSvgAsset;
  final VoidCallback onTap;
  final String title;
  final bool noBlend;

  @override
  Widget build(BuildContext context) {
    final textColor = isSelected ? color : PrimitiveColors.greyVariant800;
    final borderColor = isSelected ? color : PrimitiveColors.stroke;
    final bgColor = isSelected
        ? color.withValues(alpha: 0.2)
        : PrimitiveColors.transparent;

    final iconToUse = isSelected
        ? selectedIcon ?? unselectedIcon
        : unselectedIcon ?? selectedIcon;

    final svgToUse = isSelected
        ? selectedSvgAsset ?? unselectedSvgAsset
        : unselectedSvgAsset ?? selectedSvgAsset;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: AppSize.horizontalPadding12 + AppSize.verticalPadding6,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: AppSize.allRadius16,
          border: Border.all(color: borderColor),
        ),
        child: (svgToUse != null || iconToUse != null)
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (svgToUse != null)
                    AppSvgPicture.fromAsset(
                      alt: '',
                      svgToUse,
                      height: 20.r,
                      theme: (isSelected && noBlend)
                          ? null
                          : PictureTheme(color: textColor),
                    )
                  else if (iconToUse != null)
                    AppIcon(iconToUse, size: 26.r, color: textColor),
                  AppSize.horizontalMargin6,
                  AppText(
                    title,
                    style: AllTextStyle.f14W6.copyWith(color: textColor),
                  ),
                ],
              )
            : AppText(
                title,
                style: AllTextStyle.f14W6.copyWith(color: textColor),
              ),
      ),
    );
  }
}
