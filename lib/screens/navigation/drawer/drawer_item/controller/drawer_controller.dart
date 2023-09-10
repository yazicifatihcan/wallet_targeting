import 'package:flutter/material.dart';
import 'package:flutter_base_project/app/constants/assets/assets.dart';
import 'package:flutter_base_project/app/constants/other/padding_and_radius_size.dart';
import 'package:flutter_base_project/app/theme/color/app_colors.dart';
import 'package:flutter_base_project/app/theme/text_style/text_style.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class DrawerScreenController extends GetxController {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  final RxInt _selectedIndex = 0.obs;

  ///BottomNavigationBar için kullanılan index
  int get selectedIndex => _selectedIndex.value;
  set selectedIndex(int value) {
    if (_selectedIndex.value != value) _selectedIndex.value = value;
  }

  List<DrawerTile> drawerItems() {
    return [
      DrawerTile(
        onTap: () => selectedIndex = 0,
        svgPath: drawerHomeIcon,
        title: 'Home',
        isSelected: selectedIndex == 0,
      ),
      DrawerTile(
        onTap: () => selectedIndex = 1,
        svgPath: drawerStoreIcon,
        title: 'Store',
        isSelected: selectedIndex == 1,
      ),
      DrawerTile(
        onTap: () => selectedIndex = 2,
        svgPath: drawerAccountIcon,
        title: 'Account',
        isSelected: selectedIndex == 2,
      ),
    ];
  }
}

class DrawerTile extends StatelessWidget {
  const DrawerTile(
      {super.key, required this.svgPath, required this.title, required this.onTap, required this.isSelected});
  final String svgPath;
  final String title;
  final VoidCallback onTap;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          SvgPicture.asset(
            svgPath,
            color: isSelected ? AppColor.mintBlue : AppColor.cardBarrierColor,
          ),
          const SizedBox(
            width: paddingXS,
          ),
          Expanded(
              child: Text(
            title,
            style: s22W600Dark.copyWith(color: isSelected ? AppColor.mintBlue : AppColor.cardBarrierColor),
          )),
        ],
      ),
    );
  }
}
