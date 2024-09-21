import 'package:dealse/config/color_config.dart';
import 'package:dealse/config/font_config.dart';
import 'package:dealse/utils/constants/image_constant.dart';
import 'package:dealse/utils/constants/navigation_constant.dart';
import 'package:dealse/view/dashboard/dashboard_screen_logic.dart';
import 'package:dealse/view/offers/manage_offer_screen.dart';
import 'package:dealse/view/offers/offers_details_binding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DashboardScreen extends GetView<DashboardLogic> {
  DashboardScreen({super.key});



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PopScope(
        canPop: true,
        onPopInvoked: (didPop) {},
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: ColorConfig.primaryColor,
          appBar: PreferredSize(
            preferredSize: Size(1.sw, 60.h),
            child: Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        spreadRadius: 5,
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: AppBar(
                    backgroundColor: ColorConfig.primaryColor,
                    title: Text(
                      "HarshulShop",
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: ColorConfig.whiteColor,
                        fontFamily: MyFonts.outfitMedium,
                      ),
                    ),
                    leading: Builder(
                      builder: (context) {
                        return IconButton(
                          icon: const Icon(Icons.menu),
                          color: ColorConfig.whiteColor,
                          onPressed: () {
                            Scaffold.of(context).openDrawer();
                          },
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          drawer: Drawer(
            backgroundColor: ColorConfig.whiteColor,
            child: Obx(
              () => ListView(
                padding: EdgeInsets.zero,
                children: [
                  DrawerHeader(
                    child: Image.asset(
                      APPLOGO,
                      height: 50.h,
                      width: 1.sw,
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      controller.items[0].iconName,
                      color: controller.items[0].isSelected ? ColorConfig.primaryColor : ColorConfig.greyColor,
                    ),
                    title: Text(
                      controller.items[0].title,
                      style: TextStyle(
                        fontFamily: MyFonts.outfitMedium,
                        fontSize: 14.sp,
                        color: controller.items[0].isSelected ? ColorConfig.primaryColor : ColorConfig.greyColor,
                      ),
                    ),
                    onTap: () {
                      controller.setItemSelected(0);
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: Icon(
                      controller.items[1].iconName,
                      color: controller.items[1].isSelected ? ColorConfig.primaryColor : ColorConfig.greyColor,
                    ),
                    title: Text(
                      controller.items[1].title,
                      style: TextStyle(
                        fontFamily: MyFonts.outfitMedium,
                        fontSize: 14.sp,
                        color: controller.items[1].isSelected ? ColorConfig.primaryColor : ColorConfig.greyColor,
                      ),
                    ),
                    onTap: () {
                      controller.setItemSelected(1);
                      Get.offAll(
                        () => ManageOfferScreen(),
                        binding: OfferDetailScreenBinding(),
                        routeName: NavigationConstant.manageOfferScreenRoute,
                      );
                    },
                  ),
                  ListTile(
                    leading: Icon(
                      controller.items[2].iconName,
                      color: controller.items[2].isSelected ? ColorConfig.primaryColor : ColorConfig.greyColor,
                    ),
                    title: Text(
                      controller.items[2].title,
                      style: TextStyle(
                        fontFamily: MyFonts.outfitMedium,
                        fontSize: 14.sp,
                        color: controller.items[2].isSelected ? ColorConfig.primaryColor : ColorConfig.greyColor,
                      ),
                    ),
                    onTap: () {
                      controller.setItemSelected(2);
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: Icon(
                      controller.items[3].iconName,
                      color: controller.items[3].isSelected ? ColorConfig.primaryColor : ColorConfig.greyColor,
                    ),
                    title: Text(
                      controller.items[3].title,
                      style: TextStyle(
                        fontFamily: MyFonts.outfitMedium,
                        fontSize: 14.sp,
                        color: controller.items[3].isSelected ? ColorConfig.primaryColor : ColorConfig.greyColor,
                      ),
                    ),
                    onTap: () {
                      controller.setItemSelected(3);
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: Icon(
                      controller.items[4].iconName,
                      color: controller.items[4].isSelected ? ColorConfig.primaryColor : ColorConfig.greyColor,
                    ),
                    title: Text(
                      controller.items[4].title,
                      style: TextStyle(
                        fontFamily: MyFonts.outfitMedium,
                        fontSize: 14.sp,
                        color: controller.items[4].isSelected ? ColorConfig.primaryColor : ColorConfig.greyColor,
                      ),
                    ),
                    onTap: () {
                      controller.setItemSelected(4);
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: Icon(
                      controller.items[5].iconName,
                      color: controller.items[5].isSelected ? ColorConfig.primaryColor : ColorConfig.greyColor,
                    ),
                    title: Text(
                      controller.items[5].title,
                      style: TextStyle(
                        fontFamily: MyFonts.outfitMedium,
                        fontSize: 14.sp,
                        color: controller.items[5].isSelected ? ColorConfig.primaryColor : ColorConfig.greyColor,
                      ),
                    ),
                    onTap: () {
                      controller.setItemSelected(5);
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
            ),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 1.sw,
                margin: EdgeInsets.symmetric(
                  horizontal: 20.w,
                  vertical: 20.h,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 10.w,
                  vertical: 10.h,
                ),
                decoration: BoxDecoration(
                  color: ColorConfig.whiteColor,
                  border: Border.all(
                    color: ColorConfig.whiteColor,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      6.r,
                    ),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Redeem Coupon",
                      style: TextStyle(
                        fontSize: 20.sp,
                        color: Colors.black26,
                        fontFamily: MyFonts.outfitSemiBold,
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    SizedBox(
                      width: 1.sw,
                      height: 50.h,
                      child: TextFormField(
                        controller: controller.couponCode,
                        readOnly: false,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontFamily: MyFonts.outfitRegular,
                          color: ColorConfig.blackColor,
                        ),
                        cursorColor: ColorConfig.blackColor,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 12.w,
                            vertical: 12.h,
                          ),
                          hintText: "Enter coupon code",
                          hintStyle: TextStyle(
                            fontSize: 14.sp,
                            fontFamily: MyFonts.outfitRegular,
                            color: Colors.black26,
                          ),
                          counterText: '',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                6.r,
                              ),
                            ),
                            borderSide: BorderSide(
                              width: 1,
                              color: Colors.black26,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black26,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(
                              6.r,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 1,
                              color: Colors.black26,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                6.r,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 30.w,
                        vertical: 15.h,
                      ),
                      child: SizedBox(
                        width: 1.sw,
                        height: 40.h,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            "Check Status & Redeem",
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontFamily: MyFonts.outfitSemiBold,
                              color: ColorConfig.whiteColor,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ColorConfig.primaryColor,
                            disabledBackgroundColor: ColorConfig.primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 1.sw,
                      child: Text(
                        "OR",
                        style: TextStyle(
                          fontFamily: MyFonts.outfitRegular,
                          fontSize: 14.sp,
                          color: Colors.black26,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 15.h,
                        horizontal: 15.w,
                      ),
                      decoration: BoxDecoration(
                        color: HexColor("#F2F7FE"),
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            6.r,
                          ),
                        ),
                        border: Border.all(
                          color: Colors.grey,
                          width: 1,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Icon(
                            size: 40,
                            Icons.qr_code,
                            color: ColorConfig.blackColor,
                          ),
                          SizedBox(
                            width: 15.w,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Scan Coupon QR Code",
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  color: ColorConfig.blackColor,
                                  fontFamily: MyFonts.outfitSemiBold,
                                ),
                              ),
                              Text(
                                "Scan for quick redemption",
                                style: TextStyle(
                                  fontFamily: MyFonts.outfitRegular,
                                  fontSize: 12.sp,
                                  color: Colors.black26,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 1.sw,
                child: Text(
                  "Last redemptions",
                  style: TextStyle(
                    color: ColorConfig.whiteColor,
                    fontSize: 18.sp,
                    fontFamily: MyFonts.outfitMedium,
                  ),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
