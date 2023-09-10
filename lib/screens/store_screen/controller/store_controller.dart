import 'package:flutter/material.dart';
import 'package:flutter_base_project/app/model/response/store_carousel_response_model.dart';
import 'package:flutter_base_project/app/model/response/store_items_response_model.dart';
import 'package:flutter_base_project/app/navigation/route/route.dart';
import 'package:get/get.dart';

import '../../../app/bl/general.dart';
import '../../../app/components/dialog/loading_progress.dart';
import '../../../app/constants/enum/loading_status_enum.dart';
import '../../../core/exception/app_exception.dart';
import '../../../core/i10n/i10n.dart';

class StoreController extends GetxController {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  
  BuildContext get context => scaffoldKey.currentContext!;  

  final Rx<LoadingStatus> _loadingStatus = Rx(LoadingStatus.Init);
  final Rx<int> _selectedIndex = 0.obs;
  final Rx<List<StoreCarouselResponseModel>> _carousel = Rx([]);
  final Rx<List<StoreItemsResponseModel>> _storeItems = Rx([]);

  LoadingStatus get loadingStatus => _loadingStatus.value;
  set loadingStatus(LoadingStatus value) => _loadingStatus.value=value;

  int get selectedIndex => _selectedIndex.value;
  set selectedIndex(int value)=>_selectedIndex.value=value;

  List<StoreCarouselResponseModel> get carousel => _carousel.value;
  set carousel(List<StoreCarouselResponseModel> value) => _carousel.value=value;

  List<StoreItemsResponseModel> get storeItems => _storeItems.value;
  set storeItems(List<StoreItemsResponseModel> value) => _storeItems.value=value;


  @override
  void onReady() async {
    super.onReady();
    try {
      loadingStatus = LoadingStatus.Loading;
      LoadingProgress.start();
      await getCarouselImage();
      await getStoreItems();
      LoadingProgress.stop();
      loadingStatus = LoadingStatus.Loaded;
    } catch (e) {
      LoadingProgress.stop();
      loadingStatus = LoadingStatus.Error;
    }
  }

  Future<void> getCarouselImage() async {
    final response = await General().getStoreCarousels();
    if (response.status == BaseModelStatus.Ok) {
      carousel = response.data!;
    } else {
      throw AppException(response.message ?? AppLocalization.getLabels.defaultErrorMessage);
    }
  }

  Future<void> getStoreItems() async {
    final response = await General().storeItems();
    if (response.status == BaseModelStatus.Ok) {
      storeItems = response.data!;
    } else {
      throw AppException(response.message ?? AppLocalization.getLabels.defaultErrorMessage);
    }
  }

  void onTapStoreCard(String id){

    Navigator.pushNamed(context, MainScreensEnum.nftDetailScreen.path,arguments: id);
  }



  void onTapDrawer(){
    scaffoldKey.currentState!.openEndDrawer();
  }
}