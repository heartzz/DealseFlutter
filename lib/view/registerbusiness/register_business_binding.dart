import 'package:dealse/view/registerbusiness/register_business_logic.dart';
import 'package:get/get.dart';

class RegisterScreenBinding extends Bindings
{
  @override
  void dependencies() {
    Get.put<RegisterBusinessLogic>(RegisterBusinessLogic());
  }

}