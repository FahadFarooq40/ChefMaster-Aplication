import 'package:flutter/material.dart';

import 'app_text.dart';
import 'color.dart';

class Appbar extends StatelessWidget {
  final String title;
  final String subtitle;
  final String profileImage;

  const Appbar({
    super.key,
    required this.title,
    required this.subtitle,
    required this.profileImage,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: AppText(
        text: title,
        textColor: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      subtitle: AppText(
        text: subtitle,
        textColor: AppColors.blackColor,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      trailing: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            profileImage,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
