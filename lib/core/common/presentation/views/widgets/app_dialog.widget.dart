// Generic Dialog Component
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/constants/fonts/all_text_styles.dart';
import 'app_text.widget.dart';

class AppDialog {
  static Future<T?> show<T>({
    required BuildContext context,
    required String title,
    required List<Widget> Function(BuildContext dialogContext) actionsBuilder,
    String? content,
    Widget? contentWidget,
    bool barrierDismissible = true,
    EdgeInsets? contentPadding,
    Color? backgroundColor,
    double? elevation,
  }) {
    return showDialog<T>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (dialogContext) => AppDialogWidget(
        title: title,
        content: content,
        contentWidget: contentWidget,
        actionsBuilder: actionsBuilder,
        contentPadding: contentPadding,
        backgroundColor: backgroundColor,
        elevation: elevation,
      ),
    );
  }
}

class AppDialogWidget extends StatelessWidget {
  const AppDialogWidget({
    required this.title,
    required this.actionsBuilder,
    super.key,
    this.content,
    this.contentWidget,
    this.contentPadding,
    this.backgroundColor,
    this.elevation,
  });
  final String title;
  final String? content;
  final Widget? contentWidget;
  final List<Widget> Function(BuildContext dialogContext) actionsBuilder;
  final EdgeInsets? contentPadding;
  final Color? backgroundColor;
  final double? elevation;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: backgroundColor ?? Colors.white,
      elevation: elevation ?? 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 400),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header
            Container(
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
              child: AppText(
                title,
                style: AllTextStyle.f20W6.copyWith(color: Colors.grey[800]),
                textAlign: TextAlign.center,
              ),
            ),

            // Content
            if (content != null || contentWidget != null)
              Container(
                padding:
                    contentPadding ?? const EdgeInsets.fromLTRB(24, 0, 24, 24),
                child:
                    contentWidget ??
                    AppText(
                      content!,
                      style: AllTextStyle.f16W4.copyWith(
                        color: Colors.grey[600],
                        height: 1.4,
                      ),
                      textAlign: TextAlign.center,
                    ),
              ),

            // Divider
            Container(
              height: 1,
              color: Colors.grey[200],
              margin: const EdgeInsets.symmetric(horizontal: 12),
            ),

            // Actions
            Container(
              padding: const EdgeInsets.all(12),
              child: Column(spacing: 8.h, children: actionsBuilder(context)),
            ),
          ],
        ),
      ),
    );
  }
}
