import 'dart:convert';
import 'dart:html';

import 'package:dealse/service/request/tg_delete_request.dart';
import 'package:dealse/service/request/tg_get_request.dart';
import 'package:dealse/service/request/tg_post_request.dart';
import 'package:dealse/service/request/tg_put_request.dart';
import 'package:dealse/service/request/tg_request.dart';
import 'package:dealse/service/request/tg_upload_file_request.dart';
import 'package:dealse/service/request/tg_upload_multiple_file_request.dart';
import 'package:dealse/service/request/tg_upload_request.dart';
import 'package:dealse/service/response/tg_response.dart';
import 'package:dealse/utils/flavor.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import 'client/client_factory.dart';
import 'common/tg_log.dart';
import 'error/services_error.dart';
import 'mock/mock_service.dart';

typedef T CreatorT<T>();
typedef E CreatorE<E>();

class TGService<T extends TGResponse, E extends TGError> {
  CreatorT<T> creatorT;
  CreatorE<E> creatorE;

  TGService(this.creatorT, this.creatorE);

  Client _getClient(String url, String method) => TGClientFactory.getClient(url, method);

  static init(
      {required String baseUrl,
      Map<String, String>? headers,
      bool badCertificateCallbackEnabled = false}) {
    // For HTTP Request
    TGRequest.defaultBaseUrl = baseUrl;
    TGRequest.defaultHeaders = headers;

/*    // For Mock
    TGMockService.applyMock = applyMock;
    if (mockMappingsFile != null && applyMock) TGMockService.loadMockMappings(mockMappingsFile);*/
  }

  T _populateExceptionResponse(error) {
    T t = creatorT();
    t.timestamp = DateTime.now().millisecondsSinceEpoch;
    t.httpStatus = 0;
    t.contentLength = 0;
    t.error = error.message;
    t.body = error.message;
    t.hasError = true;
    return t;
  }

  Future<T> getSync({required TGGetRequest request}) async {
    try {
      Uri uri = Uri.parse(request.getUrl());
      TGLog.t("GET", uri);
      final httpRes = await _getClient(request.getUri(), "GET").get(uri, headers: request.headers());
      return Future.value(_prepareResponse(httpRes));
    } catch (error) {
      T t = _populateExceptionResponse(error);
      return t;
    }
  }

  Future<T> post({required TGPostRequest request, onSuccess(T)?, onError(T)?}) async {
    try {
      Uri uri = Uri.parse(request.getUrl());
      TGLog.t("POST", uri);
      TGLog.d("Post URL---------${request.getUrl()}");
      TGLog.d("Request ${request.getUri()}\n${request.headers()}\n${request.body()}\n");
      final httpRes = await _getClient(request.getUri(), "POST").post(
        uri,
        body: request.body(),
        headers: request.headers(),
      );
      TGLog.d("HTTP Call $httpRes");
      return _performCallback(httpRes, onError, onSuccess);
    } catch (error) {
      T t = _populateExceptionResponse(error);
      onError!(t);
      return t;
    }
  }

  Future<T> get({required TGGetRequest request, onSuccess(T)?, onError(T)?}) async {
    try {
      Uri uri = Uri.parse(request.getUrl());
      TGLog.t("GET", uri);
      TGLog.d("Get URL---------${request.getUrl()}");
      final httpRes = await _getClient(request.getUri(), "GET").get(uri, headers: request.headers());
      return _performCallback(httpRes, onError, onSuccess);
    } catch (error) {
      T t = _populateExceptionResponse(error);
      onError!(t);
      return t;
    }
  }

  Future<T> postSync({required TGPostRequest request}) async {
    Uri uri = Uri.parse(request.getUrl());
    TGLog.t("POST", uri);
    final httpRes = await _getClient(request.getUri(), "POST").post(
      uri,
      body: request.body(),
      headers: request.headers(),
    );
    return Future.value(_prepareResponse(httpRes));
  }

  Future<T> put({required TGPutRequest request, onSuccess(T)?, onError(T)?}) async {
    try {
      Uri uri = Uri.parse(request.getUrl());
      TGLog.t("PUT", uri);
      final httpRes = await _getClient(request.getUri(), "PUT").put(
        uri,
        body: request.body(),
        headers: request.headers(),
      );
      return _performCallback(httpRes, onError, onSuccess);
    } catch (error) {
      T t = _populateExceptionResponse(error);
      onError!(t);
      return t;
    }
  }

  Future<T> delete({required TGDeleteRequest request, onSuccess(T)?, onError(T)?}) async {
    try {
      Uri uri = Uri.parse(request.getUrl());
      TGLog.t("DELETE", uri);
      final httpRes = await _getClient(request.getUri(), "DELETE").delete(
        uri,
        body: request.body(),
        headers: request.headers(),
      );
      return _performCallback(httpRes, onError, onSuccess);
    } catch (error) {
      T t = _populateExceptionResponse(error);
      onError!(t);
      return t;
    }
  }

  Future<T> upload({required TGUploadRequest request, onSuccess(T)?, onError(T)?}) async {
    var multipartRequest =
        http.MultipartRequest("POST", Uri.parse(TGRequest.prepareUrl(TGRequest.defaultBaseUrl, request.getUri())));
    multipartRequest.files.add(request.file());
    StreamedResponse httpRes = await multipartRequest.send();
    return _performCallbackForStreamedResponse(httpRes, onError, onSuccess);
  }

  Future<T> uploadFile({required TGUploadFileRequest request, onSuccess(T)?, onError(E)?}) async {
    var multipartRequest =
        http.MultipartRequest("POST", Uri.parse(TGRequest.prepareUrl(TGRequest.defaultBaseUrl, request.getUri())));
    multipartRequest.headers.addAll(request.headers()!);
    multipartRequest.fields.addAll(request.body());
    multipartRequest.files.add(request.file());
    StreamedResponse httpRes = await multipartRequest.send();
    return _performCallbackForUploadFileResponse(httpRes, onError, onSuccess);
  }

  Future<T> uploadAllFiles({required TGUploadMultipleFilesRequest request, onSuccess(T)?, onError(T)?}) async {
    Uri uri = Uri.parse(request.getUrl());
    TGLog.t("POST", uri);
    TGLog.d("Request ${request.getUri()}\n${request.headers()}\n${request.body()}\n");
    var multipartReq = http.MultipartRequest("POST", uri);
    var headers = request.headers()!;
    headers['Content-Type'] = 'multipart/form-data';
    multipartReq.headers.addAll(headers);
    multipartReq.files.addAll(request.files());
    //final httpRes = await multipartReq.send();
    final httpRes = await _getClient(request.getUri(), "SEND").send(multipartReq);

    final res = await http.Response.fromStream(httpRes);
    return _performCallback(res, onError, onSuccess);
  }

  Future<T> addStoreWithStringList({
    required String authToken,
    required int areaId,
    required int storeTypeId,
    required String name,
    required String email,
    required String address,
    required double latitude,
    required double longitude,
    required String ownerName,
    required String ownerMobileNo,
    required List<String> mobileNumbers,  // List of strings (e.g., multiple mobile numbers)
    required String deviceID,
    required http.MultipartFile logo,
    onSuccess(T)?, onError(T)?// The logo file
  }) async {
      var uri = Uri.parse("https://your-api-url.com/api/v1/Store/AddStoreForStoreApp");

      var request = http.MultipartRequest('POST', uri);

      // Add headers (authorization)
      request.headers['Authorization'] = 'Bearer $authToken';

      // Add fields (form data)
      request.fields['AreaId'] = areaId.toString();
      request.fields['StoreTypeId'] = storeTypeId.toString();
      request.fields['Name'] = name;
      request.fields['Email'] = email;
      request.fields['Address'] = address;
      request.fields['Latitude'] = latitude.toString();
      request.fields['Longitude'] = longitude.toString();
      request.fields['OwnerName'] = ownerName;
      request.fields['OwnerMobileNo'] = ownerMobileNo;
      request.fields['DeviceID'] = deviceID;

      // Add the list of strings (e.g., mobile numbers) to the multipart request
      for (int i = 0; i < mobileNumbers.length; i++) {
        request.fields['MobileNumbers[$i]'] = mobileNumbers[i];  // Add each item from the list
      }


      request.files.add(logo);

      // Send the request
      var response = await request.send();

      final res = await http.Response.fromStream(response);
      return _performCallback(res, onError, onSuccess);// Get the response and decode it if necessary

  }




  Future<T> uploadFileSync({required TGUploadFileRequest request}) async {
    var multipartRequest =
        http.MultipartRequest("POST", Uri.parse(TGRequest.prepareUrl(TGRequest.defaultBaseUrl, request.getUri())));
    multipartRequest.headers.addAll(request.headers()!);
    multipartRequest.fields.addAll(request.body());
    multipartRequest.files.add(request.file());
    StreamedResponse httpRes = await multipartRequest.send();
    return Future.value(_performCallbackForUploadFileSyncResponse(httpRes));
  }

  Future<T> _performCallback(Response httpRes, onError(dynamic T)?, onSuccess(dynamic T)?) async {
    T t = await _prepareResponse(httpRes);
    t.hasError ? onError!(t) : onSuccess!(t);
    return t;
  }

  Future<T> _performCallbackForStreamedResponse(
      StreamedResponse httpRes, onError(dynamic T)?, onSuccess(dynamic T)?) async {
    T t = creatorT();
    try {
      _populateResponse(t, httpRes);
      t.body = httpRes.toString();
      await _validateResponse(t);
    } catch (e) {
      TGLog.e(e);
      // Ignores error if not able to populate response, validate response or decode json. Populated response must be returned.
    }
    t.hasError ? onError!(t) : onSuccess!(t);
    return t;
  }

  Future<T> _performCallbackForUploadFileResponse(
      StreamedResponse httpRes, onError(dynamic E)?, onSuccess(dynamic T)?) async {
    T t = creatorT();
    try {
      _populateResponse(t, httpRes);
      await httpRes.stream.transform(utf8.decoder).listen((value) {
        t.body = value;
      });
      await _validateResponse(t);
    } catch (e) {
      TGLog.e(e);
      // Ignores error if not able to populate response, validate response or decode json. Populated response must be returned.
    }
    if (t.hasError) {
      E e = creatorE();
      final timestamp = new DateTime.now().millisecondsSinceEpoch;
      final errorResponse = {"httpStatus": httpRes.statusCode, "timestamp": timestamp, "message": t.body!};
      onError!(e.fromJson(errorResponse));
    } else {
      onSuccess!(t);
    }
    return t;
  }

  Future<T> _performCallbackForUploadFileSyncResponse(StreamedResponse httpRes) async {
    T t = creatorT();
    try {
      _populateResponse(t, httpRes);
      await httpRes.stream.transform(utf8.decoder).listen((value) {
        t.body = value;
      });
      await _validateResponse(t);
    } catch (e) {
      TGLog.e(e);
      // Ignores error if not able to populate response, validate response or decode json. Populated response must be returned.
    }
    return t;
  }

  Future<T> _prepareResponse(Response httpRes) async {
    T t = creatorT();
    try {
      _populateResponse(t, httpRes);
      t.body = httpRes.body;
      await _validateResponse(t);
    } catch (e) {
      TGLog.e(e);
      // Ignores error if not able to populate response, validate response or decode json. Populated response must be returned.
    }
    return t;
  }

  void _populateResponse(t, http.BaseResponse httpRes) {
    t.timestamp = DateTime.now().millisecondsSinceEpoch;
    t.httpStatus = httpRes.statusCode;
    t.contentLength = httpRes.contentLength;
    t.headers = httpRes.headers;
  }

  Future<void> _validateResponse(T t) async {
    t.validate(); // Populates hasError based on HTTP Status Code
    if (t.body != null && t.body!.isNotEmpty) {
      try {
        if (t.hasError) {
          t.error = creatorE().fromJson(jsonDecode(t.body!));
        } else {
            dynamic responseJson = json.decode(t.body!);
            TGLog.d("DecryuploadAllFilespted Response: $responseJson");
            print(responseJson);
            t.fromJson(responseJson);

        }
      } catch (e) {
        TGLog.e("Unable to prepare - ${t.hasError ? E.toString() : T.toString()}");
        TGLog.e("Please check 'fromJson(dynamic json)' implementation of - ${t.hasError ? E.toString() : T.toString()}");
        TGLog.e(e);
        t.hasError = true;
        print(t.body);
      }
    } else {
      TGLog.e("Unable to prepare - " + (t.hasError ? E.toString() : T.toString()));
      TGLog.e("Please check implementation of - " + (t.hasError ? E.toString() : T.toString()));
    }
  }
}
