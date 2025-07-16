import 'package:bit_mascot_assessment/core/constants/app_strings.dart';
import 'package:bit_mascot_assessment/core/routes/app_routes.dart';
import 'package:bit_mascot_assessment/core/theme/app_colors.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'core/routes/app_pages.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppStrings.appName,
      theme: ThemeData(
        primarySwatch: AppColors.primarySwatch,
        scaffoldBackgroundColor: AppColors.background,
      ),
      initialRoute: AppRoutes.initial,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
