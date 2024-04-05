import 'package:flutter/material.dart';

class CustomeTextField extends StatelessWidget {
  final controller;
  final fieldLable;
  final validationErrorMessage;
  final bool obsecureText;
  final icon;
  const CustomeTextField(
      {super.key,
      required this.controller,
      required this.fieldLable,
      required this.obsecureText,
      required this.icon,
      required this.validationErrorMessage});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          suffixIcon: Icon(icon),
          labelText: fieldLable,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12))),
      validator: (value) => value!.isEmpty ? validationErrorMessage : null,
    );
  }
}
