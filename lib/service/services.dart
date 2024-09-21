import 'package:dealse/model/response_main_model/area_store_list_res_main.dart';
import 'package:dealse/model/response_model/check_store_mobile_res_main.dart';
import 'package:dealse/model/response_model/error/service_error.dart';
import 'package:dealse/model/response_model/get_auth_token_res_main.dart';
import 'package:dealse/service/request/tg_post_request.dart';
import 'package:dealse/service/request/tg_upload_multiple_file_request.dart';
import 'package:dealse/service/services_manager.dart';
import 'package:http/http.dart' as http;

import 'common/tg_log.dart';

class ServiceManager {
  static final ServiceManager _instance = ServiceManager();

  static ServiceManager getInstance() {
    return _instance;
  }

  void getAuthToken({required TGPostRequest request, onSuccess(T)?, onError(T)?}) {
    TGLog.d('ServiceManager.getAuthToken');

    TGService<GetAuthTokenResMain, ServiceError>(() => GetAuthTokenResMain(), () => ServiceError())
        .post(request: request, onSuccess: (response) => onSuccess!(response), onError: (error) => onError!(error));
  }

  void checkStoreMobileNo({required TGPostRequest request, onSuccess(T)?, onError(T)?}) {
    TGLog.d('ServiceManager.checkStoreMobileNo');

    TGService<CheckStoreMobileResMain, ServiceError>(() => CheckStoreMobileResMain(), () => ServiceError())
        .post(request: request, onSuccess: (response) => onSuccess!(response), onError: (error) => onError!(error));
  }

  void getAreaStoreTypeList({required TGPostRequest request, onSuccess(T)?, onError(T)?}) {
    TGLog.d('ServiceManager.getArea&StoreList');

    TGService<AreaStoreListResMain, ServiceError>(() => AreaStoreListResMain(), () => ServiceError())
        .post(request: request, onSuccess: (response) => onSuccess!(response), onError: (error) => onError!(error));
  }

  void saveStoreDetails(
      {required String authToken,
      required int areaId,
      required int storeTypeId,
      required String name,
      required String email,
      required String address,
      required double latitude,
      required double longitude,
      required String ownerName,
      required String ownerMobileNo,
      required List<String> mobileNumbers, // List of strings (e.g., multiple mobile numbers)
      required String deviceID,
      required http.MultipartFile logo,
      onSuccess(T)?,
      onError(T)?}) {
    TGLog.d('ServiceManager.getArea&StoreList');

    TGService<AreaStoreListResMain, ServiceError>(() => AreaStoreListResMain(), () => ServiceError()).addStoreWithStringList(
      areaId: areaId,
      storeTypeId: storeTypeId,
      name: name,
      email: email,
      address: address,
      latitude: latitude,
      longitude: longitude,
      ownerMobileNo: ownerMobileNo,
      ownerName: ownerName,
      logo: logo,
      onSuccess: (response) => onSuccess!(response),
      onError: (error) => onError!(error),
      authToken: authToken,
      mobileNumbers: mobileNumbers,
      deviceID: deviceID,
    );
  }
}
