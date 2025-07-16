import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/routes/app_routes.dart';

class SplashController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> fadeAnimation;

  @override
  void onInit() {
    super.onInit();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    fadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(animationController);
    animationController.forward();
  }

  @override
  void onReady() {
    super.onReady();
    Future.delayed(const Duration(seconds: 2), () {

      // Simulating a delay for splash screen
      Get.offNamed(AppRoutes.login);
    });
  }

  @override
  void onClose() {
    // Dispose the animation controller when the controller is closed
    if (animationController.isAnimating) {
      animationController.stop();
    }
    animationController.dispose();
    super.onClose();
  }
}
