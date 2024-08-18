import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../App Assets/app_assets.dart';
import '../Routes/route_name.dart';
import '../Widgets/app_text.dart';
import '../Widgets/custom_button.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      Get.toNamed(RouteName.loginscreen);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image container
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppAssets.splashBgImage),
                fit: BoxFit.cover, // Cover the entire screen
              ),
            ),
          ),
          // Overlay gradient container
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.3), // Adjust opacity as needed
                  Colors.black, // Adjust as needed
                ],
              ),
            ),
          ),

          Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Image.asset(
                        AppAssets.splashIcon,
                        width: 79,
                        height: 79,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const AppText(
                        text: '100K+ Premium Recipe ',
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ],
                  ),
                  const Column(
                    children: [
                      AppText(
                        textAlign: TextAlign.center,
                        text: 'Get \nCooking',
                        fontWeight: FontWeight.w600,
                        fontSize: 50,
                      ),
                      AppText(
                        text: 'Simple way to find Tasty Recipe',
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      CustomButton(
                        width: 243,
                        height: 54,
                        label: 'Start Cooking',
                        icon: Icons.arrow_forward,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
