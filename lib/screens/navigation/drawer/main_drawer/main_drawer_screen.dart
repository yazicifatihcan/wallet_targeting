import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app/navigation/route/route.dart';
import '../drawer_item/controller/drawer_controller.dart';
import 'controller/main_controller.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      init: MainController(),
      autoRemove: false,
      builder: (controller) => WillPopScope(
        onWillPop: controller.onWillScope,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: GetX<DrawerScreenController>(builder: (drawerController) {
            return Scaffold(
              backgroundColor: Theme.of(context).colorScheme.primaryContainer,
              body: PageTransitionSwitcher(
                transitionBuilder: (
                  Widget child,
                  Animation<double> animation,
                  Animation<double> secondaryAnimation,
                ) {
                  return child;
                },
                child: drawerScreens[drawerController.selectedIndex],
              ),
            );
          }),
        ),
      ),
    );
  }
}
