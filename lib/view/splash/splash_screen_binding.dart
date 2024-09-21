import 'package:dealse/view/splash/splash_screen_logic.dart';
import 'package:get/get.dart';

class SplashScreenBinding extends Bindings
{
  @override
  void dependencies() {
    Get.put<SplashScreenLogic>(SplashScreenLogic());
  }

}