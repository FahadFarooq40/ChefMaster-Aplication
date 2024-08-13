import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../App Assets/app_assets.dart';
import 'app_text.dart';
import 'color.dart';

class RecentSearchContainer extends StatelessWidget {
  const RecentSearchContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white, // Ensure the container has a background color
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Opacity(
            opacity: 0.9, // Set opacity value here (0.0 - 1.0)
            child: Image.asset(
              AppAssets.saveItem,
              fit: BoxFit.cover, // Ensure image covers the container
            ),
          ),
          Positioned(
            top: 10,
            left: 10, // Adjusted to avoid overlap
            child: Container(
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.lightOrangeColor,
              ),
              height: 23,
              width: 45,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(AppAssets.starIcon),
                  const SizedBox(width: 3),
                  const AppText(
                    text: '4.5',
                    fontWeight: FontWeight.w200,
                    fontSize: 14,
                    textColor: Colors.black,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 10, // Positioned at the bottom
            left: 10, // Adjusted for alignment
            right: 10, // Adjusted for alignment
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AppText(
                  text: 'Traditional spare ribs baked',
                  fontSize: 14,
                  fontWeight: FontWeight.bold, // Emphasize the title
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    const AppText(
                      text: 'By Fahad Farooq',
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      textColor: AppColors.greyColor, // Consistent text color
                    ),
                    const Spacer(), // Use Spacer to push elements to the edges
                    SvgPicture.asset(
                      AppAssets.timerIcon,
                      color: Colors.white,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(width: 5),
                    const AppText(
                      text: '20 mins',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      textColor: AppColors.whiteColor, // Consistent text color
                    ),
                    const SizedBox(width: 5),
                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(13),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: SvgPicture.asset(
                          AppAssets.bookMarkIcon,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
