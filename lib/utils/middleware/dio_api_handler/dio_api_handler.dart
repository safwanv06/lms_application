import 'package:dio/dio.dart';

Dio dio = Dio();

Dio dioApiCall() {
  dio.interceptors.add(InterceptorsWrapper(onRequest:
      (RequestOptions options, RequestInterceptorHandler handler) async {
    return handler.next(options);
  }, onResponse: (Response response, ResponseInterceptorHandler handler) async {
    return handler.next(response);
  }, onError: (DioException exception, ErrorInterceptorHandler handler) {
    return handler.next(exception);
  }));
  return dio;
}
