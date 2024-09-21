import 'dart:convert';

import 'package:dealse/model/comman/PayLoad.dart';
import 'package:dealse/model/request_model/check_store_mobile_req.dart';
import 'package:dealse/model/request_model/get_auth_token.dart';
import 'package:dealse/model/response_model/check_store_mobile_res_main.dart';
import 'package:dealse/model/response_model/get_auth_token_res_main.dart';
import 'package:dealse/service/common/app_functions.dart';
import 'package:dealse/service/request/tg_post_request.dart';
import 'package:dealse/service/response/tg_response.dart';
import 'package:dealse/service/services.dart';
import 'package:dealse/service/singleton/shared_preferences.dart';
import 'package:dealse/service/uris.dart';
import 'package:dealse/utils/constants/app_constant.dart';
import 'package:dealse/utils/constants/navigation_constant.dart';
import 'package:dealse/utils/store_utils.dart';
import 'package:dealse/view/registerbusiness/register_business_binding.dart';
import 'package:dealse/view/registerbusiness/register_business_view.dart';
import 'package:dealse/view/widgets/custom_snackbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'login_screen_binding.dart';
import 'login_verification_view.dart';

class LoginScreenLogic extends GetxController{
  TextEditingController mobileNumber = TextEditingController();
  TextEditingController pinController = TextEditingController();
  RxBool isValidOTP = false.obs;


  Future<void> getAuthTokenRequest() async {
    GetAuthToken getAuthToken = GetAuthToken(clientSecret: VALUE_FIRSTAPPKEY);
    var jsonReq = jsonEncode(getAuthToken.toJson());
    TGPostRequest tgPostRequest = PayLoad(uri: URI_GET_AUTH_TOKEN,data: jsonReq);

    ServiceManager.getInstance().getAuthToken(
        request: tgPostRequest, onSuccess: (response) => _onSuccessGetAuthToken(response), onError: (error) => _onErrorGetAuthToken(error));
  }

  _onSuccessGetAuthToken(GetAuthTokenResMain? response) async {
    if(response != null){
      TGSharedPreferences.getInstance().set(KEY_TOKEN, "Bearer  ${response.getAuthTokenResObj().data?.token}");
      setAccessTokenInRequestHeader();
      await Future.delayed(const Duration(seconds: 1));
      checkStoreMobileNoReq();
    }
    else{
      TGView.showSnackBar(context: Get.context!, message: "Something went erong, Please try again later");
    }
  }

  _onErrorGetAuthToken(TGResponse errorResponse) {
    TGView.showSnackBar(context: Get.context!, message: "Something went erong, Please try again later");
  }

  Future<void> checkStoreMobileNoReq() async {
    CheckStoreMobileReq getAuthToken = CheckStoreMobileReq(mobileNo: mobileNumber.text);
    var jsonReq = jsonEncode(getAuthToken.toJson());
    TGPostRequest tgPostRequest = PayLoad(uri: URI_CHECK_STORE_MOBILE_NO,data: jsonReq);

    ServiceManager.getInstance().checkStoreMobileNo(
        request: tgPostRequest, onSuccess: (response) => _onSuccessCheckStoreMobileNo(response), onError: (error) => _onErrorCheckStoreMobileNo(error));
  }

  _onSuccessCheckStoreMobileNo(CheckStoreMobileResMain? response) {
    if(response != null){
      if(response.getStoreDetailObj().code !=0 || response.getStoreDetailObj().code! > 0){
          TGSharedPreferences.getInstance().set(STORE_DATA, response.getStoreDetailObj().data);
          TGSharedPreferences.getInstance().set(MOBILE_NO, mobileNumber.text);
          Get.to(
                () => LoginVerificationView(),
            binding: LoginScreenBinding(),
            routeName: NavigationConstant.verifyLoginScreenRoute,
          );
      }
      else{
        TGSharedPreferences.getInstance().set(MOBILE_NO, mobileNumber.text);
        StoreUtils().setStoreData(response.getStoreDetailObj().data?.areaListModel);
        Get.offAll(
              () => RegisterBusinessView(),
          binding: RegisterScreenBinding(),
          routeName: NavigationConstant.registerBusinessScreenRoute,
        );
      }
    }
    else{
      TGView.showSnackBar(context: Get.context!, message: response?.getStoreDetailObj().message ?? "Something went erong, Please try again later");
    }
  }

  _onErrorCheckStoreMobileNo(TGResponse errorResponse) {
    TGView.showSnackBar(context: Get.context!, message: "Something went erong, Please try again later");
  }



}