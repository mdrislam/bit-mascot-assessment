
import 'package:flutter/material.dart';

class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static late Orientation orientation;

  static void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;
  }

  /// Scale width based on 375 base (iPhone 11 Pro)
  static double w(double inputWidth) => (inputWidth / 375.0) * screenWidth;

  /// Scale height based on 812 base (iPhone 11 Pro)
  static double h(double inputHeight) => (inputHeight / 812.0) * screenHeight;

  /// Scale font based on width
  static double sp(double fontSize) => w(fontSize);
}
