import 'package:dealse/service/request/tg_request.dart';

abstract class TGGetRequest extends TGRequest {
  Map<String, dynamic> params();
}
