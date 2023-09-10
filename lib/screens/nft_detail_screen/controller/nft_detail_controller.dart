import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_base_project/app/model/response/store_item_response_model.dart';
import 'package:flutter_base_project/screens/home_screen/controller/home_controller.dart';
import 'package:get/get.dart';

import '../../../app/bl/general.dart';
import '../../../app/components/dialog/loading_progress.dart';
import '../../../app/constants/enum/loading_status_enum.dart';
import '../../../app/model/response/all_store_response_model.dart';
import '../../../app/navigation/route/route.dart';
import '../../../core/exception/app_exception.dart';
import '../../../core/i10n/i10n.dart';

class NftDetailController extends GetxController {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  
  BuildContext get context => scaffoldKey.currentContext!;  

  final Rx<LoadingStatus> _loadingStatus = Rx(LoadingStatus.Init);
  final Rx<StoreItemResponseModel> _itemDetail = Rx(StoreItemResponseModel());
  final Rx<List<AllStoreResponseModel>> _notAvailableAllStore = Rx([]);

  LoadingStatus get loadingStatus => _loadingStatus.value;
  set loadingStatus(LoadingStatus value) => _loadingStatus.value=value;

  StoreItemResponseModel get itemDetail => _itemDetail.value;
  set itemDetail(StoreItemResponseModel value) => _itemDetail.value=value;

  List<AllStoreResponseModel> get notAvailableAllStore => _notAvailableAllStore.value;
  set notAvailableAllStore(List<AllStoreResponseModel> value) => _notAvailableAllStore.value=value;

  late String id;

  NftDetailController({required this.id});

  @override
  void onReady() async {
    super.onReady();
    try {
      Get.put(HomeController());
      loadingStatus = LoadingStatus.Loading;
      LoadingProgress.start();
      await getItemDetail();
      await getAllNotAvailableStore();
      LoadingProgress.stop();
      loadingStatus = LoadingStatus.Loaded;
    } catch (e) {
      LoadingProgress.stop();
      loadingStatus = LoadingStatus.Error;
    }
  }

  Future<void> getItemDetail() async {
    final response = await General().storeItemDetail(id);
    if (response.status == BaseModelStatus.Ok) {
      itemDetail = response.data!;
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

  onTapGameCard(String id){
    Navigator.pushReplacementNamed(context, MainScreensEnum.gameDetailScreen.path,arguments: id);
  }

  int getRandomNumber(){
    Random random = new Random();
    return random.nextInt(100);
  }

}