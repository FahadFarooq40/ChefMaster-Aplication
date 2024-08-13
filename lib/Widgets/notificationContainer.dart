import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Correct import for svg

import 'app_text.dart';
import 'color.dart';

class NotificationContainer extends StatelessWidget {
  final String title;
  final String message;
  final String timeAgo;
  final String iconPath;

  const NotificationContainer({
    super.key,
    required this.title,
    required this.message,
    required this.timeAgo,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey.shade200,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(
                text: title,
                textColor: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
              SvgPicture.asset(
                iconPath,
                height: 24,
                width: 24,
              ),
            ],
          ),
          const SizedBox(height: 8),
          AppText(
            text: message,
            textColor: AppColors.greyColor,
            fontWeight: FontWeight.w400,
            fontSize: 12,
          ),
          const SizedBox(height: 8),
          AppText(
            text: timeAgo,
            textColor: AppColors.greyColor,
            fontSize: 10,
            fontWeight: FontWeight.w400,
          ),
        ],
      ),
    );
  }
}
