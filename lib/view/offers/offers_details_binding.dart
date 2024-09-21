import 'package:dealse/view/offers/offers_details_logic.dart';
import 'package:get/get.dart';

class OfferDetailScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<OffersDetailLogic>(
      OffersDetailLogic(),
    );
  }
}
