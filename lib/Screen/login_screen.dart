import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../App Assets/app_assets.dart';
import '../Routes/route_name.dart';
import '../Widgets/app_text.dart';
import '../Widgets/color.dart';
import '../Widgets/custom_button.dart';
import '../Widgets/icon_button.dart';
import '../Widgets/text_form.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final bool isTablet = size.width >= 670;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const AppText(
                  text: "Hello there, friend!",
                  textColor: AppColors.blackColor,
                  fontSize: 30,
                ),
                SizedBox(height: size.height * 0.01),
                const AppText(
                  text: "Welcome back! Ready to cook up something delicious?",
                  textColor: AppColors.blackColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
                SizedBox(height: size.height * 0.04),
                const CustomTextFormField(
                  label: 'Email',
                  hintText: 'Enter your Email',
                ),
                SizedBox(height: size.height * 0.02),
                const CustomTextFormField(
                  label: 'Password',
                  hintText: 'Enter your Password',
                ),
                SizedBox(height: size.height * 0.01),
                const AppText(
                  text: 'Forgot Password?',
                  textColor: AppColors.primaryColor,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
                SizedBox(height: size.height * 0.04),
                CustomButton(
                  onTap: () {
                    Get.toNamed(RouteName.bottomNavigationBar);
                  },
                  icon: Icons.arrow_forward,
                  label: 'Sign In',
                  height: 55,
                ),
                SizedBox(height: size.height * 0.04),
                Row(
                  children: <Widget>[
                    Expanded(
                        child: Divider(
                      thickness: isTablet ? 2 : 1,
                      color: AppColors.lightGreyColor,
                    )),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: AppText(
                        text: "Or Sign in With",
                        fontSize: isTablet ? 20 : 12,
                        textColor: AppColors.lightGreyColor,
                      ),
                    ),
                    Expanded(
                        child: Divider(
                      thickness: isTablet ? 2 : 1,
                      color: AppColors.lightGreyColor,
                    )),
                  ],
                ),
                SizedBox(height: size.height * 0.04),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButtons(
                      icon: AppAssets.googleIcon,
                    ),
                    SizedBox(width: 20),
                    IconButtons(
                      icon: AppAssets.facebookIcon,
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.04),
                Align(
                  alignment: Alignment.center,
                  child: RichText(
                    text: TextSpan(
                      text: "Don’t have an account? ",
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Get.toNamed(RouteName.signUpScreen);
                            },
                          text: 'sign up',
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: AppColors.orangeColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
