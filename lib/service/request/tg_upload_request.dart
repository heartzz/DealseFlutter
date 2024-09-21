import 'package:http/http.dart';
import 'package:dealse/service/request/tg_request.dart';

abstract class TGUploadRequest extends TGRequest {
  MultipartFile file();
}
