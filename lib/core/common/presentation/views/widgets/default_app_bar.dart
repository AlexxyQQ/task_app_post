import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../config/constants/gen/assets.gen.dart';
import '../../../../../config/constants/fonts/app_text_style.dart';
import '../../../../../config/constants/size/app_size.constant.dart';
import '../../../../../config/theme/components_theme/picture.theme.dart';
import '../../../../abstract/presentation/abstract.app_color.dart';
import '../../../../di/main.di.dart';
import '../../../domain/services/navigation/navigation.service.dart';
import '../../extensions/size.extension.dart';
import 'app_svg_picture.widget.dart';
import 'app_text.widget.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DefaultAppBar({
    super.key,
    this.actions,
    this.leadingWidget,
    this.titleWidget,
    this.centerTitle = false,
    this.backgroundColor,
    this.title,
    this.leadingAction,
  });

  final List<Widget>? actions;
  final Widget? leadingWidget;
  final Widget? titleWidget;
  final String? title;
  final bool centerTitle;
  final CustomAppColor? backgroundColor;
  final VoidCallback? leadingAction;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      leadingWidth: 80.w,
      title: (title != null)
          ? AppText(title!, style: AppTextStyles.appBar)
          : titleWidget,
      centerTitle: centerTitle,
      leading: sl<NavigationService>().canPop()
          ? leadingWidget ??
                AppSvgPicture.icon(
                  Assets.icons.chevronLeft,
                  alt: 'chevron_left',
                  theme: PictureTheme(
                    containerPadding: 10.allPadding,
                    fit: BoxFit.contain,
                  ),
                  onTap:
                      leadingAction ??
                      () => sl<NavigationService>().maybePopTop(),
                )
          : null,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}
