import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String text;
  final int? number;
  final TextEditingController controller;
  const CustomTextField({
    required this.text,
    this.number,
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: TextField(
          controller: controller,
          minLines: number,
          maxLines: null,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.fromLTRB(24, 26, 24, 26),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            focusColor: Colors.black,
            hintText: text,
          ),
        ),
      ),
    );
  }
}
