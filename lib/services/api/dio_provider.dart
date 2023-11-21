import 'dart:developer';

import 'package:dio/dio.dart';

class DioProvider {
  static Dio instance() {
    final dio = Dio()
      ..options.baseUrl = ''
      ..options.connectTimeout = const Duration(seconds: 300000)
      ..options.receiveTimeout = const Duration(seconds: 300000)
      ..interceptors.add(HttpLogInterceptor());
    return dio;
  }
}

class HttpLogInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // log('REQUEST: ${options.uri}\n'
    //     'data=${options.data}\n'
    //     'method=${options.method}\n'
    //     'headers=${options.headers}\n'
    //     'queryParameters=${options.queryParameters}');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // log('RESPONSE: ${response.realUri}\n Body: ${response.data}');
    super.onResponse(response, handler);
  }
}
