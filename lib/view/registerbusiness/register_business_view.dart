import 'dart:math';

import 'package:dealse/config/color_config.dart';
import 'package:dealse/config/font_config.dart';
import 'package:dealse/model/response_model/area_store_list_res.dart';
import 'package:dealse/utils/constants/navigation_constant.dart';
import 'package:dealse/view/dashboard/dashboard_screen_binding.dart';
import 'package:dealse/view/dashboard/dashboard_screen_view.dart';
import 'package:dealse/view/registerbusiness/register_business_logic.dart';
import 'package:dealse/view/widgets/app_button.dart';
import 'package:dealse/view/widgets/custom_snackbar.dart';
import 'package:dealse/view/widgets/dasedrect.dart';
import 'package:dealse/view/widgets/dashed_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RegisterBusinessView extends StatelessWidget {
  RegisterBusinessView({super.key});

  final logic = Get.find<RegisterBusinessLogic>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PopScope(
        canPop: true,
        onPopInvoked: (didPop) => Get.back(),
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size(1.sw, 60.h),
            child: Container(
              width: 1.sw,
              height: 60.h,
              color: ColorConfig.primaryColor,
              padding: EdgeInsets.only(
                left: 20.h,
              ),
              alignment: Alignment.centerLeft,
              child: Icon(
                Icons.arrow_back_sharp,
                size: 20.h,
                color: ColorConfig.whiteColor,
              ),
            ),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 20.h,
              horizontal: 20.w,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Retailer",
                    style: TextStyle(
                      color: ColorConfig.primaryColor,
                      fontSize: 20.sp,
                      fontFamily: MyFonts.outfitMedium,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    "Register your business",
                    style: TextStyle(
                      color: ColorConfig.blackColor,
                      fontSize: 14.sp,
                      fontFamily: MyFonts.outfitRegular,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  SizedBox(
                    height: 120.h,
                    width: 1.sw,
                    child: DashedBorderContainer(
                      child: Obx(
                            () => logic.selectedImagePath.value == ""
                            ? GestureDetector(
                          onTap: () {
                            logic.pickImage();
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add,
                                size: 20.h,
                                color: ColorConfig.greyColor,
                              ),
                              SizedBox(
                                width: 10.h,
                              ),
                              Text(
                                "Click to select \nstore image",
                                style: TextStyle(
                                  color: ColorConfig.blackColor,
                                  fontSize: 12.sp,
                                  fontFamily: MyFonts.outfitRegular,
                                ),
                                textAlign: TextAlign.center,
                              )
                            ],
                          ),
                        )
                            : Stack(
                              children: [
                                GestureDetector(
                                  onTap: (){
                                    logic.pickImage();
                                  },
                                  child: Align(
                                      alignment: Alignment.topRight,
                                      child: Padding(
                                        padding: const EdgeInsets.all(1.0),
                                        child: Icon(Icons.camera_alt,size: 20,color: Colors.black,),
                                      )),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Image.file(
                                    logic.image!,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ],
                            ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  _shopName(
                    context,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  _ownerFirstName(
                    context,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  _ownerLastName(
                    context,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  _ownerMobile(
                    context,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  _ownerEmail(
                    context,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  _storeContactNo(
                    context,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  _shopAddress(
                    context,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  _area(
                    context,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  _storeType(
                    context,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  _city(
                    context,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  _country(
                    context,
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: AppButton(
            onPress: () {
              if (!logic.isValidDetails()) {
                TGView.showSnackBarWithDuration(
                    context: Get.context!, message: "Please fill all required details", duration: Duration(seconds: 1));
              } else {
                logic.saveStoreDetails();

              }
            },
            title: "Register",
            isButtonEnable: true.obs,
            width: 1.sw,
          ),
        ),
      ),
    );
  }

  Widget _shopName(BuildContext context) {
    return TextField(
      controller: logic.shopName,
      onChanged: (value) => {},
      style: TextStyle(
        fontSize: 12.sp,
        color: ColorConfig.blackColor,
        fontFamily: MyFonts.outfitRegular,
      ),
      maxLength: 100,
      maxLines: 1,
      decoration: InputDecoration(
        hintText: "Shop Name *",
        hintStyle: TextStyle(
          fontSize: 14.sp,
          color: ColorConfig.lightGreyColor,
          fontFamily: MyFonts.outfitRegular,
        ),
        counterText: '',
        border: UnderlineInputBorder(
          borderSide: BorderSide(
            color: ColorConfig.lightGreyColor,
            width: 1.w,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: ColorConfig.lightGreyColor,
            width: 1.w,
          ),
        ),
        disabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: ColorConfig.lightGreyColor,
            width: 1.w,
          ),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: ColorConfig.lightGreyColor,
            width: 1.w,
          ),
        ),
      ),
      keyboardType: TextInputType.name,
      cursorColor: ColorConfig.whiteColor,
    );
  }

  Widget _ownerFirstName(BuildContext context) {
    return TextField(
      controller: logic.ownerFirstName,
      onChanged: (value) => {},
      style: TextStyle(
        fontSize: 12.sp,
        color: ColorConfig.blackColor,
        fontFamily: MyFonts.outfitRegular,
      ),
      maxLength: 100,
      maxLines: 1,
      decoration: InputDecoration(
        hintText: "Owner First Name *",
        hintStyle: TextStyle(
          fontSize: 14.sp,
          color: ColorConfig.lightGreyColor,
          fontFamily: MyFonts.outfitRegular,
        ),
        counterText: '',
        border: UnderlineInputBorder(
          borderSide: BorderSide(
            color: ColorConfig.lightGreyColor,
            width: 1.w,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: ColorConfig.lightGreyColor,
            width: 1.w,
          ),
        ),
        disabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: ColorConfig.lightGreyColor,
            width: 1.w,
          ),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: ColorConfig.lightGreyColor,
            width: 1.w,
          ),
        ),
      ),
      keyboardType: TextInputType.name,
      cursorColor: ColorConfig.whiteColor,
    );
  }

  Widget _ownerLastName(BuildContext context) {
    return TextField(
      controller: logic.ownerLastName,
      onChanged: (value) => {},
      style: TextStyle(
        fontSize: 12.sp,
        color: ColorConfig.blackColor,
        fontFamily: MyFonts.outfitRegular,
      ),
      maxLength: 100,
      maxLines: 1,
      decoration: InputDecoration(
        hintText: "Owner Last Name *",
        hintStyle: TextStyle(
          fontSize: 14.sp,
          color: ColorConfig.lightGreyColor,
          fontFamily: MyFonts.outfitRegular,
        ),
        counterText: '',
        border: UnderlineInputBorder(
          borderSide: BorderSide(
            color: ColorConfig.lightGreyColor,
            width: 1.w,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: ColorConfig.lightGreyColor,
            width: 1.w,
          ),
        ),
        disabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: ColorConfig.lightGreyColor,
            width: 1.w,
          ),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: ColorConfig.lightGreyColor,
            width: 1.w,
          ),
        ),
      ),
      keyboardType: TextInputType.name,
      cursorColor: ColorConfig.whiteColor,
    );
  }

  Widget _ownerEmail(BuildContext context) {
    return TextField(
      controller: logic.email,
      onChanged: (value) => {},
      style: TextStyle(
        fontSize: 12.sp,
        color: ColorConfig.blackColor,
        fontFamily: MyFonts.outfitRegular,
      ),
      maxLength: 100,
      maxLines: 1,
      decoration: InputDecoration(
        hintText: "Email *",
        hintStyle: TextStyle(
          fontSize: 14.sp,
          color: ColorConfig.lightGreyColor,
          fontFamily: MyFonts.outfitRegular,
        ),
        counterText: '',
        border: UnderlineInputBorder(
          borderSide: BorderSide(
            color: ColorConfig.lightGreyColor,
            width: 1.w,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: ColorConfig.lightGreyColor,
            width: 1.w,
          ),
        ),
        disabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: ColorConfig.lightGreyColor,
            width: 1.w,
          ),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: ColorConfig.lightGreyColor,
            width: 1.w,
          ),
        ),
      ),
      keyboardType: TextInputType.emailAddress,
      cursorColor: ColorConfig.whiteColor,
    );
  }

  Widget _ownerMobile(BuildContext context) {
    return TextField(
      controller: logic.ownerMobile,
      readOnly: true,
      onChanged: (value) => {},
      style: TextStyle(
        fontSize: 12.sp,
        color: ColorConfig.blackColor,
        fontFamily: MyFonts.outfitRegular,
      ),
      maxLength: 10,
      maxLines: 1,
      decoration: InputDecoration(
        hintText: "Mobile *",
        hintStyle: TextStyle(
          fontSize: 14.sp,
          color: ColorConfig.lightGreyColor,
          fontFamily: MyFonts.outfitRegular,
        ),
        counterText: '',
        border: UnderlineInputBorder(
          borderSide: BorderSide(
            color: ColorConfig.lightGreyColor,
            width: 1.w,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: ColorConfig.lightGreyColor,
            width: 1.w,
          ),
        ),
        disabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: ColorConfig.lightGreyColor,
            width: 1.w,
          ),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: ColorConfig.lightGreyColor,
            width: 1.w,
          ),
        ),
      ),
      keyboardType: TextInputType.phone,
      cursorColor: ColorConfig.whiteColor,
    );
  }

  Widget _storeContactNo(BuildContext context) {
    return TextField(
      controller: logic.storeContactNo,
      readOnly: false,
      onChanged: (value) => {},
      style: TextStyle(
        fontSize: 12.sp,
        color: ColorConfig.blackColor,
        fontFamily: MyFonts.outfitRegular,
      ),
      maxLength: 10,
      maxLines: 1,
      decoration: InputDecoration(
        hintText: "Store Contact",
        hintStyle: TextStyle(
          fontSize: 14.sp,
          color: ColorConfig.lightGreyColor,
          fontFamily: MyFonts.outfitRegular,
        ),
        counterText: '',
        border: UnderlineInputBorder(
          borderSide: BorderSide(
            color: ColorConfig.lightGreyColor,
            width: 1.w,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: ColorConfig.lightGreyColor,
            width: 1.w,
          ),
        ),
        disabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: ColorConfig.lightGreyColor,
            width: 1.w,
          ),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: ColorConfig.lightGreyColor,
            width: 1.w,
          ),
        ),
      ),
      keyboardType: TextInputType.phone,
      cursorColor: ColorConfig.whiteColor,
    );
  }

  Widget _shopAddress(BuildContext context) {
    return TextField(
      controller: logic.address,
      onChanged: (value) => {},
      style: TextStyle(
        fontSize: 12.sp,
        color: ColorConfig.blackColor,
        fontFamily: MyFonts.outfitRegular,
      ),
      maxLength: 100,
      maxLines: 1,
      decoration: InputDecoration(
        hintText: "Address *",
        hintStyle: TextStyle(
          fontSize: 14.sp,
          color: ColorConfig.lightGreyColor,
          fontFamily: MyFonts.outfitRegular,
        ),
        counterText: '',
        border: UnderlineInputBorder(
          borderSide: BorderSide(
            color: ColorConfig.lightGreyColor,
            width: 1.w,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: ColorConfig.lightGreyColor,
            width: 1.w,
          ),
        ),
        disabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: ColorConfig.lightGreyColor,
            width: 1.w,
          ),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: ColorConfig.lightGreyColor,
            width: 1.w,
          ),
        ),
      ),
      keyboardType: TextInputType.text,
      cursorColor: ColorConfig.whiteColor,
    );
  }

  Widget _city(BuildContext context) {
    return TextField(
      controller: logic.city,
      readOnly: false,
      onChanged: (value) => {},
      style: TextStyle(
        fontSize: 12.sp,
        color: ColorConfig.blackColor,
        fontFamily: MyFonts.outfitRegular,
      ),
      maxLength: 100,
      maxLines: 1,
      decoration: InputDecoration(
        hintText: "City *",
        hintStyle: TextStyle(
          fontSize: 14.sp,
          color: ColorConfig.lightGreyColor,
          fontFamily: MyFonts.outfitRegular,
        ),
        counterText: '',
        border: UnderlineInputBorder(
          borderSide: BorderSide(
            color: ColorConfig.lightGreyColor,
            width: 1.w,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: ColorConfig.lightGreyColor,
            width: 1.w,
          ),
        ),
        disabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: ColorConfig.lightGreyColor,
            width: 1.w,
          ),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: ColorConfig.lightGreyColor,
            width: 1.w,
          ),
        ),
      ),
      keyboardType: TextInputType.text,
      cursorColor: ColorConfig.whiteColor,
    );
  }

  Widget _country(BuildContext context) {
    return TextField(
      controller: logic.country,
      readOnly: false,
      onChanged: (value) => {},
      style: TextStyle(
        fontSize: 12.sp,
        color: ColorConfig.blackColor,
        fontFamily: MyFonts.outfitRegular,
      ),
      maxLength: 100,
      maxLines: 1,
      decoration: InputDecoration(
        hintText: "Country *",
        hintStyle: TextStyle(
          fontSize: 14.sp,
          color: ColorConfig.lightGreyColor,
          fontFamily: MyFonts.outfitRegular,
        ),
        counterText: '',
        border: UnderlineInputBorder(
          borderSide: BorderSide(
            color: ColorConfig.lightGreyColor,
            width: 1.w,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: ColorConfig.lightGreyColor,
            width: 1.w,
          ),
        ),
        disabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: ColorConfig.lightGreyColor,
            width: 1.w,
          ),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: ColorConfig.lightGreyColor,
            width: 1.w,
          ),
        ),
      ),
      keyboardType: TextInputType.text,
      cursorColor: ColorConfig.whiteColor,
    );
  }

  Widget _area(BuildContext context) {
    return Obx(
      () => Container(
        height: 50.h,
        padding: EdgeInsets.only(
          left: 10.w,
          right: 10.w,
        ),
        decoration: const ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1.0, style: BorderStyle.solid),
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
        ),
        alignment: Alignment.centerLeft,
        child: DropdownButton<AreaListModel>(
          items: getAreaDropDown(logic.areaList).toList(),
          hint: Text(logic.area.value.isEmpty ? 'Area' : logic.area.value),
          borderRadius: BorderRadius.circular(10),
          underline: const SizedBox(),
          isExpanded: true,
          onChanged: (value) {
            if (value != null) {
              logic.area.value = value.areaName ?? "";
            }
          },
        ),
      ),
    );
  }

  Widget _storeType(BuildContext context) {
    return Obx(
      () => Container(
        height: 50.h,
        padding: EdgeInsets.only(
          left: 10.w,
          right: 10.w,
        ),
        decoration: const ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1.0, style: BorderStyle.solid),
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
        ),
        alignment: Alignment.centerLeft,
        child: DropdownButton<StoreTypeApiModel>(
          items: getStoreDropDown(logic.storeTypeList).toList(),
          hint: Text(logic.storeType.value.isEmpty ? 'Store Type' : logic.storeType.value),
          borderRadius: BorderRadius.circular(10),
          underline: const SizedBox(),
          isExpanded: true,
          onChanged: (value) {
            if (value != null) {
              logic.storeType.value = value.storeTypeName ?? "";
            }
          },
        ),
      ),
    );
  }

  List<DropdownMenuItem<AreaListModel>> getAreaDropDown(List<AreaListModel> items) {
    return items.map((AreaListModel item) {
      return DropdownMenuItem<AreaListModel>(
        value: item,
        child: Text(item.areaName ?? ""),
      );
    }).toList();
  }

  List<DropdownMenuItem<StoreTypeApiModel>> getStoreDropDown(List<StoreTypeApiModel> items) {
    return items.map((StoreTypeApiModel item) {
      return DropdownMenuItem<StoreTypeApiModel>(
        value: item,
        child: Text(item.storeTypeName ?? ""),
      );
    }).toList();
  }
}
