import 'package:bit_mascot_assessment/core/constants/app_strings.dart';
import 'package:bit_mascot_assessment/core/theme/app_text_styles.dart';
import 'package:bit_mascot_assessment/core/utils/app_responsive_info.dart';
import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key, required this.opacity});
  final Animation<double> opacity;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: FadeTransition(
        opacity: opacity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlutterLogo(size: AppResponsiveInfo.icon(20)), // Responsive logo
            SizedBox(height: AppResponsiveInfo.h(20)),
            Text(AppStrings.appName, style: AppTextStyles.headline1),
          ],
        ),
      ),
    );
  }
}
