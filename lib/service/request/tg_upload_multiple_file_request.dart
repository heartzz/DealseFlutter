import 'package:dealse/service/request/tg_request.dart';
import 'package:http/http.dart';

abstract class TGUploadMultipleFilesRequest extends TGRequest {
  List<MultipartFile> files();
  String body();
}