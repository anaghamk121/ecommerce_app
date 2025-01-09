

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui/constants/assets.dart';
import 'package:ui/constants/colors.dart';
import 'package:ui/core/widget/button_widget.dart';
import 'package:ui/core/widget/custom_text.dart';
import 'package:ui/presentation/otp_screen.dart';
import 'package:ui/presentation/signin_vendor.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController phoneController = TextEditingController();
  String? errorMessage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            Assets.splash,
            width: Get.width,
            height: Get.height * 0.6,
            fit: BoxFit.cover,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              // height: Get.height*0.6,
              height: 280,
              width: Get.width,
              // constraints: BoxConstraints(maxHeight: Get.height*0.6),
              decoration: const BoxDecoration(
                color: AppColors.containerColor,
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        title: "Sign In",
                        color: AppColors.primarycolor,
                      ),
                      const SizedBox(
                        height: 30,
                        child: Text(
                          "Phone number",
                          selectionColor: AppColors.primarycolor,
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                
                      TextField(           
                        controller: phoneController,
                        cursorColor: AppColors.titleColor,
                        keyboardType: TextInputType.phone,
                        decoration:const InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.zero
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.zero,
                              borderSide: BorderSide(color: AppColors.titleColor),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.zero,
                                borderSide:
                                    BorderSide(color: AppColors.primarycolor)
                                    )
                                    ),
                        onChanged: (value) {
                       
                          setState(() {
                            errorMessage = null;
                          });
                        },
                      ),
                      if (errorMessage != null)
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            errorMessage!,
                            style:const TextStyle(
                              color: AppColors.primarycolor,
                              fontSize: 12,
                            ),
                          ),
                        ),
                
                 
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: ButtonWidget(
                          height: 50,
                          width:  MediaQuery.of(context).size.width * 0.9,
                          buttonText: "Sign In",
                          onPressed: () {
                            String phoneNumber = phoneController.text.trim();
                            if (phoneNumber.length != 10 ||
                                int.tryParse(phoneNumber) == null) {
                              setState(() {
                                errorMessage =
                                    "Please enter a valid 10-digit phone number.";
                              });
                
                                 } else {
                              setState(() {
                                errorMessage = null;
                              });
                              Get.to(() => OtpScreen());
                              print("Sign In button pressed!");
                            }
                          },
                        //   width: Get.width 
                        //   * 0.9,
                        //  height: 48,
                        //   radius: 10,
                        //   color: AppColors.redShadeColor,
                        ),
                      ),
                      Center(
                        child: TextButton(
                          onPressed: () {
                           Get.to(SigninVendor());
                            print(" button pressed!");
                          },
                          child: const Text(
                            "Login as Vendor",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primarycolor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
