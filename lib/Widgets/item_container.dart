import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../App Assets/app_assets.dart';
import 'app_text.dart';
import 'color.dart';

class ItemContainer extends StatelessWidget {
  final String imagePath;
  final String time;
  final double? rating; // Rating can be nullable
  final String title; // Added title parameter

  const ItemContainer({
    super.key,
    required this.imagePath,
    required this.time,
    this.rating, // Make rating optional
    required this.title, // Title is now required
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.white,
          width: 150,
          height: 231,
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.grey.shade200,
            ),
            height: 176,
            width: 150,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Center(
                  child: AppText(
                    textAlign: TextAlign.center,
                    text: title, // Use the title parameter
                    fontSize: 14,
                    textColor: Colors.black,
                  ),
                ),
                const SizedBox(height: 5),
                const AppText(
                  text: 'Time',
                  textColor: AppColors.greyColor,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText(
                      text: time,
                      textColor: AppColors.blackColor,
                      fontSize: 15,
                    ),
                    Container(
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(13),
                        color: AppColors.whiteColor,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: SvgPicture.asset(
                          AppAssets.bookMarkIcon,
                          fit: BoxFit.contain, // Correct usage of BoxFit
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Positioned(
          right: 0,
          top: 0,
          child: Image.asset(
            imagePath,
            width: 150,
            height: 110,
          ),
        ),
        Positioned(
          top: 30,
          right: 0,
          child: Container(
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
                  text: rating?.toString() ?? 'N/A', // Handle null rating
                  fontWeight: FontWeight.w200,
                  fontSize: 11,
                  textColor: Colors.black,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
