// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
//import 'package:hotelApp/constants/colors.dart';
//import 'package:hotelApp/core/widgets/custom_text.dart';
//import 'package:hotelApp/di/service_locator.dart';
import 'package:ui/core/widget/custom_text.dart';
//import 'package:hotelApp/presentation/home/store/theme/theme_store.dart';

import '../../constants/colors.dart';

class ButtonWidget extends StatelessWidget {
  final String? buttonText;
  final double fontSize;
  final VoidCallback? onPressed;
  final double height;
  final double width;
  final double radius;
  final bool isProgressIndicator;
  final Color color;


 ButtonWidget({
    this.buttonText,
    this.onPressed,
    this.fontSize = 15,
    this.height = 47,
    this.width = 300,
    this.radius = 24,
    this.isProgressIndicator = false,
    this.color = AppColors.primarycolor,
   

  });

  //late ThemeStore _themeStore = getIt<ThemeStore>();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) => InkWell(
        onTap: onPressed,
        child: Container(
          width: width,
          height: height,
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            color: color,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
            ),
          ),
         // child:Padding (
          //   padding:padding,
          //   child: 
            child: Center(
            child:
                isProgressIndicator ? _buildProgressIndicator() : _buildText(),
          ),
        ),
      ),
    );
  }

  Widget _buildText() {
    return CustomText(
      title: buttonText!,
      alignment: TextAlign.center,
    //  color: _themeStore.darkMode ? AppColors.white : AppColors.white,
    color: AppColors.white,
      fontSize: fontSize,
      fontWeight: FontWeight.w500,
      height: 0,
    );
  }

  Widget _buildProgressIndicator() {
    return const SizedBox(
      height: 25,
      width: 25,
      child: CircularProgressIndicator(
        color: AppColors.white,
        strokeWidth: 2,
      ),
    );
  }
}

