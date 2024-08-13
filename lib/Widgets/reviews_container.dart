import 'package:flutter/material.dart';
import '../App Assets/app_assets.dart';
import 'app_text.dart';
import 'color.dart';
import 'custom_button.dart';

class ReviewsContainer extends StatelessWidget {
  final String userName;
  final String userHandle;
  final String reviewText;
  final int upvotes;
  final int downvotes;

  const ReviewsContainer({
    super.key,
    required this.userName,
    required this.userHandle,
    required this.reviewText,
    required this.upvotes,
    required this.downvotes,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      height: 94,
      width: 313,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: 31,
                width: 31,
                decoration: const BoxDecoration(shape: BoxShape.circle),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    AppAssets.profilePhoto,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    text: userName,
                    fontSize: 11,
                    textColor: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  AppText(
                    text: userHandle,
                    fontSize: 8,
                    textColor: AppColors.greyColor,
                    fontWeight: FontWeight.w400,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 5),
          AppText(
            text: reviewText,
            fontSize: 11,
            textColor: Colors.black54,
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              CustomButton(
                backgroundColor: Colors.tealAccent.shade700,
                label: '👍 $upvotes',
                textColor: Colors.black,
                width: 29,
                height: 18,
                fontSize: 8,
              ),
              const SizedBox(width: 5),
              CustomButton(
                backgroundColor: Colors.teal.shade100,
                label: '👎 $downvotes',
                textColor: Colors.black,
                width: 29,
                height: 18,
                fontSize: 8,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
