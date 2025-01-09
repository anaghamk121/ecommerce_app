import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:ui/constants/colors.dart';
import 'package:ui/core/widget/button_widget.dart';
import 'package:ui/presentation/admin_approval.dart';
import '../constants/assets.dart';

class ResendOtp extends StatefulWidget {
  @override
  State<ResendOtp> createState() => _ResendOtpState();
}

class _ResendOtpState extends State<ResendOtp> {
  String otp = "";
  String? errorMessage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Image.asset(
            Assets.email,
            width: Get.width,
            height: Get.height * 0.4,
            fit: BoxFit.cover,
          ),
          // height: MediaQuery.of(context).size.height),
          const Text(
            " Enter OTP to verify your e-mail",
            selectionColor: AppColors.primarycolor,
            style: TextStyle(fontSize: 14),
          ),
          const SizedBox(
            height: 60,
          ),
          PinCodeTextField(
            appContext: context,
            length: 4,
            keyboardType: TextInputType.number,
            textStyle: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
            cursorColor: AppColors.titleColor,
            pinTheme: PinTheme(
              shape: PinCodeFieldShape.box,
              fieldHeight: 35,
              fieldWidth: 35,
              // activeFillColor: Colors.white,
              inactiveColor: Colors.grey,
              activeColor: AppColors.titleColor,
              selectedColor: AppColors.primarycolor,
            ),
            onChanged: (value) {
              setState(() {
                otp = value;
                errorMessage = null;
              });

              //   otp = value;
              //   print("OTP: $value");
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

          const SizedBox(
            height: 270,
          ),
          ButtonWidget(
            onPressed: () {
              if (otp.length != 4) {
                setState(() {
                  errorMessage = "Please enter a valid 4-digit OTP";
                });
              } else {
                setState(() {
                  errorMessage = null;
                });
              
               Get.to(AdminApproval());
            }
  },
            buttonText: "Verify OTP",
            width: Get.width * 0.9,
            height: 48,
            radius: 10,
            color: AppColors.primarycolor,
          )
        ]),
      ),
    );
  }
}
