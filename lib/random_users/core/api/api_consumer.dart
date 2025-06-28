abstract class ApiConsumer {
  Future<dynamic> get(
    String url, {
    Object? data,
    Map<String, dynamic>? queryParameters,
  });
}
