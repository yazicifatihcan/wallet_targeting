import 'package:flutter/material.dart';
import 'package:flutter_base_project/app/model/response/sign_in_response_model.dart';
import 'package:flutter_base_project/app/model/response/user_items_response_model.dart';
import 'package:get/get.dart';

import '../../../app/bl/general.dart';
import '../../../app/components/dialog/loading_progress.dart';
import '../../../app/constants/enum/loading_status_enum.dart';
import '../../../core/exception/app_exception.dart';
import '../../../core/i10n/i10n.dart';

class AccountController extends GetxController {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  
  BuildContext get context => scaffoldKey.currentContext!;  

  final Rx<LoadingStatus> _loadingStatus = Rx(LoadingStatus.Init);
  final Rx<User> _currentUser = Rx(User());
  final Rx<List<UserItemResponseModel>> _userItems = Rx([]);

  LoadingStatus get loadingStatus => _loadingStatus.value;
  set loadingStatus(LoadingStatus value) => _loadingStatus.value=value;

  User get currentUser => _currentUser.value;
  set currentUser(User value) => _currentUser.value=value;

  List<UserItemResponseModel> get userItems => _userItems.value;
  set userItems(List<UserItemResponseModel> value) => _userItems.value=value;


  @override
  void onReady() async {
    super.onReady();
    try {
      loadingStatus = LoadingStatus.Loading;
      LoadingProgress.start();
      await getCurrentUser();
      await getUserItems();
      LoadingProgress.stop();
      loadingStatus = LoadingStatus.Loaded;
    } catch (e) {
      LoadingProgress.stop();
      loadingStatus = LoadingStatus.Error;
    }
  }

  Future<void> getCurrentUser() async {
    final response = await General().getCurrentUser();
    if (response.status == BaseModelStatus.Ok) {
      currentUser = response.data!;
    } else {
      throw AppException(response.message ?? AppLocalization.getLabels.defaultErrorMessage);
    }
  }

  Future<void> getUserItems() async {
    final response = await General().getUserItems();
    if (response.status == BaseModelStatus.Ok) {
      userItems = response.data!;
    } else {
      throw AppException(response.message ?? AppLocalization.getLabels.defaultErrorMessage);
    }
  }




  void onTapDrawer(){
    scaffoldKey.currentState!.openEndDrawer();
  }
}