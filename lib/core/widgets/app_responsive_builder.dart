// lib/core/widgets/responsive_builder.dart

import 'package:bit_mascot_assessment/core/utils/app_responsive_info.dart';
import 'package:flutter/material.dart';

class AppResponsiveBuilder extends StatelessWidget {
  final Widget Function(BuildContext context, AppResponsiveInfo info) builder;

  const AppResponsiveBuilder({super.key, required this.builder});

  @override
  Widget build(BuildContext context) {
    final info = AppResponsiveInfo.of(context);

    return builder(context, info);
  }
}
