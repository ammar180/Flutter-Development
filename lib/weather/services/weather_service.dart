import 'package:dio/dio.dart';
import '../models/weather_model.dart';

class WeatherService {
  final Dio _dio =
      Dio(BaseOptions(baseUrl: "https://api.weatherapi.com/v1/current.json"));
  WeatherService() {
    _dio.interceptors.add(LogInterceptor(request: true, responseBody: true));
  }
  Future<WeatherModel> fetchWeather(String cityName) async {
    try {
      var result = await _dio.get(
        "",
        queryParameters: {
          "q": cityName,
          "key": "805d8e4621234f858ee72953251903",
        },
      );
      if (result.statusCode == 200) {
        return WeatherModel.fromJson(result.data);
      } else {
        throw Exception("Can't fetch");
      }
    } catch (e) {
      throw Exception("error: Can't fetch weahter");
    }
  }
}
