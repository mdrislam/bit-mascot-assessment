import 'package:bit_mascot_assessment/core/theme/app_colors.dart';
import 'package:bit_mascot_assessment/core/theme/app_sizes.dart';
import 'package:bit_mascot_assessment/core/theme/app_text_styles.dart';
import 'package:bit_mascot_assessment/core/utils/app_responsive_info.dart';
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
        border: OutlineInputBorder(
          borderRadius: AppResponsiveInfo.borderRadiusAll(
            AppSizes.paddingSmall,
          ),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      validator: validator,
      style: AppTextStyles.body.copyWith(color: AppColors.textPrimary),
    );
  }
}
