import 'package:dealse/model/response_main_model/check_store_mobile_res.dart';
import 'package:dealse/service/response/tg_response.dart';


class CheckStoreMobileResMain extends TGResponse
{
  CheckStoreMobileRes _authTokenRes = CheckStoreMobileRes();
  CheckStoreMobileResMain();

  CheckStoreMobileResMain.fromJson(dynamic json)
  {
    fromJson(json);
  }

  @override
  fromJson(json) {
    _authTokenRes = CheckStoreMobileRes.fromJson(json);
  }

  CheckStoreMobileRes getStoreDetailObj()
  {
    return _authTokenRes;
  }
}
