import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:food_recipes/Widgets/signup_controller.dart';

import 'package:get/get.dart';

import '../App Assets/app_assets.dart';
import '../Routes/route_name.dart';
import '../Widgets/app_text.dart';
import '../Widgets/color.dart';
import '../Widgets/custom_button.dart';
import '../Widgets/icon_button.dart';
import '../Widgets/text_form.dart';

class SigupScreen extends StatefulWidget {
  const SigupScreen({super.key});

  @override
  State<SigupScreen> createState() => _SigupScreenState();
}

class _SigupScreenState extends State<SigupScreen> {
  final SignUpController loginController = Get.put(SignUpController());

  final bool _termsAccepted = false;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final bool isTablet = size.width >= 600;
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
                  text: 'Create an account',
                  textColor: Colors.black,
                  fontSize: 20,
                ),
                SizedBox(height: size.height * 0.015),
                const AppText(
                  text:
                      'Let’s help you set up your account,\nit won’t take long.',
                  textColor: Colors.black,
                  fontSize: 11,
                  fontWeight: FontWeight.w400,
                ),
                SizedBox(height: size.height * 0.02),
                const CustomTextFormField(
                  label: 'Name',
                  hintText: 'Enter your Name',
                ),
                SizedBox(height: size.height * 0.02),
                const CustomTextFormField(
                  label: 'Email',
                  hintText: 'Enter your Email',
                ),
                SizedBox(height: size.height * 0.02),
                const CustomTextFormField(
                  label: 'Password',
                  hintText: 'Enter your Password',
                ),
                SizedBox(height: size.height * 0.02),
                const CustomTextFormField(
                  label: 'Confirm Password',
                  hintText: 'Enter your Password',
                ),
                SizedBox(height: size.height * 0.02),
                Row(
                  children: [
                    Obx(
                      () => GestureDetector(
                        onTap: () {
                          loginController.check();
                        },
                        child: Container(
                          width:
                              isTablet ? size.width * 0.03 : size.width * 0.036,
                          height: isTablet
                              ? size.height * 0.027
                              : size.height * 0.017,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                            border: Border.all(color: AppColors.orangeColor),
                            color: loginController.isChecked.value
                                ? AppColors.primaryColor
                                : Colors.transparent,
                          ),
                          child: loginController.isChecked.value
                              ? Icon(
                                  Icons.check,
                                  color: Colors.white,
                                  size: size.height * 0.013,
                                )
                              : null,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const AppText(
                      text: 'Accept terms & Condition',
                      textColor: AppColors.orangeColor,
                      fontSize: 11,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.02),
                const CustomButton(
                  label: 'Sign Up',
                  height: 55,
                  icon: Icons.arrow_forward,
                ),
                SizedBox(height: size.height * 0.02),
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
                SizedBox(height: size.height * 0.02),
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
                      text: "Already a member? ",
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Get.toNamed(RouteName.loginscreen);
                            },
                          text: 'signin',
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
