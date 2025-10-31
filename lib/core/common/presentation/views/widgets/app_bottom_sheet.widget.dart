import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../config/constants/colors/primitive_colors.constant.dart';
import '../../../../../../config/constants/size/app_size.constant.dart';

class AppBottomSheet extends StatelessWidget {
  const AppBottomSheet({
    required this.child,
    super.key,
    this.height,
    this.padding,
    this.backgroundColor,
    this.borderRadius,
    this.showDragHandle = true,
    this.isDismissible = true,
    this.enableDrag = true,
  });

  final Widget child;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;
  final BorderRadius? borderRadius;
  final bool showDragHandle;
  final bool isDismissible;
  final bool enableDrag;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: backgroundColor ?? PrimitiveColors.white,
            borderRadius:
                borderRadius ??
                BorderRadius.vertical(top: Radius.circular(20.r)),
          ),
          height: height,
          width: 1.sw,
          padding: padding ?? AppSize.allPadding16,
          child: child,
        ),
      ),
    );
  }

  static Future<T?> show<T>({
    required BuildContext context,
    required Widget child,
    double? height,
    EdgeInsetsGeometry? padding,
    Color? backgroundColor,
    BorderRadius? borderRadius,
    bool showDragHandle = true,
    bool isDismissible = true,
    bool enableDrag = true,
    bool containItems = false,
  }) {
    return showModalBottomSheet<T>(
      useRootNavigator: true,
      context: context,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      showDragHandle: enableDrag && showDragHandle,
      useSafeArea: true,
      backgroundColor: Colors.transparent,
      isScrollControlled: true, // Changed from containItems to always true
      builder: (context) => AppBottomSheet(
        height: height,
        padding: padding,
        backgroundColor: backgroundColor,
        borderRadius: borderRadius,
        showDragHandle: showDragHandle,
        isDismissible: isDismissible,
        enableDrag: enableDrag,
        child: child,
      ),
    );
  }
}
