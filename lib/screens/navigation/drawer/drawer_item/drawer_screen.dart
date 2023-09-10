import 'package:flutter/material.dart';
import 'package:flutter_base_project/screens/navigation/drawer/drawer_item/controller/drawer_controller.dart';
import 'package:flutter_base_project/screens/navigation/drawer/drawer_item/view/drawer_view.dart';
import 'package:get/get.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: DrawerScreenController(),
      builder: (_) => const DrawerWidget(),
    );
  }
}