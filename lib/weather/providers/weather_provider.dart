import 'package:flutter/material.dart';
import '../models/weather_model.dart';
import '../services/weather_service.dart';

class WeatherProvider extends ChangeNotifier {
  TextEditingController cityNameCtrl = TextEditingController();

  WeatherModel? responseResult;

  String? error;

  void getWeather() async {
    try {
      responseResult = await WeatherService().fetchWeather(cityNameCtrl.text);
    } catch (e) {
      error = e.toString();
    }
    notifyListeners();
  }
}
