import 'package:bit_mascot_assessment/core/theme/app_colors.dart';
import 'package:bit_mascot_assessment/core/theme/app_sizes.dart';
import 'package:bit_mascot_assessment/core/theme/app_text_styles.dart';
import 'package:bit_mascot_assessment/core/utils/app_responsive_info.dart';
import 'package:flutter/material.dart';

class AppSubmitButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;

  const AppSubmitButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        minimumSize: Size(
          double.infinity,
          AppResponsiveInfo.h(AppSizes.buttonHeight),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: AppResponsiveInfo.borderRadiusAll(
            AppSizes.paddingSmall,
          ),
        ),
      ),
      child: isLoading
          ? CircularProgressIndicator(color: Colors.white)
          : Text(text, style: AppTextStyles.button),
    );
  }
}
