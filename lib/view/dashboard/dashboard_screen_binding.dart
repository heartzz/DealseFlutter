import 'package:dealse/view/dashboard/dashboard_screen_logic.dart';
import 'package:get/get.dart';

class DashboardScreenBinding extends Bindings
{
  @override
  void dependencies() {
    Get.put(DashboardLogic());
  }

}