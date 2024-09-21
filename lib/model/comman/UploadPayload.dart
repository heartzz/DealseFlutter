import 'package:http/http.dart';

import '../../service/request/tg_upload_multiple_file_request.dart';

class UploadPayLoad extends TGUploadMultipleFilesRequest
{
  List<MultipartFile>? uploadFiles;

  UploadPayLoad({this.uploadFiles});

  UploadPayLoad.fromJson(Map<String, dynamic> json) {
    uploadFiles = json['uploadFiles'];
  }


  Map<String, dynamic> toJson() => {
    'uploadFiles' : uploadFiles
  };



  @override
  String body() {
    return "";
  }

  @override
  String getUri() {
    return "api/v1/Store/AddStoreForStoreApp";
  }

  @override
  List<MultipartFile> files() {
    return uploadFiles!;
  }

}