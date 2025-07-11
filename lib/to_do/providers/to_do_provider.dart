import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../core/dio_consumer.dart';
import '../models/task_model.dart';
import '../models/user_model.dart';
import '../services/task_service.dart';

class ToDoProvider extends ChangeNotifier {
  var userService = TaskService(api: DioConsumer(dio: Dio()));
  UserModel? user;
  TaskModel? addedTasks;

  Future<List<TaskModel>> featchUserTasks(id) async {
    user = await userService.getTasks(id);
    user!.userTasks.add(addedTasks!);
    return user!.userTasks;
  }

  handleAddingTask(String taskTitle) async {
    addedTasks = TaskModel(title: taskTitle, status: false);
    await userService.postTask(addedTasks);
    notifyListeners();
  }
}
