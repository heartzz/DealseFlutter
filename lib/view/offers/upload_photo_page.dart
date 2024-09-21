import 'package:dealse/config/color_config.dart';
import 'package:dealse/config/font_config.dart';
import 'package:dealse/config/navigation_config.dart';
import 'package:dealse/utils/constants/navigation_constant.dart';
import 'package:dealse/view/offers/offers_details_logic.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'offer_details_screen.dart';
import 'offers_details_binding.dart';

class UploadPhotoScreen extends GetView<OffersDetailLogic> {
  UploadPhotoScreen({super.key});

  final logic = Get.find<OffersDetailLogic>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PopScope(
        canPop: true,
        onPopInvoked: (didPop) => Get.back(),
        child: Scaffold(
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
                    Get.back();
                  },
                );
              },
            ),
          ),
          body: Obx(() => Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.w,
                  vertical: 30.h,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                    scrollDirection: Axis.vertical,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Number of columns in the grid
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 8.0,
                    ),
                    itemCount: logic.images.length + 1,
                    itemBuilder: (context, index) {
                      if (index == logic.images.length) {
                        return GestureDetector(
                          onTap: logic.pickImage,
                          child: Container(
                            color: Colors.grey[300],
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.add_a_photo,
                                  color: Colors.black54,
                                ),
                                Text(
                                  "Add Image",
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    fontFamily: MyFonts.outfitRegular,
                                    color: Colors.black54,
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      } else {
                        return Image.file(
                          logic.images.value[index],
                          fit: BoxFit.cover,
                        );
                      }
                    },
                  ),
                ),
              )),
          bottomNavigationBar: SizedBox(
            width: 1.sw,
            height: 50.h,
            child: Container(
              width: 1.sw,
              height: 50.h,
              color: ColorConfig.primaryColor,
              padding: EdgeInsets.symmetric(
                horizontal: 10.w,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.arrow_back_ios,
                          color: ColorConfig.whiteColor,
                        ),
                        Text(
                          "BACK",
                          style: TextStyle(fontSize: 16.sp, color: ColorConfig.whiteColor, fontFamily: MyFonts.outfitMedium),
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
                          color: ColorConfig.lightGreyColor,
                        ),
                        height: 6.r,
                        width: 6.r,
                        margin: EdgeInsets.only(
                          right: 5.w,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: ColorConfig.whiteColor,
                        ),
                        height: 6.r,
                        width: 6.r,
                        margin: EdgeInsets.only(
                          right: 5.w,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: ColorConfig.lightGreyColor,
                        ),
                        height: 6.r,
                        width: 6.r,
                        margin: EdgeInsets.only(
                          right: 5.w,
                        ),
                      )
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(
                        () => OfferDetailsScreen(),
                        binding: OfferDetailScreenBinding(),
                        routeName: NavigationConstant.offerDetailScreenRoute,
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
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
