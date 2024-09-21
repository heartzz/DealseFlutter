import 'package:dealse/model/response_model/area_store_list_res.dart';
import 'package:dealse/service/response/tg_response.dart';


class AreaStoreListResMain extends TGResponse
{
  AreaStoreTypeListRes _authTokenRes = AreaStoreTypeListRes();
  AreaStoreListResMain();

  AreaStoreListResMain.fromJson(dynamic json)
  {
    fromJson(json);
  }

  @override
  fromJson(json) {
    _authTokenRes = AreaStoreTypeListRes.fromJson(json);
  }

  AreaStoreTypeListRes getListData()
  {
    return _authTokenRes;
  }
}
