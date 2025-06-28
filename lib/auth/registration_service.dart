import 'package:dio/dio.dart';
import './registration_result_model.dart';

class RegistrationService {
  final Dio _dio =
      Dio(BaseOptions(baseUrl: "https://elsewedyteam.runasp.net/api"));
  RegistrationService() {
    _dio.interceptors.add(LogInterceptor(request: true, responseBody: true));
  }
  Future<RegistrationResultModel> login(
    String email,
    String password,
  ) async {
    try {
      var result = await _dio.post(
        "/Login/CheckUser",
        data: {
          'Email': email,
          'password': password,
        },
      );
      if (result.statusCode == 200) {
        return RegistrationResultModel.fromJson(result.data);
      } else {
        throw Exception("Can't Login");
      }
    } catch (e) {
      return RegistrationResultModel(status: false, message: e.toString());
    }
  }

  Future<RegistrationResultModel> signup(
    String name,
    String phone,
    String email,
    String password,
  ) async {
    try {
      var result = await _dio.post(
        "/Register/AddUser",
        data: {
          "Name": name,
          "Phone": phone,
          "Email": email,
          "password": password,
        },
      );
      if (result.statusCode == 200) {
        return RegistrationResultModel.fromJson(result.data);
      } else {
        throw Exception("Can't signup");
      }
    } catch (e) {
      return RegistrationResultModel(status: false, message: e.toString());
    }
  }
}
