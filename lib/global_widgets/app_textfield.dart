import 'package:flutter/material.dart';

class AppTextfield extends StatelessWidget {
  final TextEditingController? controller;
  final String label, hintText;
  final bool obscureText;
  final FormFieldValidator<String>? validator;
  final TextInputType keyboardType;
  const AppTextfield({
    super.key,
    this.controller,
    required this.label,
    required this.hintText,
    this.obscureText = false,
    this.validator,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        hintText: hintText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      validator: validator,
      style: TextStyle(fontSize: 16, color: Colors.black87),
    );
  }
}
