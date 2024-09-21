import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';
import 'dart:convert' show utf8, base64;

class TGHttpClient extends http.BaseClient {
  final Map<String, String> headers;
  static http.Client _client = http.Client();
  static bool badCertificateCallbackEnabled = false;
  static var certs = "";

  TGHttpClient({this.headers = const {}}) {
    if (badCertificateCallbackEnabled && !kIsWeb) {
      HttpClient webHttpClient = HttpClient();
      webHttpClient.badCertificateCallback = ((X509Certificate cert, String host, int port) => true);
      _client = IOClient(webHttpClient);
    }
  }
  static void setCerts(String Certs) {
    if (!kIsWeb) {
      try {
        final SecurityContext context = SecurityContext(withTrustedRoots: true);
        context.setTrustedCertificatesBytes(Certs.codeUnits);
        HttpClient webHttpClient = HttpClient(context: context);
        final client = IOClient(webHttpClient);
        _client = client;
      } catch (e) {
        SystemNavigator.pop();
        exit(0);
      }
    }
  }

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    request.headers.addAll(headers);
    return _client.send(request);
  }
}
