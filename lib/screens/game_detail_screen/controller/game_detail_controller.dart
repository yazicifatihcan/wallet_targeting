import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_base_project/app/model/response/all_criteria_response_model.dart';
import 'package:flutter_base_project/app/model/response/game_detail_response_model.dart';
import 'package:flutter_base_project/screens/home_screen/controller/home_controller.dart';
import 'package:get/get.dart';

import '../../../app/bl/general.dart';
import '../../../app/components/dialog/loading_progress.dart';
import '../../../app/constants/enum/loading_status_enum.dart';
import '../../../app/navigation/route/route.dart';
import '../../../core/exception/app_exception.dart';
import '../../../core/i10n/i10n.dart';

class GameDetailController extends GetxController {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  
  BuildContext get context => scaffoldKey.currentContext!;  


  final HomeController homeController = Get.find();

  final Rx<LoadingStatus> _loadingStatus = Rx(LoadingStatus.Init);
  final Rx<GameDetailResponseModel> _gameDetail = Rx(GameDetailResponseModel());
  final Rx<List<AllCriteriaResponseModel>> _gameCriterias = Rx([]);


  LoadingStatus get loadingStatus => _loadingStatus.value;
  set loadingStatus(LoadingStatus value) => _loadingStatus.value=value;

  GameDetailResponseModel get gameDetail => _gameDetail.value;
  set gameDetail(GameDetailResponseModel value) => _gameDetail.value=value;

  List<AllCriteriaResponseModel> get gameCriterias => _gameCriterias.value;
  set gameCriterias(List<AllCriteriaResponseModel> value) => _gameCriterias.value=value;

  late String id;

  GameDetailController({required this.id});


  @override
  void onReady() async {
    super.onReady();
    try {
      loadingStatus = LoadingStatus.Loading;
      LoadingProgress.start();
      await getGameDetail();
      await getGameCriterias();
      LoadingProgress.stop();
      loadingStatus = LoadingStatus.Loaded;
    } catch (e) {
      LoadingProgress.stop();
      loadingStatus = LoadingStatus.Error;
    }
  }

  Future<void> getGameDetail() async {
    final response = await General().gameDetail(id:id);
    if (response.status == BaseModelStatus.Ok) {
      gameDetail = response.data!;
    } else {
      throw AppException(response.message ?? AppLocalization.getLabels.defaultErrorMessage);
    }
    }

    bool isAlreadyEarned (){
      int index = homeController.availableAllStore.indexWhere((element) => element.id==id);
      
      return index==-1 ? true : false;

    }

  Future<void> getGameCriterias() async {
    final response = await General().getGameCriterias(id);
    if (response.status == BaseModelStatus.Ok) {
      gameCriterias = response.data!;
    } else {
      throw AppException(response.message ?? AppLocalization.getLabels.defaultErrorMessage);
    }
    }

  int getRandomNumber(){
    Random random = new Random();
    return random.nextInt(100);
  }

  onTapNfc(String id){
    Navigator.pushReplacementNamed(context, MainScreensEnum.nftDetailScreen.path,arguments: id);
  }

}