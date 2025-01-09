// class Dimens {
//   Dimens._();

//   //for all screens
//   static const double horizontal_padding = 12.0;
//   static const double vertical_padding = 12.0;
// }


import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Dimens {
  Dimens._();

  static const double horizontal_padding = 12.0;
  static const double vertical_padding = 12.0;
  static double baselineWidth = 375.0;
  static double baselineHeight = 912.0;

  static double resHeight(double heightPx) {
    double screenHeight = Get.height;
    double scaleFactor = screenHeight / baselineHeight;
    return heightPx * scaleFactor;
  }

  static double resWidth(double widthPx) {
    double screenWidth = Get.width;
    double scaleFactor = screenWidth / baselineWidth;
    return widthPx * scaleFactor;
  }

  static EdgeInsets resLeftPadding(double leftPaddingPx, double rightPaddingPx,
      double topPaddingPx, double bottomPaddingPx) {
    return EdgeInsets.only(
        left: resWidth(leftPaddingPx),
        right: resWidth(rightPaddingPx),
        top: resHeight(topPaddingPx),
        bottom: resHeight(bottomPaddingPx));
  }

  static double resFontSize(double fontSizePx) {
    double screenWidth = Get.width;
    double scaleFactor = screenWidth / baselineWidth;
    return fontSizePx * scaleFactor;
  }
}
