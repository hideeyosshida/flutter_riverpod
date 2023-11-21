import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_responsive/services/api/api_url.dart';
import 'package:flutter_responsive/services/api/dio_provider.dart';
// import 'package:http/http.dart';

class APIDataStore {
  Dio dio = DioProvider.instance();

  Future<dynamic> requestAPI(
    ApiURL apiURL, {
    Map<String, dynamic>? params,
    dynamic body,
    FormData? formData,
    String? customURL,
    Options? options,
  }) async {
    dynamic bodyRequest = '{}';
    if (body != null) {
      bodyRequest = jsonEncode(body);
    }
    if (formData != null) {
      bodyRequest = formData;
    }

    try {
      Response? response;
      switch (apiURL.method) {
        case HTTPRequestMethods.get:
          response = await dio.get(customURL ?? apiURL.path,
              options: options, queryParameters: params);
          break;
        case HTTPRequestMethods.post:
          Options? option;
          if (bodyRequest != null && bodyRequest is String) {
            option = Options(headers: {
              Headers.contentEncodingHeader: ContentType.json.value
            });
          }
          if (bodyRequest is FormData) {
            option = Options(
                headers: {Headers.acceptHeader: ContentType.json.value});
          }
          response = await dio.post(customURL ?? apiURL.path,
              queryParameters: params, options: option);
          break;
        default:
          break;
      }
      // log('========== Response request:\n $response \n==========');
      return response;
    } on DioException catch (e) {
      log('========== Have an error:\n ${e.response?.data}\n ${e.response?.statusCode}\n ${e.message} \n==========');
    }
  }
}
