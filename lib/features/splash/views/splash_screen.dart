import 'package:bit_mascot_assessment/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/splash_controller.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FadeTransition(
          opacity: controller.fadeAnimation,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              FlutterLogo(size: 100),
              SizedBox(height: 20),
              Text('Bit Mascot', style: AppTextStyles.headline1),
            ],
          ),
        ),
      ),
    );
  }
}
