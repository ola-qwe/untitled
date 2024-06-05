
import 'package:untitled/core/ui/end_point.dart';
import 'package:dio/dio.dart';

abstract class NetworkModule {
  /// A singleton dio provider.
  ///
  /// Calling it multiple times will return the same instance.
  static Dio provideDio() {
    final dio = Dio();
    String host = '<calculated when request is sent>';
    dio
      ..options.baseUrl = EndPoint.url
      ..options.connectTimeout = EndPoint.connectTimeout
      ..options.receiveTimeout = EndPoint.receiveTimeout
      ..options.sendTimeout = EndPoint.receiveTimeout
      ..options.headers = {
        'Content-Type': 'application/json; charset=utf-8',
         'Accept': 'application/json',
      //  'Host': host,
        'X-Requested-With': 'XMLHttpRequest',
      }
      ..interceptors.add(LogInterceptor(
        request: true,
        responseBody: true,
        requestBody: true,
        requestHeader: true,
        error: true,
      ))
      ..interceptors.add(
        InterceptorsWrapper(
          onRequest: (RequestOptions options,
              RequestInterceptorHandler handler) async {
            return handler.next(options);
          },
        ),
      );

    return dio;
  }
}
