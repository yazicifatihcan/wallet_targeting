import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/assets/assets.dart';
import '../../constants/other/padding_and_radius_size.dart';
import '../../libs/app/size_config.dart';
import '../../theme/color/app_colors.dart';

class GeneralAppBar extends StatelessWidget implements PreferredSizeWidget {

  final String imageUrl;
  final String title;
  final VoidCallback onTapHamburger;
  const GeneralAppBar({
    super.key, required this.imageUrl, required this.title, required this.onTapHamburger,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 80,
      leading: Padding(
        padding: const EdgeInsets.only(left: paddingM),
        child: DecoratedBox(
          decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: AppColor.greenColor)),
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: CircleAvatar(
              backgroundImage: NetworkImage(imageUrl),
            ),
          ),
        ),
      ),
      title:  Text(title),
      centerTitle: true,
      actions: [
        GestureDetector(
          onTap: onTapHamburger,
          child: SvgPicture.asset(hamburgerIcon),
        ),
        const SizedBox(
          width: paddingM,
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(SizeConfig.appBarHeight);
}
