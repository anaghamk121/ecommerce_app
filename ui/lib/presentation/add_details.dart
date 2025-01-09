import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui/constants/colors.dart';
import 'package:ui/core/widget/button_widget.dart';
import 'package:ui/core/widget/custom_text.dart';
import 'package:ui/presentation/verify_OTP.dart';

class details extends StatefulWidget {
  @override
  State<details> createState() => _detailsState();
}

final _formKey = GlobalKey<FormState>();

class _detailsState extends State<details> {
  final TextEditingController businessNameController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController userContactController = TextEditingController();
  final TextEditingController userEmailController = TextEditingController();

  String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return 'This field cannot be empty';
    }
    RegExp emailRegex = RegExp(
      r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
    );
    final isEmailValid = emailRegex.hasMatch(email ?? '');
    if (!isEmailValid) {
      return 'please enter valid email';
    }
    return null;
  }
 String? validatePhoneNumber(String? phone) {
    if (phone == null || phone.isEmpty) {
      return 'This field cannot be empty';
    }
    RegExp phoneRegex = RegExp(
      r"^(\+?[0-9]{1,3}[-\s]?)?[0-9]{10}$", 
    );

    final isPhoneValid = phoneRegex.hasMatch(phone);
    if (!isPhoneValid) {
      return 'Please enter a valid phone number';
      
    }
    return null;
  }

  String? validateNotEmpty(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'This field cannot be empty';
    }
    return null;
  }

  String? errorMessage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Center(
                        child: CustomText(
                            title: "Additional Details",
                            color: AppColors.primarycolor)),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: Text(
                      "Business Name",
                      style: TextStyle(
                        color: AppColors.blackColor,
                      ),
                    ),
                  ),
                  TextFormField(
                    controller: businessNameController,
                    cursorColor: AppColors.titleColor,
                    decoration: const InputDecoration(
                        //  labelText: "Business Name",
                        border:
                            OutlineInputBorder(borderRadius: BorderRadius.zero),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.zero,
                          borderSide: BorderSide(color: AppColors.titleColor),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.zero,
                            borderSide:
                                BorderSide(color: AppColors.primarycolor))),
                    validator: validateNotEmpty,
                  ),
                  const SizedBox(height: 50),
                  const Text(
                    "User Name",
                    style: TextStyle(
                      color: AppColors.blackColor,
                    ),
                  ),
                  TextFormField(
                    controller: userNameController,
                    cursorColor: AppColors.titleColor,
                    decoration: const InputDecoration(
                        //labelText: "User name",
                        border:
                            OutlineInputBorder(borderRadius: BorderRadius.zero),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.zero,
                          borderSide: BorderSide(color: AppColors.titleColor),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.zero,
                            borderSide:
                                BorderSide(color: AppColors.primarycolor))),
                    validator: validateNotEmpty,
                  ),
                  const SizedBox(height: 50),
                  const Text(
                    "User Contact",
                    style: TextStyle(
                      color: AppColors.blackColor,
                    ),
                  ),
                  TextFormField(
                    controller: userContactController,
                    cursorColor: AppColors.titleColor,
                    decoration: const InputDecoration(
                        // labelText: "User contact",
                        border:
                            OutlineInputBorder(borderRadius: BorderRadius.zero),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.zero,
                          borderSide: BorderSide(color: AppColors.titleColor),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.zero,
                            borderSide:
                                BorderSide(color: AppColors.primarycolor))),
                    validator: validatePhoneNumber,
                  ),
                  const SizedBox(height: 50),
                  const Text(
                    "User Email",
                    style: TextStyle(
                      color: AppColors.blackColor,
                    ),
                  ),
                  TextFormField(
                    controller: userEmailController,
                    cursorColor: AppColors.titleColor,
                    decoration: const InputDecoration(
                        // labelText: "User Email",
                        border:
                            OutlineInputBorder(borderRadius: BorderRadius.zero),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.zero,
                          borderSide: BorderSide(color: AppColors.titleColor),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.zero,
                            borderSide:
                                BorderSide(color: AppColors.primarycolor))),
                    validator: validateEmail,
                  ),
                  const SizedBox(height: 100),
                  if (errorMessage != null)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: Text(
                        errorMessage!,
                        style: const TextStyle(
                          color: AppColors.primarycolor,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ButtonWidget(
                    buttonText: "Confirm",
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        if (businessNameController.text.trim().isEmpty ||
                            userNameController.text.trim().isEmpty ||
                            userContactController.text.trim().isEmpty ||
                            userEmailController.text.trim().isEmpty) {
                          setState(() {
                            errorMessage = "All fields are required.";
                          });
                        } else {
                          setState(() {
                            errorMessage = null;
                          });

                          Get.to(VerifyOtp());
                        }
                      }
                    },
                    width: Get.width * 0.9,
                    height: 48,
                    radius: 10,
                    color: AppColors.primarycolor,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
