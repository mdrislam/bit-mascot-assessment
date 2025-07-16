import 'package:bit_mascot_assessment/core/theme/app_colors.dart';
import 'package:bit_mascot_assessment/core/theme/app_sizes.dart';
import 'package:bit_mascot_assessment/core/utils/app_responsive_info.dart';
import 'package:flutter/material.dart';

class AppTextStyles {
  // Headlines
  static TextStyle get headline1 => TextStyle(
    fontSize: AppResponsiveInfo.sp(AppSizes.textExtraExtraLarge),
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  static TextStyle get headline2 => TextStyle(
    fontSize: AppResponsiveInfo.sp(AppSizes.textExtraLarge),
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  // Body Texts
  static TextStyle get bodyLarge => TextStyle(
    fontSize: AppResponsiveInfo.sp(AppSizes.textLarge),
    color: AppColors.textPrimary,
  );

  static TextStyle get body => TextStyle(
    fontSize: AppResponsiveInfo.sp(AppSizes.textMedium),
    color: AppColors.textSecondary,
  );

  static TextStyle get bodySmall => TextStyle(
    fontSize: AppResponsiveInfo.sp(AppSizes.textSmall),
    color: AppColors.textSecondary,
  );

  // Form Labels & Hints
  static TextStyle get formLabel => TextStyle(
    fontSize: AppResponsiveInfo.sp(AppSizes.textSmall),
    color: AppColors.textPrimary,
    fontWeight: FontWeight.w500,
  );

  static TextStyle get formHint => TextStyle(
    fontSize: AppResponsiveInfo.sp(AppSizes.textSmall),
    color: AppColors.textHint,
  );

  // Buttons
  static TextStyle get button => TextStyle(
    fontSize: AppResponsiveInfo.sp(AppSizes.textMedium),
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
}
