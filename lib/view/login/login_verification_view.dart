import 'package:dealse/config/color_config.dart';
import 'package:dealse/config/font_config.dart';
import 'package:dealse/utils/constants/navigation_constant.dart';
import 'package:dealse/view/login/login_screen_logic.dart';
import 'package:dealse/view/registerbusiness/register_business_binding.dart';
import 'package:dealse/view/registerbusiness/register_business_view.dart';
import 'package:dealse/view/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

class LoginVerificationView extends StatelessWidget {
  LoginVerificationView({super.key});

  final logic = Get.find<LoginScreenLogic>();

  @override
  Widget build(BuildContext context) {
    return _loginVerificationContent();
  }

  Widget _loginVerificationContent() {
    return SafeArea(
        child: PopScope(
      canPop: true,
      onPopInvoked: (didPop) => {},
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: ColorConfig.whiteColor,
        appBar: PreferredSize(
          preferredSize: Size(
            1.sw,
            60.h,
          ),
          child: Container(
            color: ColorConfig.primaryColor,
            height: 70.h,
            width: 1.sw,
            padding: EdgeInsets.only(
              left: 20.w,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Icon(
                  Icons.arrow_back_sharp,
                  size: 20.h,
                  color: ColorConfig.whiteColor,
                ),
                SizedBox(
                  width: 20.w,
                ),
                Text(
                  "Verification",
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: ColorConfig.whiteColor,
                    fontFamily: MyFonts.outfitMedium,
                  ),
                )
              ],
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 50.h,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                logic.mobileNumber.text,
                style: TextStyle(
                  fontSize: 20.sp,
                  fontFamily: MyFonts.outfitMedium,
                  color: ColorConfig.primaryColor,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 30.h,
              ),
              SizedBox(
                width: 1.sw,
                child: Text(
                  "Sit back and relax while we are verifying your mobile number",
                  maxLines: 5,
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontFamily: MyFonts.outfitRegular,
                    color: ColorConfig.blackColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              SizedBox(
                width: 1.sw,
                child: Text(
                  "(Enter the OTP below manually if we fail to detect automatically)",
                  maxLines: 5,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontFamily: MyFonts.outfitRegular,
                    color: ColorConfig.greyColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 50.h,
              ),
              Pinput(
                autofocus: false,
                controller: logic.pinController,
                focusNode: FocusNode(),
                length: 6,
                toolbarEnabled: false,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                    RegExp(r'[0-9]'),
                  ),
                ],
                keyboardType: TextInputType.number,
                defaultPinTheme: PinTheme(
                  width: 56.w,
                  height: 50.h,
                  textStyle: TextStyle(
                    fontSize: 12.sp,
                    color: ColorConfig.primaryColor,
                    fontFamily: MyFonts.outfitRegular,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: ColorConfig.blackColor,
                    ),
                  ),
                ),
                onChanged: (value) {
                  if (value.length == 6) {
                    logic.isValidOTP.value = true;
                  } else {
                    logic.isValidOTP.value = false;
                  }
                },
              ),
              SizedBox(
                height: 30.h,
              ),
              GestureDetector(
                onTap: () {},
                child: Text(
                  "Did not receive OTP? Resend Code",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontFamily: MyFonts.outfitRegular,
                    color: ColorConfig.greyColor,
                  ),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              AppButton(
                onPress: () {
                  Get.offAll(
                    () => RegisterBusinessView(),
                    binding: RegisterScreenBinding(),
                    routeName: NavigationConstant.registerBusinessScreenRoute,
                  );
                },
                title: "VERIFY",
                isButtonEnable: logic.isValidOTP,
              )
            ],
          ),
        ),
      ),
    ));
  }
}
