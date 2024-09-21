class GetAuthTokenRes {
  AuthTokenData? data;
  int? code;
  String? message;

  GetAuthTokenRes({this.data, this.code, this.message});

  GetAuthTokenRes.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? AuthTokenData.fromJson(json['data']) : null;
    code = json['code'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['code'] = code;
    data['message'] = message;
    return data;
  }
}

class AuthTokenData {
  String? token;

  AuthTokenData({this.token});

  AuthTokenData.fromJson(Map<String, dynamic> json) {
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['token'] = token;
    return data;
  }
}
