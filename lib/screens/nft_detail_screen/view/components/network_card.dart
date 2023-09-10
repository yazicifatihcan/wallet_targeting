import 'package:flutter/material.dart';
import 'package:flutter_base_project/app/components/button/base_button.dart';
import 'package:flutter_base_project/app/extensions/widget_extension.dart';
import 'package:flutter_base_project/app/theme/color/app_colors.dart';

import '../../../../app/constants/other/padding_and_radius_size.dart';
import '../../../../app/theme/text_style/text_style.dart';

class NetworkCard extends StatelessWidget {
  final bool isSelected;
  final VoidCallback onTap;
  const NetworkCard({
    super.key,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: isSelected ? AppColor.lightWhite : AppColor.lightWhite.withOpacity(0.3),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radiusS),
            side: BorderSide(color: isSelected ? AppColor.mintBlue : Colors.transparent)),
        child: Padding(
          padding: const EdgeInsets.all(paddingXS),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Binance', style: s14W600Dark.copyWith(color: isSelected ? null : Colors.white)),
              const SizedBox(
                height: paddingXXXXS,
              ),
              Text('www.binance.com', style: s14W300Dark.copyWith(color: isSelected ? null : Colors.white )),
              const SizedBox(
                height: paddingXXXXS,
              ),
              Text('Alınacak Miktar: \$53.20',style: s11W300Dark.copyWith(color: isSelected ? null : Colors.white),),
            ],
          ),
        ),
      ),
    );
  }
}
