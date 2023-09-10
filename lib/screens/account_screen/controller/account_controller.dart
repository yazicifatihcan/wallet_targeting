import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountController extends GetxController {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  
  BuildContext get context => scaffoldKey.currentContext!;  

  void onTapDrawer(){
    scaffoldKey.currentState!.openEndDrawer();
  }
}