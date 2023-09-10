import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_base_project/app/extensions/context_extension.dart';
import 'package:flutter_base_project/app/navigation/route/route_factory.dart';
import 'package:flutter_base_project/screens/navigation/drawer/drawer_item/controller/drawer_controller.dart';
import 'package:get/get.dart';
import '../../../../app/controllers/general/session_service.dart';
import '../../../../app/navigation/route/route.dart';
import '../../../../core/exception/app_exception.dart';
import '../../../../core/i10n/i10n.dart';

class SplashController extends GetxController {
  final GlobalKey scaffoldKey = GlobalKey();

  @override
  void onInit() {
    super.onInit();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  @override
  void onReady() {
    super.onReady();
    _init();
  }

  Future<void> _init() async {
    final context = scaffoldKey.currentContext!;
    final future = Future.delayed(const Duration(seconds: 2));
    final sessionService = Get.put(SessionService());
    Get.put(DrawerScreenController());

    // /// version kontrol
    // try {
    //   final forceUpdate = false;
    //   final version = await _getRemoteVersion();

    //   // ignore: dead_code
    //   if (forceUpdate && await forceUpdateControl(version)) return;
    // } catch (e) {}

    try {
      // await checkInternet();

      

      if (sessionService.isUserLogin()) {
        await _getUser(sessionService);
      }

      future.whenComplete(() async{
        Navigator.pushNamedAndRemoveUntil(context, MainScreensEnum.mainScreen.path, (route) => false);
      });
    } on UserLoginException catch (_){
      // sessionService.logOut();
      // Navigator.pushNamed(context, MainScreensEnum.loginScreen.path);
    }catch (e) {
      
    }
  }

  Future<void> _getUser(SessionService sessionService) async {
    // final response = await General().getCurrentUser();
    // if (response.status == BaseModelStatus.Ok) {
    //   await sessionService.logIn(response.data!);
    // } else {
    //   throw UserLoginException();
    // }
  }

  // Future<String> _getRemoteVersion() async {
  //   return '1.0.0';
  // }

  /// Internet control
  Future<void> checkInternet() async {
    final context = scaffoldKey.currentContext!;
    if (!await context.checkInternet(MyRouteFactory.context)) {
      throw AppException(AppLocalization.getLabels.noInternetErrorMessage);
    }
  }
}


class UserLoginException implements Exception {
  UserLoginException() : super();
}
