import 'package:dealse/config/color_config.dart';
import 'package:dealse/config/font_config.dart';
import 'package:dealse/utils/constants/image_constant.dart';
import 'package:dealse/utils/constants/navigation_constant.dart';
import 'package:dealse/view/offers/enter_offers_detail_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'offers_details_binding.dart';
import 'offers_details_logic.dart';

class ManageOfferScreen extends StatelessWidget {
  ManageOfferScreen({super.key});

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
              "Manage Offers",
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
                  onPressed: () {},
                );
              },
            ),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.w,
              vertical: 15.h,
            ),
            child: ListView.builder(
              physics: const ScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: 5,
              itemBuilder: (context, index) {
                return _offerDetailCard();
              },
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            backgroundColor: ColorConfig.primaryColor,
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
        ),
      ),
    );
  }

  Widget _offerDetailCard() {
    return GestureDetector(
      onTap: (){
        Get.offAll(
              () => EnterOfferDetailsScreen(),
          binding: OfferDetailScreenBinding(),
          routeName: NavigationConstant.enterOfferDetails,
        );
      },
      child: Container(
        width: 1.sw,
        decoration: BoxDecoration(
          color: ColorConfig.whiteColor,
          borderRadius: BorderRadius.all(
            Radius.circular(
              2,
            ),
          ),
          boxShadow: [BoxShadow(
          color: ColorConfig.lightGreyColor,
          blurRadius: 3,
        )]
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 8.w,
          vertical: 10.h,
        ),
        margin: EdgeInsets.only(top: 10.h,),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              APPLOGO,
              height: 80.h,
              width: 80.w,
            ),
            SizedBox(
              width: 10.w,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        "ABCD",
                        style: TextStyle(
                          fontFamily: MyFonts.outfitMedium,
                          fontSize: 14.sp,
                          color: ColorConfig.primaryColor,
                        ),
                      ),
                      Text(
                        "Active",
                        style: TextStyle(
                          fontFamily: MyFonts.outfitMedium,
                          fontSize: 12.sp,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5.h,),
                  Text(
                    "Abcdefg",
                    style: TextStyle(
                      fontFamily: MyFonts.outfitMedium,
                      fontSize: 12.sp,
                      color: ColorConfig.greyColor,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        "03 Aug 2014 - 10 Aug 2024",
                        style: TextStyle(
                          fontFamily: MyFonts.outfitMedium,
                          fontSize: 10.sp,
                          color: ColorConfig.blackColor,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.edit,
                          color: ColorConfig.blackColor,
                          size: 20,
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
    );
  }
}
