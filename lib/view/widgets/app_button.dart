import 'package:dealse/config/color_config.dart';
import 'package:dealse/config/font_config.dart';
import 'package:dealse/service/common/tg_log.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// Common button widget
class AppButton extends StatelessWidget {
  AppButton({Key? key, required this.onPress, required this.title, required this.isButtonEnable,this.width}) : super(key: key);
  final VoidCallback? onPress;
  final String title;
  RxBool isButtonEnable = true.obs;
  var width;

  @override
  Widget build(BuildContext context) {
    TGLog.d("On Button preeess---$isButtonEnable");
    return SizedBox(
      height: 52.h,
      width: width,
      child: Obx(() {
        return ElevatedButton(
          onPressed: isButtonEnable.value ? onPress : null,
          style: ElevatedButton.styleFrom(
            foregroundColor: isButtonEnable.value ? ColorConfig.primaryColor : ColorConfig.lightGreyColor,
            backgroundColor: isButtonEnable.value ? ColorConfig.primaryColor : ColorConfig.lightGreyColor,
            textStyle: TextStyle(fontSize: 12.sp, fontFamily: MyFonts.outfitMedium),
            disabledBackgroundColor: ColorConfig.lightGreyColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: isButtonEnable.value
                ? TextStyle(
                    fontFamily: MyFonts.outfitMedium,
                    fontSize: 14.sp,
                    color: ColorConfig.whiteColor,
                  )
                : TextStyle(
                    fontFamily: MyFonts.outfitMedium,
                    fontSize: 14.sp,
                    color: ColorConfig.primaryColor,
                  ),
          ),
        );
      }),
    );
  }
}

