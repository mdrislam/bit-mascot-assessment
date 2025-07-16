// lib/core/utils/app_responsive_info.dart

import 'package:bit_mascot_assessment/core/theme/app_sizes.dart';
import 'package:flutter/material.dart';

class AppResponsiveInfo {
  static final AppResponsiveInfo _instance = AppResponsiveInfo._internal();

  static late double screenWidth;
  static late double screenHeight;
  static late Orientation orientation;
  static late EdgeInsets safePadding;

  AppResponsiveInfo._internal();

  factory AppResponsiveInfo.of(BuildContext context) {
    final mq = MediaQuery.of(context);
    screenWidth = mq.size.width;
    screenHeight = mq.size.height;
    orientation = mq.orientation;
    safePadding = mq.padding;
    return _instance;
  }

  // Orientation helpers
  bool get isPortrait => orientation == Orientation.portrait;
  bool get isLandscape => orientation == Orientation.landscape;

  // Device type helpers
  bool get isMobile => screenWidth < 600;
  bool get isTablet => screenWidth >= 600 && screenWidth < 1024;
  bool get isDesktop => screenWidth >= 1024;

  // Scaling helpers (base size: 375x812)
  static double w(double inputWidth) => (inputWidth / 375.0) * screenWidth;
  static double h(double inputHeight) => (inputHeight / 812.0) * screenHeight;
  static double sp(double fontSize) => w(fontSize);
  static double icon(double size) => w(size);

  // Padding helpers
  static EdgeInsets paddingAll(double size) => EdgeInsets.all(w(size));
  static EdgeInsets paddingSymmetric({
    double horizontal = 0,
    double vertical = 0,
  }) => EdgeInsets.symmetric(horizontal: w(horizontal), vertical: h(vertical));
  static EdgeInsets paddingOnly({
    double left = 0,
    double top = 0,
    double right = 0,
    double bottom = 0,
  }) => EdgeInsets.only(
    left: w(left),
    top: h(top),
    right: w(right),
    bottom: h(bottom),
  );

  // Margin (same methods)
  static EdgeInsets marginAll(double size) => paddingAll(size);
  static EdgeInsets marginSymmetric({
    double horizontal = 0,
    double vertical = 0,
  }) => paddingSymmetric(horizontal: horizontal, vertical: vertical);
  static EdgeInsets marginOnly({
    double left = 0,
    double top = 0,
    double right = 0,
    double bottom = 0,
  }) => paddingOnly(left: left, top: top, right: right, bottom: bottom);

  // Border radius
  static BorderRadius borderRadiusAll(double radius) =>
      BorderRadius.circular(w(radius));
  static BorderRadius borderRadiusOnly({
    double topLeft = 0,
    double topRight = 0,
    double bottomLeft = 0,
    double bottomRight = 0,
  }) => BorderRadius.only(
    topLeft: Radius.circular(w(topLeft)),
    topRight: Radius.circular(w(topRight)),
    bottomLeft: Radius.circular(w(bottomLeft)),
    bottomRight: Radius.circular(w(bottomRight)),
  );

  // Safe area
  EdgeInsets get safeAreaPadding => safePadding;
  static double get safeTop => safePadding.top;
  static double get safeBottom => safePadding.bottom;
  static double get safeLeft => safePadding.left;
  static double get safeRight => safePadding.right;

  // Example spacings
  static double get spacingSmall => h(AppSizes.spacingSmall);
  static double get spacingMedium => h(AppSizes.spacingMedium);
  static double get spacingLarge => h(AppSizes.spacingLarge);
}
