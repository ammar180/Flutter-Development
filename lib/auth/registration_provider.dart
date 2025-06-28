import 'package:flutter/material.dart';
import './registration_result_model.dart';
import './registration_service.dart';

class RegistrationProvider extends ChangeNotifier {
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController phoneCtrl = TextEditingController();

  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passCtrl = TextEditingController();
  TextEditingController registEmailCtrl = TextEditingController();
  TextEditingController registPassCtrl = TextEditingController();

  RegistrationResultModel? loginResult;
  RegistrationResultModel? signupResult;

  String? fieldValidation(String? txt) =>
      txt == null || txt.isEmpty ? "This field is required" : null;

  Future login() async {
    loginResult = await RegistrationService().login(
      emailCtrl.text,
      passCtrl.text,
    );
  }

  Future register() async {
    signupResult = await RegistrationService().signup(
      nameCtrl.text,
      phoneCtrl.text,
      registEmailCtrl.text,
      registPassCtrl.text,
    );
  }
}
