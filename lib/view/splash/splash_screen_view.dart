import 'package:dealse/config/color_config.dart';
import 'package:dealse/config/font_config.dart';
import 'package:dealse/utils/constants/image_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreenView extends StatelessWidget {
  const SplashScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return _splashScreenContent();
  }

  Widget _splashScreenContent() {
    return SafeArea(
        child: PopScope(
            onPopInvoked: (didPop) => {},
            canPop: true,
            child: Scaffold(
              backgroundColor: ColorConfig.primaryColor,
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      APPLOGO,
                      height: 100.h,
                      width: 200.w,
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Text(
                      "DealSe",
                      style: TextStyle(
                        color: ColorConfig.whiteColor,
                        fontSize: 26.sp,
                        fontFamily: MyFonts.outfitBold,
                      ),
                    ),
                  ],
                ),
              ),
            )));
  }
}
