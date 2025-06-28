import 'package:flutter/material.dart';

class Field extends StatelessWidget {
  final String label;
  final IconData icon;
  final String? Function(String? text) validatorFunc;
  final TextEditingController controller;

  const Field({
    super.key,
    required this.label,
    required this.icon,
    required this.validatorFunc,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
              label: Text(label),
              icon: Icon(icon),
              border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  borderSide: BorderSide(style: BorderStyle.solid))),
          validator: validatorFunc,
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
