class AreaStoreTypeListRes {
  AreaStoreListData? data;
  int? code;
  String? message;

  AreaStoreTypeListRes({this.data, this.code, this.message});

  AreaStoreTypeListRes.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? AreaStoreListData.fromJson(json['data']) : null;
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

class AreaStoreListData {
  List<AreaListModel>? areaListModel;
  List<StoreTypeApiModel>? storeTypeApiModel;

  AreaStoreListData({this.areaListModel, this.storeTypeApiModel});

  AreaStoreListData.fromJson(Map<String, dynamic> json) {
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
