class CheckStoreMobileReq{
  String? mobileNo;

  CheckStoreMobileReq({this.mobileNo});

  CheckStoreMobileReq.fromJson(Map<String,dynamic> json)
  {
    mobileNo = json['mobileNo'];
  }

  Map<String,dynamic> toJson() =>{
    'mobileNo' :mobileNo,
  };
}