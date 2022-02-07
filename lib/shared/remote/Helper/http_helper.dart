import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HttpHelper {
  String noInternetMessage = 'لا يوجد إتصال بالإنترنت';
  String connectionTimeOutMessage = 'خطأ فى الإتصال بالخادم';
  String sendingTimeOutMessage = 'خطأ فى الإتصال بالخادم';
  String notSuccessResponse = 'خطأ فى الإتصال بالخادم';
  String recivingTimeOutMessage = 'خطأ فى الإتصال بالخادم';
  String authorizationMessage = 'غير مسموح الإتصال بالخادم';

  Dio _getDio() {
    Dio dio = new Dio()..options.baseUrl = 'https://ufaspro.com/nejmafas/api/';
    return dio;
  }

  Future<Response> postJsonData(
      {@required String url,
      @required Map<String, dynamic> data,
      String token}) async {
    var response = await _getDio()
        .post(url, data: data, options: _getRequestOptions(token))
        .catchError((e) {
      mapErrorResponse(e);
    });

    return response;
  }

  Future<Response> putJsonData(
      {@required String url,
      @required Map<String, dynamic> data,
      String token}) async {
    var response = await _getDio()
        .put(url, data: data, options: _getRequestOptions(token))
        .catchError((e) {
      mapErrorResponse(e);
    });
    return response;
  }

  Future<Response> deleteData({@required String url, String token}) async {
    var response = await _getDio()
        .delete(url, options: _getRequestOptions(token))
        .catchError((e) {
      mapErrorResponse(e);
    });
    return response;
  }

  /*
  Future<Response> postFile(
      {@required String url, @required File file, token}) async {
    FormData formData = new FormData.from(
        {"file": new UploadFileInfo(file, path.basename(file.path))});
    var response = await _getDio()
        .post(
      url,
      data: formData,
      options: Options(headers: {"Authorization": "Bearer " + token}),
    )
        .catchError((e) => mapErrorResponse(e));
    return response;
  }
*/
  Future<Response> getJsonData(
      {@required String url, String token, Map<String, dynamic> params}) async {
    var response = await _getDio()
        .get(
      url,
      queryParameters: params,
      options: _getRequestOptions(token),
    )
        .catchError((e) {
      mapErrorResponse(e);
    });
    return response;
  }

  Future<dynamic> getResponse(
      {@required String url, String token, Map<String, dynamic> params}) async {
    var response = await _getDio()
        .get(
      url,
      queryParameters: params,
      options: _getRequestOptions(token),
    )
        .catchError((e) {
      mapErrorResponse(e);
    });
    return response;
  }

  Options _getRequestOptions(token) {
    var headers = {
      "content-type": "application/json",
      "accept": "application/json",
    };
    if (token != null) headers["Authorization"] = "Bearer " + token;
    var options = Options(
      headers: headers,
      // connectTimeout: 90000,
      receiveTimeout: 90000,
      sendTimeout: 90000,
      validateStatus: (s) => true,
      receiveDataWhenStatusError: false,
    );
    return options;
  }

  void mapErrorResponse(dynamic e) {
    if (e is DioError) {
      DioError error = e;
      if (error.type == DioErrorType.DEFAULT && error.error is SocketException)
        throw HttpException(noInternetMessage);
      else if (error.type == DioErrorType.CONNECT_TIMEOUT)
        throw HttpException(connectionTimeOutMessage);
      else if (error.type == DioErrorType.RECEIVE_TIMEOUT)
        throw HttpException(
          recivingTimeOutMessage,
        );
      else if (error.type == DioErrorType.SEND_TIMEOUT)
        throw HttpException(
          sendingTimeOutMessage,
        );
      else if (error.type == DioErrorType.RESPONSE)
        throw HttpException(
          notSuccessResponse,
        );
      else if (error.type != DioErrorType.CANCEL)
        throw HttpException(
          error.message,
        );
    } else
      throw HttpException(e.toString());
  }
}
