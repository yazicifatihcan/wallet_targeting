import 'dart:convert';

import 'package:flutter_base_project/app/model/response/all_criteria_response_model.dart';
import 'package:flutter_base_project/app/model/response/all_store_response_model.dart';
import 'package:flutter_base_project/app/model/response/game_detail_response_model.dart';
import 'package:flutter_base_project/app/model/response/store_carousel_response_model.dart';
import 'package:flutter_base_project/app/model/response/store_item_response_model.dart';
import 'package:flutter_base_project/app/model/response/store_items_response_model.dart';
import 'package:flutter_base_project/app/model/response/user_items_response_model.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';

import '../../core/exception/app_exception.dart';
import '../../core/services/http_client.dart';
import '../constants/app/http_url.dart';
import '../constants/enum/general_enum.dart';
import '../constants/enum/loading_status_enum.dart';
import '../controllers/general/session_service.dart';
import '../model/header/session_header_model.dart';
import '../model/request/sign_in_request_model.dart';
import '../model/response/base_http_model.dart';
import '../model/response/error_model.dart';
import '../model/response/sign_in_response_model.dart';

/// Tüm moldüllerde ile kullanılan Http işlemleri burada yapılmakta
///
class General extends SessionHeaderModel {
  General() : super(token: Get.find<SessionService>().getUserToken() ?? '');


  Future<BaseHttpModel<SignInAndSignUpResponseModel>> signIn({required SignInRequestModel signInRequestModel}) async {
    try {
      var response = await HttpClient().request(
        HttpMethod.POST,
        HttpUrl.signIn,
        headerParam: createHeader(),
        bodyParam: signInRequestModel.toJson(),
      );
      if (response!.statusCode == HttpStatus.created) {
        final responseModel = SignInAndSignUpResponseModel().jsonParser(utf8.decode(response.bodyBytes));
        return BaseHttpModel(status: BaseModelStatus.Ok, data: responseModel);
      } else {
        final ErrorModel responseModel = ErrorModel().jsonParser(utf8.decode(response.bodyBytes));
        return BaseHttpModel(status: BaseModelStatus.Error, message: responseModel.message);
      }
    } on AppException catch (e) {
      return BaseHttpModel(status: BaseModelStatus.Error, message: e.toString());
    } catch (e) {
      return BaseHttpModel(status: BaseModelStatus.Error);
    }
  }

  Future<BaseHttpModel<List<AllStoreResponseModel>>> getAllStore({required bool available}) async {
    try {
      var response = await HttpClient().request(
        HttpMethod.GET,
        HttpUrl().getAllStore(available),
        headerParam: createHeader(),
      );
      if (response!.statusCode == HttpStatus.ok) {
        final responseModel = AllStoreResponseModel().jsonParser(utf8.decode(response.bodyBytes));
        return BaseHttpModel(status: BaseModelStatus.Ok, data: responseModel);
      } else {
        final ErrorModel responseModel = ErrorModel().jsonParser(utf8.decode(response.bodyBytes));
        return BaseHttpModel(status: BaseModelStatus.Error, message: responseModel.message);
      }
    } on AppException catch (e) {
      return BaseHttpModel(status: BaseModelStatus.Error, message: e.toString());
    } catch (e) {
      return BaseHttpModel(status: BaseModelStatus.Error);
    }
  }

  Future<BaseHttpModel<GameDetailResponseModel>> gameDetail({required String id}) async {
    try {
      var response = await HttpClient().request(
        HttpMethod.GET,
        HttpUrl().gameDetail(id),
        headerParam: createHeader(),
      );
      if (response!.statusCode == HttpStatus.ok) {
        final responseModel = GameDetailResponseModel().jsonParser(utf8.decode(response.bodyBytes));
        return BaseHttpModel(status: BaseModelStatus.Ok, data: responseModel);
      } else {
        final ErrorModel responseModel = ErrorModel().jsonParser(utf8.decode(response.bodyBytes));
        return BaseHttpModel(status: BaseModelStatus.Error, message: responseModel.message);
      }
    } on AppException catch (e) {
      return BaseHttpModel(status: BaseModelStatus.Error, message: e.toString());
    } catch (e) {
      return BaseHttpModel(status: BaseModelStatus.Error);
    }
  }

  Future<BaseHttpModel<User>> getCurrentUser() async {
    try {
      var response = await HttpClient().request(
        HttpMethod.GET,
        HttpUrl.currentUser,
        headerParam: createHeader(),
      );
      if (response!.statusCode == HttpStatus.ok) {
        final responseModel = User().jsonParser(utf8.decode(response.bodyBytes));
        return BaseHttpModel(status: BaseModelStatus.Ok, data: responseModel);
      } else {
        final ErrorModel responseModel = ErrorModel().jsonParser(utf8.decode(response.bodyBytes));
        return BaseHttpModel(status: BaseModelStatus.Error, message: responseModel.message);
      }
    } on AppException catch (e) {
      return BaseHttpModel(status: BaseModelStatus.Error, message: e.toString());
    } catch (e) {
      return BaseHttpModel(status: BaseModelStatus.Error);
    }
  }

  Future<BaseHttpModel<List<UserItemResponseModel>>> getUserItems() async {
    try {
      var response = await HttpClient().request(
        HttpMethod.GET,
        HttpUrl.userItems,
        headerParam: createHeader(),
      );
      if (response!.statusCode == HttpStatus.ok) {
        final responseModel = UserItemResponseModel().jsonParser(utf8.decode(response.bodyBytes));
        return BaseHttpModel(status: BaseModelStatus.Ok, data: responseModel);
      } else {
        final ErrorModel responseModel = ErrorModel().jsonParser(utf8.decode(response.bodyBytes));
        return BaseHttpModel(status: BaseModelStatus.Error, message: responseModel.message);
      }
    } on AppException catch (e) {
      return BaseHttpModel(status: BaseModelStatus.Error, message: e.toString());
    } catch (e) {
      return BaseHttpModel(status: BaseModelStatus.Error);
    }
  }

  Future<BaseHttpModel<List<AllCriteriaResponseModel>>> getGameCriterias(String id) async {
    try {
      var response = await HttpClient().request(
        HttpMethod.GET,
        HttpUrl().gameCriterias(id),
        headerParam: createHeader(),
      );
      if (response!.statusCode == HttpStatus.ok) {
        final responseModel = AllCriteriaResponseModel().jsonParser(utf8.decode(response.bodyBytes));
        return BaseHttpModel(status: BaseModelStatus.Ok, data: responseModel);
      } else {
        final ErrorModel responseModel = ErrorModel().jsonParser(utf8.decode(response.bodyBytes));
        return BaseHttpModel(status: BaseModelStatus.Error, message: responseModel.message);
      }
    } on AppException catch (e) {
      return BaseHttpModel(status: BaseModelStatus.Error, message: e.toString());
    } catch (e) {
      return BaseHttpModel(status: BaseModelStatus.Error);
    }
  }

  Future<BaseHttpModel<List<StoreCarouselResponseModel>>> getStoreCarousels() async {
    try {
      var response = await HttpClient().request(
        HttpMethod.GET,
        HttpUrl.storeCarousel,
        headerParam: createHeader(),
      );
      if (response!.statusCode == HttpStatus.ok) {
        final responseModel = StoreCarouselResponseModel().jsonParser(utf8.decode(response.bodyBytes));
        return BaseHttpModel(status: BaseModelStatus.Ok, data: responseModel);
      } else {
        final ErrorModel responseModel = ErrorModel().jsonParser(utf8.decode(response.bodyBytes));
        return BaseHttpModel(status: BaseModelStatus.Error, message: responseModel.message);
      }
    } on AppException catch (e) {
      return BaseHttpModel(status: BaseModelStatus.Error, message: e.toString());
    } catch (e) {
      return BaseHttpModel(status: BaseModelStatus.Error);
    }
  }

  Future<BaseHttpModel<List<StoreItemsResponseModel>>> storeItems() async {
    try {
      var response = await HttpClient().request(
        HttpMethod.GET,
        HttpUrl.storeItems,
        headerParam: createHeader(),
      );
      if (response!.statusCode == HttpStatus.ok) {
        final responseModel = StoreItemsResponseModel().jsonParser(utf8.decode(response.bodyBytes));
        return BaseHttpModel(status: BaseModelStatus.Ok, data: responseModel);
      } else {
        final ErrorModel responseModel = ErrorModel().jsonParser(utf8.decode(response.bodyBytes));
        return BaseHttpModel(status: BaseModelStatus.Error, message: responseModel.message);
      }
    } on AppException catch (e) {
      return BaseHttpModel(status: BaseModelStatus.Error, message: e.toString());
    } catch (e) {
      return BaseHttpModel(status: BaseModelStatus.Error);
    }
  }

  Future<BaseHttpModel<StoreItemResponseModel>> storeItemDetail(String id) async {
    try {
      var response = await HttpClient().request(
        HttpMethod.GET,
        HttpUrl().storeItemDetail(id),
        headerParam: createHeader(),
      );
      if (response!.statusCode == HttpStatus.ok) {
        final responseModel = StoreItemResponseModel().jsonParser(utf8.decode(response.bodyBytes));
        return BaseHttpModel(status: BaseModelStatus.Ok, data: responseModel);
      } else {
        final ErrorModel responseModel = ErrorModel().jsonParser(utf8.decode(response.bodyBytes));
        return BaseHttpModel(status: BaseModelStatus.Error, message: responseModel.message);
      }
    } on AppException catch (e) {
      return BaseHttpModel(status: BaseModelStatus.Error, message: e.toString());
    } catch (e) {
      return BaseHttpModel(status: BaseModelStatus.Error);
    }
  }

}
