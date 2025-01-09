

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui/constants/assets.dart';
import 'package:ui/core/widget/button_widget.dart';
import 'package:ui/presentation/add_details.dart';

import '../constants/colors.dart';

class Categories extends StatefulWidget {
  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  final List<String> images = [
    Assets.splash,
    Assets.splash,
    Assets.splash,
    Assets.splash,
  ];

  final List<String> options = [
     'Hotels',
    'House Boats',
    'Taxi Service',
    'Tour Operator',
    'Experiences',
  ];

  int currentImageIndex = 0; // Track the current image for buttons
  int selectedOptionIndex = -1; // Track the selected category option

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Carousel Slider
            CarouselSlider(
              options: CarouselOptions(
                height: Get.height * 0.3,
                enlargeCenterPage: true,
                enableInfiniteScroll: true,
                //  autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.easeInOut,
                aspectRatio: 16 / 9,
                viewportFraction: 0.8,
                onPageChanged: (index, reason) {
                  setState(() {
                    currentImageIndex = index; // Update the current image index
                  });
                },
              ),
              items: images.map((image) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            blurRadius: 5,
                            spreadRadius: 2,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          image,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),

            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(images.length, (index) {
                    return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: IconButton(
                           // onPressed: onPressed,
                            icon: Icon(
                              Icons.circle,
                              size: 20,
                              color: currentImageIndex == index
                                  ? AppColors.primarycolor
                                  : AppColors.titleColor,
                            ),
                            onPressed: () {
                              setState(() {
                                currentImageIndex = index;
                              });
                            })
                        
                        );
                  }),
                ),
              ),
            ),

            // Center Text
            const Center(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  "Select a Category",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primarycolor,
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: options.asMap().entries.map((entry) {
                  int index = entry.key;
                  String option = entry.value;
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 1),
                    child: ListTile(
                      leading: IconButton(
                        icon: Icon(
                          Icons.circle,
                          color: selectedOptionIndex == index
                              ? AppColors.primarycolor
                              : AppColors.titleColor,
                        ),
                        onPressed: () {
                          setState(() {
                            selectedOptionIndex = index;
                          });
                        },
                      ),
                      title: Text(
                        option,
                        style: const TextStyle(
                          fontSize: 16,
                          color: AppColors.blackColor,
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          selectedOptionIndex = index;
                        });
                      },
                    ),
                  );
                }).toList(),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ButtonWidget(
                buttonText: "Confirm",
                onPressed: () {
                  if (selectedOptionIndex == -1) {
                    Get.snackbar(
                      //snackPosition:
                      backgroundColor: AppColors.primarycolor,
                      colorText: AppColors.white,
                        "Error", "Please select a service before confirming.");
                  } else {
                    print("Selected Option: ${options[selectedOptionIndex]}",);
                    Get.to(details()
                    );
                    
                  }
                },
                width: Get.width * 0.9,
                height: 48,
                radius: 10,
                color: AppColors.primarycolor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
