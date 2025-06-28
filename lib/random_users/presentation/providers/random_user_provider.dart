import 'package:flutter/material.dart';

import '../../models/user.dart';
import '../../services/random_user_service.dart';

class RandomUserProvider extends ChangeNotifier {
  final RandomUserService _appService = RandomUserService();

  Future<List<User>> getUsers(int count) async {
    return await _appService.fetchUsers(count);
  }
}
