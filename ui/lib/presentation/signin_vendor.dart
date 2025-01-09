import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui/constants/assets.dart';
import 'package:ui/constants/colors.dart';
import 'package:ui/core/widget/button_widget.dart';
import 'package:ui/core/widget/custom_text.dart';
import 'package:ui/presentation/login_screen.dart';
import 'package:ui/presentation/otp_screen.dart';

class SigninVendor extends StatefulWidget {
  @override
  State<SigninVendor> createState() => _SigninVendorState();
}

class _SigninVendorState extends State<SigninVendor> {
 // final number phonenumber = number(r'^\91\d{10}$');
  // final RegExp phoneRegex = RegExp(r'^\+91\d{10}$');

  final TextEditingController phoneController = TextEditingController();
  String? errorMessage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(Assets.splash,
              width: Get.width, height: Get.height * 0.6, fit: BoxFit.cover),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                width: Get.width,
                height: 280,
                //   constraints: BoxConstraints(maxHeight: Get.height * 0.6),
                decoration: const BoxDecoration(
                  color: AppColors.containerColor,

                  // borderRadius: BorderRadius.only(
                  //     // topLeft: Radius.circular(20),
                  //     // topRight: Radius.circular(20),
                  //     ),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // const  Text("Phone number",selectionColor: AppColors.redShadeColor,style: TextStyle(fontSize: 12),),
                            CustomText(
                                title: "Sign In",
                                color: AppColors.primarycolor),
                            const SizedBox(
                                height: 30,
                                child: Text(
                                  "Phone number",
                                  selectionColor: AppColors.primarycolor,
                                  style: TextStyle(fontSize: 12),
                                )),
                            TextField(
                              controller: phoneController,
                              cursorColor: AppColors.titleColor,
                              keyboardType: TextInputType.phone,
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.zero,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.zero,
                                    borderSide:
                                        BorderSide(color: AppColors.titleColor),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.zero,
                                      borderSide: BorderSide(
                                          color: AppColors.primarycolor))),
                              onChanged: (Value) {
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
                                  style: const TextStyle(
                                    color: AppColors.primarycolor,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            // const SizedBox(
                            //   height: 40,
                            // ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: ButtonWidget(
                                buttonText: "Sign In",
                                onPressed: () {
                                 
                   String phoneNumber = phoneController.text.trim();
                          // // Validate using regex
                          // if (!phoneRegex.hasMatch(phoneNumber)) {
                          //   setState(() {
                          //     errorMessage =
                          //         "Please enter a valid phone number in +91XXXXXXXXXX format.";
                          //   });
                      
                                  if (phoneNumber.length != 10 ||
                                      int.tryParse(phoneNumber) == null) {
                                    setState(() {
                                      errorMessage =
                                          "Please enter a valid 10-digit phone number.";
                                    });
                                   } 
                                  else {
                                    setState(() {
                                      errorMessage = null;
                                    });

                                    Get.to(() => OtpScreen());
                                    print("Sign In button pressed!");

                                    //   Get.to(() => OtpScreen());
                                    //   print("Sign In button pressed!");
                                  }
                                },
                                width: Get.width * 0.9,
                                height: 48,
                                radius: 10,
                                color: AppColors.primarycolor,
                              ),
                            ),
                            Center(
                              child: TextButton(
                                onPressed: () {
                                  // Get.to(LoginScreen());
                                  print("more options button pressed!");
                                },
                                child: const Text(
                                  "Login as Customer",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.primarycolor,
                                  ),
                                ),
                              ),
                            ),
                          ])),
                )),
          ),
        ],
      ),
    );
  }
}
