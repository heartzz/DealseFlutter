import 'package:dealse/config/navigation_config.dart';
import 'package:dealse/service/common/app_init.dart';
import 'package:dealse/service/common/tg_log.dart';
import 'package:dealse/service/singleton/shared_preferences.dart';
import 'package:dealse/utils/constants/app_constant.dart';
import 'package:dealse/utils/constants/navigation_constant.dart';
import 'package:dealse/view/dashboard/dashboard_screen_binding.dart';
import 'package:dealse/view/dashboard/dashboard_screen_view.dart';
import 'package:dealse/view/login/login_screen_binding.dart';
import 'package:dealse/view/login/login_screen_view.dart';
import 'package:get/get.dart';

class SplashScreenLogic extends GetxController {
  @override
  Future<void> onInit() async {
    // Delay for wait till flavor initialize

    TGLog.d("Initialize init");
    await initService();
    TGLog.d("Initialize init end");
    await Future.delayed(const Duration(seconds: 3));
    String accessToken = await TGSharedPreferences.getInstance().get(KEY_TOKEN) ?? "";
    if(accessToken.isEmpty || accessToken == ""){
      Get.offAll(
            () => LoginScreenView(),
        binding: LoginScreenBinding(),
        routeName: NavigationConstant.loginScreenRoute,
      );
    }
    else{
      Get.offAll(
            () => DashboardScreen(),
        binding: DashboardScreenBinding(),
        routeName: NavigationConstant.dashboardScreenRoute,
      );
    }
    super.onInit();
  }
}
