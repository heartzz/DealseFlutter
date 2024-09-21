import 'package:dealse/model/response_main_model/check_store_mobile_res.dart';

class StoreUtils{
  List<AreaListModel>? areaListModel;

  void setStoreData(List<AreaListModel>? areaListModel){
    this.areaListModel = areaListModel;
  }

  List<AreaListModel>? getAreaList(){
    return areaListModel;
  }
}