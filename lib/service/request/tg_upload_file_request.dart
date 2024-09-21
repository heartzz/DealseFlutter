import 'package:dealse/service/request/tg_request.dart';
import 'package:http/http.dart';

abstract class TGUploadFileRequest extends TGRequest {
  MultipartFile file();

  Map<String, String> body();
}
