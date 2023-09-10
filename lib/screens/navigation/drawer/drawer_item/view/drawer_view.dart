import 'package:flutter/material.dart';
import 'package:flutter_base_project/app/constants/other/padding_and_radius_size.dart';
import 'package:flutter_base_project/app/libs/app/size_config.dart';
import 'package:flutter_base_project/app/theme/color/app_colors.dart';
import 'package:flutter_base_project/app/theme/text_style/text_style.dart';
import 'package:get/get.dart';

import '../controller/drawer_controller.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DrawerScreenController>();
    return Padding(
      padding: EdgeInsets.only(top:SizeConfig.statusBarHeight),
      child: Drawer(
        backgroundColor: AppColor.drawerColor,
        width: SizeConfig.screenWidth*0.6,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 64,horizontal: paddingXS),
          child: Column(
            children: [
              Text('Hello',style: s22W600MintBlue,),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 40),
                child: Divider(),
              ),
              controller.drawerItems()[0],
              const SizedBox(height: 50,),
              controller.drawerItems()[1],
              const SizedBox(height: 50,),
              controller.drawerItems()[2],
            ],
          ),
        ),
      ),
    );
}
  }