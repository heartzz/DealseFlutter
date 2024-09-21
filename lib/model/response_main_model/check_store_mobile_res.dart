class CheckStoreMobileRes {
  StoreData? data;
  int? code;
  String? message;

  CheckStoreMobileRes({this.data, this.code, this.message});

  CheckStoreMobileRes.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new StoreData.fromJson(json['data']) : null;
    code = json['code'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['code'] = this.code;
    data['message'] = this.message;
    return data;
  }
}

class StoreData {
  String? storeId;
  String? logoUrl;
  int? areaId;
  int? storeTypeId;
  String? name;
  String? email;
  String? mobileNo1;
  String? mobileNo2;
  String? address;
  String? deviceID;
  int? latitude;
  int? longitude;
  String? ownerName;
  String? ownerMobileNo;
  String? about;
  String? oldLogo;
  String? qrCode;
  String? addedDate;
  List<AreaListModel>? areaListModel;
  List<StoreTypeApiModel>? storeTypeApiModel;

  StoreData(
      {this.storeId,
        this.logoUrl,
        this.areaId,
        this.storeTypeId,
        this.name,
        this.email,
        this.mobileNo1,
        this.mobileNo2,
        this.address,
        this.deviceID,
        this.latitude,
        this.longitude,
        this.ownerName,
        this.ownerMobileNo,
        this.about,
        this.oldLogo,
        this.qrCode,
        this.addedDate,
        this.areaListModel,
        this.storeTypeApiModel});

  StoreData.fromJson(Map<String, dynamic> json) {
    storeId = json['storeId'];
    logoUrl = json['logoUrl'];
    areaId = json['areaId'];
    storeTypeId = json['storeTypeId'];
    name = json['name'];
    email = json['email'];
    mobileNo1 = json['mobileNo1'];
    mobileNo2 = json['mobileNo2'];
    address = json['address'];
    deviceID = json['deviceID'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    ownerName = json['ownerName'];
    ownerMobileNo = json['ownerMobileNo'];
    about = json['about'];
    oldLogo = json['oldLogo'];
    qrCode = json['qrCode'];
    addedDate = json['addedDate'];
    if (json['areaListModel'] != null) {
      areaListModel = <AreaListModel>[];
      json['areaListModel'].forEach((v) {
        areaListModel!.add(new AreaListModel.fromJson(v));
      });
    }
    if (json['storeTypeApiModel'] != null) {
      storeTypeApiModel = <StoreTypeApiModel>[];
      json['storeTypeApiModel'].forEach((v) {
        storeTypeApiModel!.add(new StoreTypeApiModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['storeId'] = this.storeId;
    data['logoUrl'] = this.logoUrl;
    data['areaId'] = this.areaId;
    data['storeTypeId'] = this.storeTypeId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['mobileNo1'] = this.mobileNo1;
    data['mobileNo2'] = this.mobileNo2;
    data['address'] = this.address;
    data['deviceID'] = this.deviceID;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['ownerName'] = this.ownerName;
    data['ownerMobileNo'] = this.ownerMobileNo;
    data['about'] = this.about;
    data['oldLogo'] = this.oldLogo;
    data['qrCode'] = this.qrCode;
    data['addedDate'] = this.addedDate;
    if (this.areaListModel != null) {
      data['areaListModel'] =
          this.areaListModel!.map((v) => v.toJson()).toList();
    }
    if (this.storeTypeApiModel != null) {
      data['storeTypeApiModel'] =
          this.storeTypeApiModel!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AreaListModel {
  int? areaId;
  String? areaName;
  double? latitude;
  double? longitude;

  AreaListModel({this.areaId, this.areaName, this.latitude, this.longitude});

  AreaListModel.fromJson(Map<String, dynamic> json) {
    areaId = json['areaId'];
    areaName = json['areaName'];
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['areaId'] = this.areaId;
    data['areaName'] = this.areaName;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    return data;
  }
}

class StoreTypeApiModel {
  int? storeTypeId;
  String? storeTypeName;
  String? storeTypeImage;

  StoreTypeApiModel(
      {this.storeTypeId, this.storeTypeName, this.storeTypeImage});

  StoreTypeApiModel.fromJson(Map<String, dynamic> json) {
    storeTypeId = json['storeTypeId'];
    storeTypeName = json['storeTypeName'];
    storeTypeImage = json['storeTypeImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['storeTypeId'] = this.storeTypeId;
    data['storeTypeName'] = this.storeTypeName;
    data['storeTypeImage'] = this.storeTypeImage;
    return data;
  }
}
