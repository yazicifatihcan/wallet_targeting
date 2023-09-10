import 'package:flutter/material.dart';
import 'package:flutter_base_project/app/navigation/route/route.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  
  BuildContext get context => scaffoldKey.currentContext!;  

  final Rx<int> _selectedIndex = 0.obs;

  int get selectedIndex => _selectedIndex.value;
  set selectedIndex(int value)=>_selectedIndex.value=value;


  void onTapDrawer(){
    scaffoldKey.currentState!.openEndDrawer();
  }

  onTapChangeTab(int index){
    selectedIndex=index;
  }

  onTapGameCard(){
    Navigator.pushNamed(context, MainScreensEnum.gameDetailScreen.path);
  }
}