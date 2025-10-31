import 'package:flutter/material.dart';

import '../../../../../config/constants/colors/primitive_colors.constant.dart';
import '../../../../../config/constants/fonts/all_text_styles.dart';
import '../../../../../core/common/presentation/extensions/size.extension.dart';
import '../../../../../core/common/presentation/views/widgets/app_text.widget.dart';
import '../../../data/models/post.model.dart';

class PostCardWidget extends StatelessWidget {
  const PostCardWidget({required this.post, required this.onTap, Key? key})
    : super(key: key);
  final PostModel post;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 0,
        margin: 16.horizontalPadding + 8.verticalPadding,
        child: Padding(
          padding: 16.allPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(post.title, style: AllTextStyle.f16W6),

              if (post.body != null && post.body!.isNotEmpty) ...[
                8.verticalGap,

                AppText(
                  post.body!,
                  style: AllTextStyle.f14W4.copyWith(
                    color: PrimitiveColors.grey140,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
