import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/account_controller.dart';
import 'view/account.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: AccountController(),
      builder: (_) => const Account(),
    );
  }
}