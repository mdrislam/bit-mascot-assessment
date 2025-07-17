import 'package:bit_mascot_assessment/core/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  final isLoading = false.obs;

  login() {
    emailFocusNode.unfocus();
    passwordFocusNode.unfocus();
    if (formKey.currentState!.validate()) {
      isLoading.value = true;
      // Simulate login process
      Future.delayed(Duration(seconds: 2), () {
        isLoading.value = false;
        Get.offAllNamed(AppRoutes.home);
      });
    }
  }

  void forgotPassword() {
    // Navigate or show dialog
  }
  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();

    super.onClose();
  }
}
