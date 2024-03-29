import 'package:flutter/material.dart';
import 'package:flutter_base_project/app/constants/enum/loading_status_enum.dart';
import 'package:flutter_base_project/app/navigation/route/route.dart';
import 'package:get/get.dart';

import '../../../app/bl/general.dart';
import '../../../app/components/dialog/loading_progress.dart';
import '../../../app/model/response/all_store_response_model.dart';
import '../../../core/exception/app_exception.dart';
import '../../../core/i10n/i10n.dart';

class HomeController extends GetxController {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  
  BuildContext get context => scaffoldKey.currentContext!;  

  final Rx<int> _selectedIndex = 0.obs;
  final Rx<LoadingStatus> _loadingStatus = Rx(LoadingStatus.Init);
  final Rx<List<AllStoreResponseModel>> _availableAllStore = Rx([]);
  final Rx<List<AllStoreResponseModel>> _notAvailableAllStore = Rx([]);


  int get selectedIndex => _selectedIndex.value;
  set selectedIndex(int value)=>_selectedIndex.value=value;

  LoadingStatus get loadingStatus => _loadingStatus.value;
  set loadingStatus(LoadingStatus value) => _loadingStatus.value=value;

  List<AllStoreResponseModel> get availableAllStore => _availableAllStore.value;
  set availableAllStore(List<AllStoreResponseModel> value) => _availableAllStore.value=value;

  List<AllStoreResponseModel> get notAvailableAllStore => _notAvailableAllStore.value;
  set notAvailableAllStore(List<AllStoreResponseModel> value) => _notAvailableAllStore.value=value;


  @override
  void onReady() async {
    super.onReady();
    try {
      loadingStatus = LoadingStatus.Loading;
      LoadingProgress.start();
      await getAllAvailableStore();
      await getAllNotAvailableStore();
      LoadingProgress.stop();
      loadingStatus = LoadingStatus.Loaded;
    } catch (e) {
      LoadingProgress.stop();
      loadingStatus = LoadingStatus.Error;
    }
  }

  Future<void> getAllAvailableStore() async {
    final response = await General().getAllStore(available: true);
    if (response.status == BaseModelStatus.Ok) {
      availableAllStore = response.data!;
    } else {
      throw AppException(response.message ?? AppLocalization.getLabels.defaultErrorMessage);
    }
  }

  Future<void> getAllNotAvailableStore() async {
    final response = await General().getAllStore(available: false);
    if (response.status == BaseModelStatus.Ok) {
      notAvailableAllStore = response.data!;
    } else {
      throw AppException(response.message ?? AppLocalization.getLabels.defaultErrorMessage);
    }
  }



  void onTapDrawer(){
    scaffoldKey.currentState!.openEndDrawer();
  }

  onTapChangeTab(int index){
    selectedIndex=index;
  }

  onTapGameCard(String id){
    Navigator.pushNamed(context, MainScreensEnum.gameDetailScreen.path,arguments: id);
  }
}