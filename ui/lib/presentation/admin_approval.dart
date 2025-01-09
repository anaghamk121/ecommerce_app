import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui/constants/colors.dart';
import 'package:ui/core/widget/button_widget.dart';

import '../constants/assets.dart';

class AdminApproval extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset(Assets.email,
 width: Get.width,
            height: Get.height 
            * 0.4,
            fit: BoxFit.cover,
          ),
       
          ButtonWidget(
          
            buttonText: "OK", width: Get.width * 0.9,
                              height: 48,
                              radius: 10,
                              color: AppColors.primarycolor,
                           
          ),
        ],
      ),
    );
  }
}
