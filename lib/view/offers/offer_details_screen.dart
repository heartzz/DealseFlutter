import 'package:dealse/config/color_config.dart';
import 'package:dealse/config/font_config.dart';
import 'package:dealse/config/navigation_config.dart';
import 'package:dealse/view/offers/offers_details_logic.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';

class OfferDetailsScreen extends GetView<OffersDetailLogic> {
  const OfferDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PopScope(
        canPop: true,
        onPopInvoked: (didPop) {},
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
                  onPressed: (){
                    Get.back();
                  },
                );
              },
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 250.h,
                  padding: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade900,
                  ),
                  child: Stack(
                    children: [
                      offerImages(),
                      Positioned(
                        bottom: 10.h,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 1.sw,
                              child: Text(
                                'HarshulShop',
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  color: Colors.white,
                                ),
                                maxLines: 5,
                              ),
                            ),
                            SizedBox(height: 8.h),
                            SizedBox(
                              width: 1.sw,
                              child: Text(
                                '49-50, Avanishpark Society, Nehru Nagar, C.T.M, Hatkeshwar, Ahmedabad, Gujarat 380008, India',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Colors.white70,
                                ),
                                maxLines: 5,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 16.h),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Abcd',
                        style: TextStyle(
                          fontSize: 24.sp,
                          color: Colors.black,
                            fontFamily: MyFonts.outfitMedium
                        ),
                      ),
                      Text(
                        'Abcdefg',
                        style: TextStyle(
                          fontSize: 18.sp,
                          color: Colors.grey,
                          fontFamily: MyFonts.outfitRegular
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              _rateView(),
                              SizedBox(width: 4.w),
                              Text('0', style: TextStyle(fontSize: 16.sp)),
                            ],
                          ),
                          Text(
                            'N/A km',
                            style: TextStyle(fontSize: 16.sp, color: Colors.green),
                          ),
                        ],
                      ),
                      SizedBox(height: 16.h),
                      Divider(thickness: 1.h),
                      SizedBox(height: 8.h),
                      SizedBox(
                        width: 1.sw,
                        child: Text(
                          'Details',
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Valid Till',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                '10 Aug 2024',
                                style: TextStyle(fontSize: 16.sp),
                              ),
                            ],
                          ),
                          SizedBox(height: 10.h,),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Phone',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: Colors.grey,
                                ),
                              ),
                              GestureDetector(
                                onTap: (){
                                  controller.makePhoneCall("8460403453");
                                },
                                child: Text(
                                  '8460403453',
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 16.h),
                      Divider(thickness: 1.h),
                      SizedBox(height: 8.h),
                      Text(
                        'About',
                        style: TextStyle(
                            fontSize: 24.sp,
                            color: Colors.black,
                            fontFamily: MyFonts.outfitMedium
                        ),
                      ),
                      SizedBox(
                        width: 1.sw,
                        child: Text(
                          'ofhgfhgfgffffffffffffffffffffffffffffffffffff',
                          style: TextStyle(
                              fontSize: 18.sp,
                              color: Colors.grey,
                              fontFamily: MyFonts.outfitRegular
                          ),
                          maxLines: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.h,),
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
              padding: EdgeInsets.symmetric(
                horizontal: 10.w,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  GestureDetector(
                    onTap: (){
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
                      )
                    ],
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "DONE",
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

  Widget _rateView(){
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return GestureDetector(
          onTap: () {

          },
          child: Icon(
            index < 4 ? Icons.star : Icons.star_border,
            color: index < 4 ? Colors.amber : Colors.grey,
            size: 16.sp,
          ),
        );
      }),
    );
  }

  Widget offerImages(){
    return CarouselSlider(
      options: CarouselOptions(
        height: 250.h,
        enlargeCenterPage: true,
        autoPlay: true,
        aspectRatio: 16 / 9,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        viewportFraction: 0.8,
      ),
      items: controller.offerImgList.map((stack) {
        return Builder(
          builder: (BuildContext context) {
            return Image.network(
              stack,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            );
          },
        );
      }).toList(),
    );
  }
}
