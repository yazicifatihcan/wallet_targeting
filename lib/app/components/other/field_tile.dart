import 'package:flutter/material.dart';

import '../../theme/color/app_colors.dart';
import '../../theme/text_style/text_style.dart';

class FieldTitle extends StatelessWidget {

  final String title;
  final VoidCallback onTap;
  const FieldTitle({super.key, required this.title, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
                onTap: onTap,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: s16W700Dark.copyWith(color: AppColor.grey),
                    ),
                    Text('See all', style: s12W700Dark.copyWith(color: AppColor.darkBlue)),
                  ],
                ),
              );
  }
}