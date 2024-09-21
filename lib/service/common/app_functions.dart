

import 'package:dealse/service/request/tg_request.dart';
import 'package:dealse/service/singleton/session.dart';
import 'package:dealse/service/singleton/shared_preferences.dart';
import 'package:dealse/utils/constants/app_constant.dart';
import 'package:dealse/utils/flavor.dart';

import 'app_constants.dart';

Map<String, String> defaultHeaders() {
  Map<String, String> headers = {};
  headers['Content-Type'] = 'application/json';
  headers['Cache-Control'] = 'no-store, no-cache, must-revalidate';

  // headers['locale'] = TGLocale.currentLocale.toString();
  return headers;
}

void setAccessTokenInRequestHeader() async {
  String accesstoken = await TGSharedPreferences.getInstance().get(KEY_TOKEN) ?? '';
  if (accesstoken.isEmpty == false) {
    TGRequest.defaultHeaders!['Authorization'] = accesstoken;
  } else {
    TGRequest.defaultHeaders!.remove('Authorization');
  }
}

void saveKeyValue(String key, dynamic value) {
  TGSession.getInstance().set(key, value);
  TGSharedPreferences.getInstance().set(key, value);
}

void removeKey(String key) {
  TGSharedPreferences.getInstance().remove(key);
  TGSession.getInstance().remove(key);
}

bool isProd() {
  return TGFlavor.name() == FLAVOR_PROD;
}
