class GetAuthToken{
  String? clientSecret;

  GetAuthToken({this.clientSecret});

  GetAuthToken.fromJson(Map<String,dynamic> json)
  {
    clientSecret = json['clientSecret'];
  }

  Map<String,dynamic> toJson() =>{
    'clientSecret' :clientSecret,
  };
}