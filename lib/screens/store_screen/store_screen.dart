import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/store_controller.dart';
import 'view/store.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: StoreController(),
      builder: (_) => const Store(),
    );
  }
}