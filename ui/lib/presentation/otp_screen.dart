import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:ui/constants/assets.dart';
import 'package:ui/constants/colors.dart';
import 'package:ui/core/widget/button_widget.dart';
import 'package:ui/core/widget/custom_text.dart';
import 'package:ui/presentation/categories.dart';

class OtpScreen extends StatefulWidget {
  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String otp = "";
  String? errorMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Image.asset(Assets.splash,
            width: Get.width, height: Get.height * 0.6, fit: BoxFit.cover),
        Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                height: 280,
                width: Get.width,
                decoration: const BoxDecoration(
                  color: AppColors.containerColor,
                  borderRadius: BorderRadius.only(),
                ),
                child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText(
                              title: "Sign In", color: AppColors.primarycolor),
                          const SizedBox(
                              height: 30,
                              child: Text(
                                " OTP",
                                selectionColor: AppColors.primarycolor,
                                style: TextStyle(fontSize: 12),
                              )),
                          PinCodeTextField(
                            appContext: context,
                            length: 6,
                            keyboardType: TextInputType.number,
                            textStyle: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                            cursorColor: AppColors.titleColor,
                            pinTheme: PinTheme(
                              shape: PinCodeFieldShape.box,
                              fieldHeight: 50,
                              fieldWidth: 50,
                              // activeFillColor: Colors.white,
                              inactiveColor: Colors.grey,
                              activeColor: AppColors.titleColor,
                              selectedColor: AppColors.primarycolor,
                            ),
                            onChanged: (value) {
                              setState(() {
                                otp = value;
                                errorMessage =
                                    null; 
                              });

                              //   otp = value;
                              //   print("OTP: $value");
                            },
                          ),
                          if (errorMessage !=
                              null) // Show error message if present
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

                          // onCompleted: (value) {
                          //   otp = value;
                          //   if (otp.length == 6) {
                          //     Get.to(Categories());

                          //     print("Completed OTP: $value");
                          //   }
                          // }),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: ButtonWidget(
                              buttonText: "Verify OTP",
                              onPressed: () {
                                if (otp.length != 6) {
                                  setState(() {
                                    errorMessage =
                                        "Please enter a valid 6-digit OTP.";
                                  });
                                  //   Get.snackbar(
                                  //     "Invalid OTP",
                                  //     "Please enter a valid 6-digit OTP.",
                                  //     backgroundColor: AppColors.redShadeColor,
                                  //     colorText: Colors.white,
                                  //     snackPosition: SnackPosition.BOTTOM,
                                  //   );
                                } else {
                                  setState(() {
                                    errorMessage = null;
                                  });
                                    Get.to(Categories());
                                    print("OTP Verified: $otp");
                                }
                              },
                              width: Get.width * 0.9,
                              height: 48,
                              radius: 10,
                              color: AppColors.primarycolor,
                            ),
                          ),
                        ])))),
      ]),
    );
  }
}
