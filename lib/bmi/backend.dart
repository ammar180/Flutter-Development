import 'dart:math';

import 'package:flutter/material.dart';

class CalculateResult {
  String status = "";
  Color statusColor = Colors.green;
  String captions = "";
  double bmi = 22.3;
  CalculateResult(bool isMale, int height, int weight, int age) {
    bmi = weight / pow(height / 100, 2);
    if (bmi < 18.5) {
      status = "Underweight";
      statusColor = Colors.red;
      captions = "You have to add weight";
    } else if (18.5 <= bmi && bmi < 24.9) {
      status = "Normal weight";
      statusColor = Colors.green;
      captions = "You have a normal body weight.\n Good job!";
    } else if (25 <= bmi && bmi < 29.9) {
      status = "Overweight";
      statusColor = Colors.yellow;
      captions = "You have to loss some weight.";
    } else if (bmi >= 30) {
      status = "Obesity";
      statusColor = Colors.red;
      captions = "Obesity, You have to visite doctor now!.";
    }
  }
}
