import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';

import '../../../../../config/constants/colors/primitive_colors.constant.dart';
import '../../../../../config/constants/enums/app_image_type.enum.dart';
import '../../../../../config/constants/size/app_size.constant.dart';
import '../../../../../config/theme/components_theme/picture.theme.dart';

class AppImage extends StatelessWidget {
  const AppImage.fromMemory(
    Uint8List bytes, {
    super.key,
    this.height,
    this.width,
    this.onTap,
    this.theme,
  }) : memoryBytes = bytes,
       imageType = AppImageType.memory,
       path = '',
       isIcon = false;

  const AppImage.fromAsset(
    String assetPath, {
    super.key,
    this.height,
    this.width,
    this.onTap,
    this.theme,
  }) : path = assetPath,
       imageType = AppImageType.asset,
       memoryBytes = null,
       isIcon = false;

  AppImage.fromFile(
    File filePath, {
    super.key,
    this.height,
    this.width,
    this.onTap,
    this.theme,
  }) : path = filePath.path,
       imageType = AppImageType.file,
       memoryBytes = null,
       isIcon = false;

  const AppImage.assetIcon(
    String assetIconPath, {
    super.key,
    this.width = 24,
    this.height = 24,
    this.onTap,
    this.theme,
  }) : path = assetIconPath,
       imageType = AppImageType.asset,
       memoryBytes = null,
       isIcon = true;

  AppImage.fileIcon(
    File file, {
    super.key,
    this.width = 24,
    this.height = 24,
    this.onTap,
    this.theme,
  }) : path = file.path,
       imageType = AppImageType.file,
       memoryBytes = null,
       isIcon = true;
  const AppImage.memoryIcon(
    Uint8List bytes, {
    super.key,
    this.width = 24,
    this.height = 24,
    this.onTap,
    this.theme,
  }) : path = '',
       imageType = AppImageType.memory,
       memoryBytes = bytes,
       isIcon = true;
  final String path;
  final Uint8List? memoryBytes;
  final double? width;
  final double? height;
  final VoidCallback? onTap;
  final AppImageType imageType;
  final bool isIcon;

  final PictureTheme? theme;

  double get _defaultHeight => height ?? AppSize.lg;
  double get _defaultWidth => width ?? AppSize.lg;

  ImageProvider<Object> get image => getImageProvider();

  ImageProvider getImageProvider() {
    switch (imageType) {
      case AppImageType.memory:
        return MemoryImage(memoryBytes!);
      case AppImageType.asset:
        return AssetImage(path);
      case AppImageType.file:
        return FileImage(File(path));
    }
  }

  @override
  Widget build(BuildContext context) {
    final imageWidget = Image(
      image: getImageProvider(),
      width: _defaultWidth,
      height: _defaultHeight,
      fit: theme?.fit ?? BoxFit.cover,
      alignment: theme?.alignment ?? Alignment.center,
      color: theme?.color,
      semanticLabel: theme?.semanticsLabel,
    );

    final child = isIcon
        ? Container(
            padding: theme?.containerPadding ?? const EdgeInsets.all(4.0),
            width: theme?.containerWidth ?? _defaultWidth,
            height: theme?.containerHeight ?? _defaultHeight,
            decoration: BoxDecoration(
              color: theme?.backgroundColor,
              shape: BoxShape.circle,
              border: Border.all(
                color: theme?.borderColor ?? PrimitiveColors.transparent,
                width: theme?.borderWidth ?? 0,
              ),
            ),
            child: imageWidget,
          )
        : imageWidget;

    return onTap != null ? GestureDetector(onTap: onTap, child: child) : child;
  }
}
