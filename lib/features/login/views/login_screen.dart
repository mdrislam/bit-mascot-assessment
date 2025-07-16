import 'package:bit_mascot_assessment/core/constants/app_strings.dart';
import 'package:bit_mascot_assessment/core/theme/app_colors.dart';
import 'package:bit_mascot_assessment/core/theme/app_text_styles.dart';
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
                height: 120,
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
                padding: const EdgeInsets.all(20),
                physics: const BouncingScrollPhysics(),
                children: [
                  const SizedBox(height: 30),

                  // App Logo
                  Icon(Icons.ac_unit, size: 60, color: AppColors.primary),

                  const SizedBox(height: 20),

                  const Text(
                    AppStrings.loginTitle,
                    style: AppTextStyles.headline2,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    AppStrings.loginDescription,
                    style: AppTextStyles.bodySmall,
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 40),

                  // Email Field (uses custom AppTextField)
                  AppTextfield(
                    label: AppStrings.emailLabel,
                    hintText: AppStrings.emailHints,
                    controller: controller.emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) => AppValidators.validateEmail(value),
                  ),

                  const SizedBox(height: 20),

                  // Password Field (uses custom AppTextField)
                  AppTextfield(
                    label: AppStrings.passwordLabel,
                    obscureText: true,
                    controller: controller.passwordController,
                    hintText: AppStrings.passwordHints,
                    validator: (value) => AppValidators.validatePassword(value),
                  ),

                  const SizedBox(height: 30),

                  // Login Button
                  Obx(
                    () => AppSubmitButton(
                      onPressed: controller.login,
                      text: AppStrings.login,
                      isLoading: controller.isLoading.value,
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Forgot Password Link
                  TextButton(
                    onPressed: controller.forgotPassword,
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(color: Colors.blue),
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
