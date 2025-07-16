import 'package:bit_mascot_assessment/core/routes/app_routes.dart';
import 'package:bit_mascot_assessment/features/home/controllers/home_controller.dart';
import 'package:bit_mascot_assessment/features/home/views/home_screen.dart';
import 'package:bit_mascot_assessment/features/login/controllers/login_controller.dart';
import 'package:bit_mascot_assessment/features/login/views/login_screen.dart';
import 'package:bit_mascot_assessment/features/splash/controllers/splash_controller.dart';
import 'package:bit_mascot_assessment/features/splash/views/splash_screen.dart';
import 'package:get/get.dart';

abstract class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.initial,
      page: () => SplashScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut<SplashController>(() => SplashController());
      }),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => HomeScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut<HomeController>(() => HomeController());
      }),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut<LoginController>(() => LoginController());
      }),
    ),
  ];
}
