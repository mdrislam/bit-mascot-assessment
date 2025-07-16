import 'package:bit_mascot_assessment/core/constants/app_strings.dart';
import 'package:bit_mascot_assessment/core/theme/app_colors.dart';
import 'package:bit_mascot_assessment/core/theme/app_sizes.dart';
import 'package:bit_mascot_assessment/core/theme/app_text_styles.dart';
import 'package:bit_mascot_assessment/core/utils/app_responsive_info.dart';
import 'package:bit_mascot_assessment/core/utils/app_validators.dart';
import 'package:bit_mascot_assessment/features/login/controllers/login_controller.dart';
import 'package:bit_mascot_assessment/global_widgets/app_submit_button.dart'
    show AppSubmitButton;
import 'package:bit_mascot_assessment/global_widgets/app_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppResponsiveInfo.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Stack(
          children: [
            // Bottom Gradient Background
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: AppResponsiveInfo.h(AppSizes.homeGradientHeight),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.white, Color(0xFFC0EAF0)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ),

            // Main Login Content
            Form(
              key: controller.formKey,
              child: ListView(
                padding: AppResponsiveInfo.paddingAll(AppSizes.paddingLarge),
                physics: const BouncingScrollPhysics(),
                children: [
                  SizedBox(height: AppResponsiveInfo.spacingMedium),

                  // App Logo
                  Icon(
                    Icons.ac_unit,
                    size: AppResponsiveInfo.icon(AppSizes.iconLarge),
                    color: AppColors.primary,
                  ),

                  SizedBox(height: AppResponsiveInfo.spacingMedium),

                  Text(
                    AppStrings.loginTitle,
                    style: AppTextStyles.headline2,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: AppResponsiveInfo.spacingSmall),
                  Text(
                    AppStrings.loginDescription,
                    style: AppTextStyles.bodySmall,
                    textAlign: TextAlign.center,
                  ),

                  SizedBox(height: AppResponsiveInfo.spacingLarge),

                  // Email Field (uses custom AppTextField)
                  AppTextfield(
                    label: AppStrings.emailLabel,
                    hintText: AppStrings.emailHints,
                    controller: controller.emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) => AppValidators.validateEmail(value),
                  ),

                  SizedBox(height: AppResponsiveInfo.spacingMedium),

                  // Password Field (uses custom AppTextField)
                  AppTextfield(
                    label: AppStrings.passwordLabel,
                    obscureText: true,
                    controller: controller.passwordController,
                    hintText: AppStrings.passwordHints,
                    validator: (value) => AppValidators.validatePassword(value),
                  ),

                  SizedBox(height: AppResponsiveInfo.spacingLarge),

                  // Login Button
                  Obx(
                    () => AppSubmitButton(
                      onPressed: controller.login,
                      text: AppStrings.login,
                      isLoading: controller.isLoading.value,
                    ),
                  ),

                  SizedBox(height: AppResponsiveInfo.spacingMedium),

                  // Forgot Password Link
                  TextButton(
                    onPressed: controller.forgotPassword,
                    child: Text(
                      AppStrings.forgotpassword,
                      style: AppTextStyles.body.copyWith(
                        color: AppColors.primary,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
