import 'package:dealse/config/color_config.dart';
import 'package:dealse/config/font_config.dart';
import 'package:dealse/utils/constants/image_constant.dart';
import 'package:dealse/utils/constants/navigation_constant.dart';
import 'package:dealse/view/login/login_screen_binding.dart';
import 'package:dealse/view/login/login_screen_logic.dart';
import 'package:dealse/view/login/login_verification_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginScreenView extends StatelessWidget {
  LoginScreenView({super.key});

  final logic = Get.find<LoginScreenLogic>();

  @override
  Widget build(BuildContext context) {
    return _loginScreenContent();
  }

  Widget _loginScreenContent() {
    return SafeArea(
        child: PopScope(
      onPopInvoked: (didPop) => {},
      canPop: true,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage(LOGINBG,), // Replace with your image asset
                  fit: BoxFit.fill,
                  colorFilter: ColorFilter.mode(ColorConfig.primaryColor.withOpacity(0.9), BlendMode.srcOver),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 50.h,
                left: 30.w,
                right: 30.w,
                bottom: 150.h
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "DealSe",
                        style: TextStyle(
                          fontSize: 26.sp,
                          color: ColorConfig.whiteColor,
                          fontFamily: MyFonts.outfitMedium,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        "Grow your business together",
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: ColorConfig.whiteColor,
                          fontFamily: MyFonts.outfitRegular,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        color: ColorConfig.whiteColor,
                        height: 2.h,
                        width: 50.w,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: 5.h,
                        ),
                        child: Text(
                          "Let's Start",
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: ColorConfig.whiteColor,
                            fontFamily: MyFonts.outfitMedium,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextField(
                        controller: logic.mobileNumber,
                        onChanged: (value) => {},
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: ColorConfig.whiteColor,
                          fontFamily: MyFonts.outfitRegular,
                        ),
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        maxLength: 10,
                        maxLines: 1,
                        decoration: InputDecoration(
                          hintText: "Mobile Number",
                          hintStyle: TextStyle(
                            fontSize: 14.sp,
                            color: ColorConfig.whiteColor,
                            fontFamily: MyFonts.outfitRegular,
                          ),
                          counterText: '',
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: ColorConfig.whiteColor,
                              width: 1.w,
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: ColorConfig.whiteColor,
                              width: 1.w,
                            ),
                          ),
                          disabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: ColorConfig.whiteColor,
                              width: 1.w,
                            ),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: ColorConfig.whiteColor,
                              width: 1.w,
                            ),
                          ),
                        ),
                        keyboardType: TextInputType.phone,
                        cursorColor: ColorConfig.whiteColor,
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      GestureDetector(
                        onTap: () {
                          if (logic.mobileNumber.text.length == 10) {
                            logic.getAuthTokenRequest();

                          } else {}
                        },
                        child: CircleAvatar(
                          maxRadius: 30.r,
                          backgroundColor: ColorConfig.whiteColor,
                          child: Center(
                            child: Icon(
                              Icons.arrow_forward_ios_sharp,
                              size: 20.h,
                              color: ColorConfig.primaryColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(bottom: 15.h,child: SizedBox(
              height: 50.h,
              width: 1.sw,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 15.h,
                  horizontal: 20.w,
                ),
                child: Text(
                  "Sign up for an account?",
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: ColorConfig.whiteColor,
                    fontFamily: MyFonts.outfitRegular,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),)
          ],
        ),

      ),
    ));
  }
}
