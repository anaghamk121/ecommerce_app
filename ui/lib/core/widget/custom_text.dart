
import 'package:flutter/material.dart';
import 'package:ui/constants/font_family.dart';

class CustomText extends StatelessWidget {
  //constructor
  final String title;
  final double fontSize;
  final FontWeight fontWeight;
 // final ThemeStore _themeStore = getIt<ThemeStore>();
  final Color color;
  final double height;
  final TextAlign alignment;
  CustomText({
    required this.title,
    this.fontSize = 20,
    this.fontWeight = FontWeight.w500,
    required this.color,
    this.height = 1.50,
    this.alignment = TextAlign.center,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: alignment,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontFamily: FontFamily.latoRegular,
        fontWeight: fontWeight,
        height: height,
      ),
    );
  }
}