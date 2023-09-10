import 'package:flutter/material.dart';
import 'package:flutter_base_project/app/extensions/num_extension.dart';
import 'package:flutter_base_project/app/extensions/widgets_scale_extension.dart';

import '../../constants/other/padding_and_radius_size.dart';
import '../../theme/color/app_colors.dart';
import '../../theme/text_style/text_style.dart';
import '../other/progress_widget.dart';

class CardWithProgress extends StatelessWidget {
  final String imageUrl;
  final String gameName;
  final double totalProgress;
  final double currentProgress;
  final VoidCallback onTap;
  const CardWithProgress({
    super.key,
    required this.imageUrl,
    required this.gameName,
    required this.totalProgress,
    required this.currentProgress, required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 182.horizontalScale,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(radiusM),
                image: DecorationImage(
                    image: Image.network(
                      imageUrl,
                    ).image,
                    fit: BoxFit.cover),
              ),
              child: SizedBox(
                height: 140.verticalScale,
                width: 182.horizontalScale,
              ),
            ),
            const SizedBox(height: paddingXS),
            Text(
              gameName,
              style: s16W700Dark.copyWith(color: AppColor.grey),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: paddingXS),
            SizedBox(
                width: 182.horizontalScale,
                child: Row(
                  children: [
                    const Expanded(child: ProgressWidget(total: 100, current: 75)),
                    const SizedBox(
                      width: paddingXS,
                    ),
                    Text(
                      '${currentProgress.removeTrailingZeros()}/${totalProgress.removeTrailingZeros()}',
                      style: s12W500Dark.copyWith(color: AppColor.greenColor),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
