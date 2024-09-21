import 'package:dealse/service/error/services_error.dart';

import 'error.dart';

class ServiceError extends TGError {
  int? status;
  String? message;
//  String? httpError;

  // Error? error;
  //List<Error>? errors;

  // bool? hasError;
  // bool? hasErrors;

  ServiceError({
    this.status,
    this.message,
  });

  @override
  ServiceError fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];

    return ServiceError(status: json["status"], message: json["message"]);
  }

}
