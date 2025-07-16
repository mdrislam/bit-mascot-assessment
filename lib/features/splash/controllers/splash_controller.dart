import 'package:bit_mascot_assessment/core/routes/app_routes.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    // Initialize any necessary data or services here
    print('SplashController initialized');
  }

  @override
  void onReady() {
    super.onReady();
    // Navigate to the home screen after a delay or condition
    Future.delayed(const Duration(seconds: 2), () {
      Get.offNamed(AppRoutes.home);
    });
  }
}
