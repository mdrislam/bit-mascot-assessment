import 'package:bit_mascot_assessment/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum SnackbarType { info, success, warning, error }

class SnackbarUtil {
  static void show(
    String message, {
    String? title,
    SnackbarType type = SnackbarType.info,
    Duration duration = const Duration(seconds: 3),
  }) {
    Color bgColor;
    IconData icon;
    String effectiveTitle = title ?? type.name.capitalizeFirst ?? '';

    switch (type) {
      case SnackbarType.success:
        bgColor = AppColors.success;
        icon = Icons.check_circle_outline;
        break;
      case SnackbarType.error:
        bgColor = AppColors.error;
        icon = Icons.error_outline;
        break;
      case SnackbarType.warning:
        bgColor = AppColors.warning;
        icon = Icons.warning_amber_outlined;
        break;
      case SnackbarType.info:
        bgColor = AppColors.info;
        icon = Icons.info_outline;
        break;
    }

    Get.snackbar(
      effectiveTitle,
      message,
      backgroundColor: bgColor,
      colorText: AppColors.textWhite,
      icon: Icon(icon, color: AppColors.textWhite),
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      duration: duration,
      borderRadius: 12,
      padding: const EdgeInsets.all(16),
    );
  }
}
