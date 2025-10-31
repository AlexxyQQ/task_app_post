import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../config/constants/colors/primitive_colors.constant.dart';
import '../../../../../../config/constants/size/app_size.constant.dart';
import '../../../../../config/constants/fonts/all_text_styles.dart';
import '../../../../../config/theme/components_theme/picture.theme.dart';
import 'app_text.widget.dart';

class AppSvgPicture extends StatelessWidget {
  const AppSvgPicture.fromNetwork(
    String url, {
    required this.alt,
    super.key,
    this.height,
    this.width,
    this.onTap,
    this.theme,
  }) : path = url,
       isNetwork = true,
       isIcon = false;

  const AppSvgPicture.fromAsset(
    String assetPath, {
    required this.alt,
    super.key,
    this.height,
    this.width,
    this.onTap,
    this.theme,
  }) : path = assetPath,
       isNetwork = false,
       isIcon = false;

  const AppSvgPicture.icon(
    String assetIconPath, {
    required this.alt,
    super.key,
    this.width = 24,
    this.height = 24,
    this.onTap,
    this.theme,
  }) : path = assetIconPath,
       isNetwork = false,
       isIcon = true;

  const AppSvgPicture.networkIcon(
    String url, {
    required this.alt,
    super.key,
    this.width = 24,
    this.height = 24,
    this.onTap,
    this.theme,
  }) : path = url,
       isNetwork = true,
       isIcon = true;
  final String path;
  final String alt;
  final double? width;
  final double? height;
  final VoidCallback? onTap;
  final bool isNetwork;
  final bool isIcon;
  final PictureTheme? theme;

  double get _defaultHeight => height ?? AppSize.lg;
  double get _defaultWidth => width ?? AppSize.lg;

  ColorFilter? get _colorFilter => theme?.color != null
      ? ColorFilter.mode(theme!.color!, BlendMode.srcIn)
      : null;

  ImageProvider getImageProvider() {
    return isNetwork ? NetworkImage(path) : AssetImage(path) as ImageProvider;
  }

  @override
  Widget build(BuildContext context) {
    final child = (isIcon)
        ? Container(
            padding: theme?.containerPadding ?? AppSize.allPadding4,
            width: theme?.containerWidth,
            height: theme?.containerHeight,
            decoration: BoxDecoration(
              color: theme?.backgroundColor,
              borderRadius: theme?.borderRadius,
              shape: theme?.borderRadius != null
                  ? BoxShape.rectangle
                  : BoxShape.circle,
              border: Border.all(
                color: theme?.borderColor ?? PrimitiveColors.transparent,
                width: theme?.borderWidth ?? 0,
              ),
            ),
            child: isNetwork
                ? SvgPicture.network(
                    path,
                    width: _defaultWidth,
                    height: _defaultHeight,
                    fit: theme?.fit ?? BoxFit.cover,
                    alignment: theme?.alignment ?? Alignment.center,
                    colorFilter: _colorFilter,
                    semanticsLabel: theme?.semanticsLabel,
                    matchTextDirection: theme?.matchTextDirection ?? false,
                    errorBuilder: (context, error, stackTrace) =>
                        ImageNoDataWidget(
                          title: alt,
                          theme: theme,
                          width: width,
                          height: height,
                        ),
                    placeholderBuilder: (context) => ImagePlaceholderWidget(
                      theme: theme,
                      width: width,
                      height: height,
                    ),
                  )
                : SvgPicture.asset(
                    path,
                    width: _defaultWidth,
                    height: _defaultHeight,
                    fit: theme?.fit ?? BoxFit.cover,
                    alignment: theme?.alignment ?? Alignment.center,
                    colorFilter: _colorFilter,
                    semanticsLabel: theme?.semanticsLabel,
                    matchTextDirection: theme?.matchTextDirection ?? false,
                    errorBuilder: (context, error, stackTrace) =>
                        ImageNoDataWidget(
                          title: alt,
                          theme: theme,
                          width: width,
                          height: height,
                        ),
                    placeholderBuilder: (context) => ImagePlaceholderWidget(
                      theme: theme,
                      width: width,
                      height: height,
                    ),
                  ),
          )
        : (isNetwork)
        ? SvgPicture.network(
            path,
            width: _defaultWidth,
            height: _defaultHeight,
            fit: theme?.fit ?? BoxFit.cover,
            alignment: theme?.alignment ?? Alignment.center,
            colorFilter: _colorFilter,
            semanticsLabel: theme?.semanticsLabel,
            matchTextDirection: theme?.matchTextDirection ?? false,
            errorBuilder: (context, error, stackTrace) => ImageNoDataWidget(
              title: alt,
              theme: theme,
              width: width,
              height: height,
            ),
            placeholderBuilder: (context) => ImagePlaceholderWidget(
              theme: theme,
              width: width,
              height: height,
            ),
          )
        : SvgPicture.asset(
            path,
            width: _defaultWidth,
            height: _defaultHeight,
            fit: theme?.fit ?? BoxFit.cover,
            alignment: theme?.alignment ?? Alignment.center,
            colorFilter: _colorFilter,
            semanticsLabel: theme?.semanticsLabel,
            matchTextDirection: theme?.matchTextDirection ?? false,
            errorBuilder: (context, error, stackTrace) => ImageNoDataWidget(
              title: alt,
              theme: theme,
              width: width,
              height: height,
            ),
            placeholderBuilder: (context) => ImagePlaceholderWidget(
              theme: theme,
              width: width,
              height: height,
            ),
          );

    return onTap != null ? GestureDetector(onTap: onTap, child: child) : child;
  }
}

class ImagePlaceholderWidget extends StatelessWidget {
  const ImagePlaceholderWidget({
    super.key,
    this.theme,
    this.width,
    this.height,
  });
  final PictureTheme? theme;
  final double? width;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: theme?.backgroundColor,
        borderRadius: theme?.borderRadius,
        shape: theme?.borderRadius != null
            ? BoxShape.rectangle
            : BoxShape.circle,
        border: Border.all(
          color: theme?.borderColor ?? PrimitiveColors.transparent,
          width: theme?.borderWidth ?? 0,
        ),
      ),
      width: width,
      height: height,
      child: Center(
        child: CircularProgressIndicator(
          color: theme?.color ?? PrimitiveColors.primary,
        ),
      ),
    );
  }
}

class ImageNoDataWidget extends StatelessWidget {
  const ImageNoDataWidget({
    super.key,
    this.title,
    this.theme,
    this.width,
    this.height,
    this.textStyle,
  });
  final String? title;
  final PictureTheme? theme;
  final double? width;
  final double? height;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    // trim the title and get the first letter
    final trimmedTitle = title?.replaceAll(' ', '').trim();
    return Container(
      decoration: BoxDecoration(
        color: theme?.backgroundColor,
        borderRadius: theme?.shape == BoxShape.circle
            ? null
            : theme?.borderRadius,
        shape: theme?.shape ?? BoxShape.circle,
        border: Border.all(
          color: theme?.borderColor ?? PrimitiveColors.transparent,
          width: theme?.borderWidth ?? 0,
        ),
      ),
      padding: AppSize.allPadding10,
      width: width,
      height: height,
      child: Center(
        child: AppText(
          (trimmedTitle != null && trimmedTitle.isNotEmpty)
              ? trimmedTitle[0]
              : 'C',
          translate: false,
          style:
              textStyle?.copyWith(
                color: theme?.color ?? PrimitiveColors.primary,
              ) ??
              AllTextStyle.f16W6.copyWith(
                color: theme?.color ?? PrimitiveColors.primary,
                fontSize: (width ?? 18) / 2,
              ),
        ),
      ),
    );
  }
}
