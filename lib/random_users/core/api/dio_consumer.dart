import 'package:dio/dio.dart';
import 'api_consumer.dart';
import 'dio_interceptor.dart';


class DioConsumer extends ApiConsumer {
  final Dio _dio;
  DioConsumer(this._dio) {
    _dio.options.baseUrl = "https://randomuser.me/api/";
    _dio.interceptors.add(ApiInterceptor());
    _dio.interceptors.add(LogInterceptor(
      request: true,
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
      responseBody: true,
      error: true,
    ));
  }

  @override
  Future get(
    String url, {
    Object? data,
    Map<String, dynamic>? queryParameters,
  }) {
    return _dio.get(
      url,
      data: data,
      queryParameters: queryParameters,
    );
  }
}
