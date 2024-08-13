import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../App Assets/app_assets.dart';
import 'app_text.dart';
import 'color.dart';

class SavedContainer extends StatelessWidget {
  final String imagePath;
  final double rating;
  final String title;
  final String chefName;
  final String cookingTime;

  const SavedContainer({
    super.key,
    required this.imagePath,
    required this.rating,
    required this.title,
    required this.chefName,
    required this.cookingTime,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final containerWidth = screenWidth;
    final containerHeight = screenHeight * 0.2;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      width: containerWidth,
      height: containerHeight,
      decoration: BoxDecoration(
        color: Colors.grey.shade600, // Adjusted for better contrast
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Opacity(
            opacity: 0.8,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: containerHeight * 0.07,
            left: containerWidth * 0.03,
            right: containerWidth *
                0.03, // Ensure content stays within the container
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.lightOrangeColor,
                  ),
                  height: 23,
                  width: 45,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(AppAssets.starIcon),
                      const SizedBox(width: 3),
                      AppText(
                        text: rating.toString(),
                        fontWeight: FontWeight.w200,
                        fontSize: 11,
                        textColor: Colors.black,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: containerHeight * 0.35),
                AppText(
                  text: title,
                  fontSize: 14,
                  textColor: Colors.white, // Ensure text is readable
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText(
                      text: 'By $chefName',
                      fontSize: 8,
                      fontWeight: FontWeight.w400,
                      textColor: Colors.white, // Ensure text is readable
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          AppAssets.timerIcon,
                          color: AppColors.primaryColor,
                          height: 20.0,
                          width: 20.0,
                        ),
                        const SizedBox(width: 5),
                        AppText(
                          text: cookingTime,
                          fontSize: 12.5,
                          fontWeight: FontWeight.w400,
                          textColor: Colors.white, // Ensure text is readable
                        ),
                      ],
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
