import 'package:dealse/model/response_main_model/get_auth_token_res.dart';
import 'package:dealse/service/response/tg_response.dart';


class GetAuthTokenResMain extends TGResponse
{
  GetAuthTokenRes _authTokenRes = GetAuthTokenRes();
  GetAuthTokenResMain();

  GetAuthTokenResMain.fromJson(dynamic json)
  {
    fromJson(json);
  }

  @override
  fromJson(json) {
    _authTokenRes = GetAuthTokenRes.fromJson(json);
  }

  GetAuthTokenRes getAuthTokenResObj()
  {
    return _authTokenRes;
  }
}
