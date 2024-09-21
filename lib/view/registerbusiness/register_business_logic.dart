import 'dart:io';

import 'package:dealse/model/comman/UploadPayload.dart';
import 'package:dealse/utils/constants/navigation_constant.dart';
import 'package:dealse/view/dashboard/dashboard_screen_binding.dart';
import 'package:dealse/view/dashboard/dashboard_screen_view.dart';
import 'package:http/http.dart' as http;

import 'package:dealse/model/comman/PayLoad.dart';
import 'package:dealse/model/response_main_model/area_store_list_res_main.dart';
import 'package:dealse/model/response_model/area_store_list_res.dart';
import 'package:dealse/service/request/tg_post_request.dart';
import 'package:dealse/service/response/tg_response.dart';
import 'package:dealse/service/services.dart';
import 'package:dealse/service/singleton/shared_preferences.dart';
import 'package:dealse/service/uris.dart';
import 'package:dealse/utils/constants/app_constant.dart';
import 'package:dealse/view/widgets/custom_snackbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class RegisterBusinessLogic extends GetxController
{
  TextEditingController shopName = TextEditingController();
  TextEditingController ownerFirstName = TextEditingController();
  TextEditingController ownerLastName = TextEditingController();
  TextEditingController ownerMobile = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController storeContactNo = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController country = TextEditingController();
  RxString area = "".obs;
  RxString storeType = "".obs;
  RxList<AreaListModel> areaList = <AreaListModel>[].obs;
  RxList<StoreTypeApiModel> storeTypeList = <StoreTypeApiModel>[].obs;
  File? image;  // This will store the picked image
  RxString selectedImagePath = "".obs;
  RxString selectedImageName = "".obs;
  final ImagePicker _picker = ImagePicker();

  @override
  Future<void> onInit() async {
    ownerMobile.text = await TGSharedPreferences.getInstance().get(MOBILE_NO) ?? "";
    getAreaStoreList();
    super.onInit();
  }

  Future<void> pickImage() async {
    // Pick an image
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,  // Can change to ImageSource.camera to capture from camera
    );

    if (pickedFile != null) {
      image = File(pickedFile.path);  // Convert XFile to File
      selectedImagePath.value = pickedFile.path;
      selectedImageName.value = pickedFile.name ?? "fileName";
    }
    update();
  }

  Future<void> saveStoreDetails() async{
    var logoStream = http.ByteStream(image!.openRead());
    var logoLength = await image!.length();
    var logo = http.MultipartFile(
      'Logo',
      logoStream,
      logoLength,
      filename: selectedImageName.value,  // Extract the file name from the path
    );

    var token = await TGSharedPreferences.getInstance().get(KEY_TOKEN);

    ServiceManager.getInstance().saveStoreDetails(
        authToken: token,
        areaId: 123,
        storeTypeId: 456,
        name: shopName.text,
        email: email.text,
        address: address.text,
        latitude: 12.345678,
        longitude: 98.765432,
        ownerName: "${ownerFirstName.text} ${ownerLastName.text}",
        ownerMobileNo: ownerMobile.text,
        mobileNumbers: [ownerMobile.text,storeContactNo.text],  // List of mobile numbers
        deviceID: "device-id-123",
        logo: logo, onSuccess: (response) => _onSuccessSaveStoreDetails(response), onError: (error) => _onErrorSaveStoreDetails(error));
  }

  _onSuccessSaveStoreDetails(AreaStoreListResMain? response) {
    if(response?.getListData().code == 200){
      Get.offAll(
            () => DashboardScreen(),
        binding: DashboardScreenBinding(),
        routeName: NavigationConstant.dashboardScreenRoute,
      );
    }
    else{
      TGView.showSnackBar(context: Get.context!, message: response?.getListData().message ?? "Something went erong, Please try again later");
    }
  }

  _onErrorSaveStoreDetails(TGResponse errorResponse) {
    TGView.showSnackBar(context: Get.context!, message: "Something went erong, Please try again later");
  }

  Future<void> getAreaStoreList() async {

    TGPostRequest tgPostRequest = PayLoad(uri: URI_GET_AREA_STORE_TYPE_LIST,data: "");

    ServiceManager.getInstance().getAreaStoreTypeList(
        request: tgPostRequest, onSuccess: (response) => _onSuccessCheckStoreMobileNo(response), onError: (error) => _onErrorCheckStoreMobileNo(error));
  }

  _onSuccessCheckStoreMobileNo(AreaStoreListResMain? response) {
    if(response?.getListData().code == 200){
      if(response?.getListData().data?.areaListModel?.isNotEmpty == true){
        areaList.value = response!.getListData().data!.areaListModel!;
      }
      if(response?.getListData().data?.storeTypeApiModel?.isNotEmpty == true){
        storeTypeList.value = response!.getListData().data!.storeTypeApiModel!;
      }
    }
    else{
      TGView.showSnackBar(context: Get.context!, message: response?.getListData().message ?? "Something went erong, Please try again later");
    }
  }

  _onErrorCheckStoreMobileNo(TGResponse errorResponse) {
    TGView.showSnackBar(context: Get.context!, message: "Something went erong, Please try again later");
  }

  bool isValidDetails(){
    if(shopName.text.isEmpty || shopName.text == ""){
      return false;

    }
    else if(ownerFirstName.text.isEmpty || ownerFirstName.text == ""){
      return false;
    }
    else if(ownerLastName.text.isEmpty || ownerLastName.text == ""){
      return false;
    }
    else if(ownerMobile.text.isEmpty || ownerMobile.text == "" || ownerMobile.text.length != 10){
      return false;
    }
    else if(email.text.isEmpty || email.text == ""){
      return false;
    }
    else if(address.text.isEmpty || address.text == ""){
      return false;
    }
    else if(area.value.isEmpty || area.value == ""){
      return false;
    }
    else if(storeType.value.isEmpty || storeType.value == ""){
      return false;
    }
    else if(city.text.isEmpty || city.text == ""){
      return false;
    }
    else if(country.text.isEmpty || country.text == ""){
      return false;
    }
    else if(image == null && selectedImagePath.value == ""){
      return false;
    }
    else{
      return true;
    }
  }

}