import 'package:dio/dio.dart';

import '../core/api/dio_consumer.dart';
import '../core/api/api_consumer.dart';
import '../models/user.dart';


class RandomUserService {
  final ApiConsumer _apiConsumer = DioConsumer(Dio());

  Future<List<User>> fetchUsers(int count) async {
    var responce = await _apiConsumer.get(
      '',
      queryParameters: {'results': count},
    );
    List<User> users = [];
    for (var user in responce.data['results']) {
      users.add(User.fromJson(user));
    }
    return users;
  }
}
