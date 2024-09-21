import 'package:dealse/config/color_config.dart';
import 'package:dealse/config/font_config.dart';
import 'package:dealse/utils/constants/navigation_constant.dart';
import 'package:dealse/view/offers/manage_offer_screen.dart';
import 'package:dealse/view/offers/offers_details_logic.dart';
import 'package:dealse/view/offers/upload_photo_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'offers_details_binding.dart';

class EnterOfferDetailsScreen extends StatelessWidget {
  EnterOfferDetailsScreen({super.key});

  final logic = Get.find<OffersDetailLogic>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PopScope(
        canPop: true,
        onPopInvoked: (didPop) => Get.back(),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            backgroundColor: ColorConfig.primaryColor,
            title: Text(
              "Create Offer",
              style: TextStyle(
                fontSize: 16.sp,
                color: ColorConfig.whiteColor,
                fontFamily: MyFonts.outfitMedium,
              ),
            ),
            leading: Builder(
              builder: (context) {
                return IconButton(
                  icon: const Icon(Icons.arrow_back_sharp),
                  color: ColorConfig.whiteColor,
                  onPressed: () {
                    Get.offAll(
                          () => ManageOfferScreen(),
                      binding: OfferDetailScreenBinding(),
                      routeName: NavigationConstant.manageOfferScreenRoute,
                    );
                  },
                );
              },
            ),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.w,
              vertical: 30.h,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: logic.offerTitle,
                  onChanged: (value) => {},
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: ColorConfig.blackColor,
                    fontFamily: MyFonts.outfitRegular,
                  ),
                  maxLength: 100,
                  maxLines: 1,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 5.w,
                    ),
                    labelText: "Offer Title *",
                    labelStyle: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.black26,
                      fontFamily: MyFonts.outfitRegular,
                    ),
                    counterText: '',
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black26,
                        width: 1.w,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black26,
                        width: 1.w,
                      ),
                    ),
                    disabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black26,
                        width: 1.w,
                      ),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black26,
                        width: 1.w,
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.name,
                  cursorColor: ColorConfig.whiteColor,
                ),
                SizedBox(
                  height: 10.h,
                ),
                TextField(
                  controller: logic.offerShortDesc,
                  onChanged: (value) => {},
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: ColorConfig.blackColor,
                    fontFamily: MyFonts.outfitRegular,
                  ),
                  maxLength: 100,
                  maxLines: 1,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 5.w,
                    ),
                    labelText: "Short Description *",
                    labelStyle: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.black26,
                      fontFamily: MyFonts.outfitRegular,
                    ),
                    counterText: '',
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black26,
                        width: 1.w,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black26,
                        width: 1.w,
                      ),
                    ),
                    disabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black26,
                        width: 1.w,
                      ),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black26,
                        width: 1.w,
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.name,
                  cursorColor: ColorConfig.whiteColor,
                ),
                SizedBox(
                  height: 10.h,
                ),
                TextField(
                  controller: logic.offerLongDesc,
                  onChanged: (value) => {},
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: ColorConfig.blackColor,
                    fontFamily: MyFonts.outfitRegular,
                  ),
                  maxLength: 100,
                  maxLines: 1,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 5.w,
                    ),
                    labelText: "Long Description *",
                    labelStyle: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.black26,
                      fontFamily: MyFonts.outfitRegular,
                    ),
                    counterText: '',
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black26,
                        width: 1.w,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black26,
                        width: 1.w,
                      ),
                    ),
                    disabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black26,
                        width: 1.w,
                      ),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black26,
                        width: 1.w,
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.name,
                  cursorColor: ColorConfig.whiteColor,
                ),
                SizedBox(
                  height: 10.h,
                ),
                TextField(
                  controller: logic.validFrom,
                  onChanged: (value) => {},
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: ColorConfig.blackColor,
                    fontFamily: MyFonts.outfitRegular,
                  ),
                  maxLength: 100,
                  maxLines: 1,
                  readOnly: true,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 5.w,
                    ),
                    labelText: "Valid From *",
                    labelStyle: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.black26,
                      fontFamily: MyFonts.outfitRegular,
                    ),
                    counterText: '',
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black26,
                        width: 1.w,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black26,
                        width: 1.w,
                      ),
                    ),
                    disabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black26,
                        width: 1.w,
                      ),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black26,
                        width: 1.w,
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.name,
                  cursorColor: ColorConfig.whiteColor,
                ),
                SizedBox(
                  height: 10.h,
                ),
                TextField(
                  controller: logic.validTill,
                  onChanged: (value) => {},
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: ColorConfig.blackColor,
                    fontFamily: MyFonts.outfitRegular,
                  ),
                  maxLength: 100,
                  readOnly: true,
                  maxLines: 1,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 5.w,
                    ),
                    labelText: "Valid Till *",
                    labelStyle: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.black26,
                      fontFamily: MyFonts.outfitRegular,
                    ),
                    counterText: '',
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black26,
                        width: 1.w,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black26,
                        width: 1.w,
                      ),
                    ),
                    disabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black26,
                        width: 1.w,
                      ),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black26,
                        width: 1.w,
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.name,
                  cursorColor: ColorConfig.whiteColor,
                ),
                SizedBox(
                  height: 10.h,
                ),
                TextField(
                  controller: logic.termsCondition,
                  onChanged: (value) => {},
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: ColorConfig.blackColor,
                    fontFamily: MyFonts.outfitRegular,
                  ),
                  maxLength: 100,
                  maxLines: 1,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 5.w,
                    ),
                    labelText: "Terms & Conditions",
                    labelStyle: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.black26,
                      fontFamily: MyFonts.outfitRegular,
                    ),
                    counterText: '',
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black26,
                        width: 1.w,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black26,
                        width: 1.w,
                      ),
                    ),
                    disabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black26,
                        width: 1.w,
                      ),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black26,
                        width: 1.w,
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.name,
                  cursorColor: ColorConfig.whiteColor,
                ),
              ],
            ),
          ),
          bottomNavigationBar: SizedBox(
            width: 1.sw,
            height: 50.h,
            child: Container(
              width: 1.sw,
              height: 50.h,
              color: ColorConfig.primaryColor,
              padding: EdgeInsets.symmetric(horizontal: 10.w,),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  GestureDetector(
                    onTap: (){
                      Get.offAll(
                            () => ManageOfferScreen(),
                        binding: OfferDetailScreenBinding(),
                        routeName: NavigationConstant.manageOfferScreenRoute,
                      );
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.arrow_back_ios
                          ,
                          color: ColorConfig.primaryColor,
                        ),
                        Text(
                          "BACK",
                          style: TextStyle(fontSize: 16.sp, color: ColorConfig.primaryColor, fontFamily: MyFonts.outfitMedium),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: ColorConfig.whiteColor,
                        ),
                        height: 6.r,
                        width: 6.r,
                        margin: EdgeInsets.only(right: 5.w,),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: ColorConfig.lightGreyColor,
                        ),
                        height: 6.r,
                        width: 6.r,
                        margin: EdgeInsets.only(right: 5.w,),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: ColorConfig.lightGreyColor,
                        ),
                        height: 6.r,
                        width: 6.r,
                        margin: EdgeInsets.only(right: 5.w,),
                      )
                    ],
                  ),
                  GestureDetector(
                    onTap: (){
                      Get.to(() => UploadPhotoScreen(),
                        binding: OfferDetailScreenBinding(),
                      );
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "NEXT",
                          style: TextStyle(fontSize: 16.sp, color: ColorConfig.whiteColor, fontFamily: MyFonts.outfitMedium),
                        ),
                        Icon(
                          Icons.arrow_forward_ios_sharp,
                          color: ColorConfig.whiteColor,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
