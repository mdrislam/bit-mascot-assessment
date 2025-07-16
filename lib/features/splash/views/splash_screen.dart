import 'package:bit_mascot_assessment/core/constants/app_strings.dart';
import 'package:bit_mascot_assessment/core/theme/app_sizes.dart';
import 'package:bit_mascot_assessment/core/theme/app_text_styles.dart';
import 'package:bit_mascot_assessment/core/utils/app_responsive_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/splash_controller.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppResponsiveInfo.of(context);
    return Scaffold(
      body: Center(
        child: FadeTransition(
          opacity: controller.fadeAnimation,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlutterLogo(size: AppResponsiveInfo.icon(AppSizes.logoIcon)),
              SizedBox(height: AppResponsiveInfo.spacingSmall),
              Text(AppStrings.appName, style: AppTextStyles.headline1),
            ],
          ),
        ),
      ),
    );
  }
}
