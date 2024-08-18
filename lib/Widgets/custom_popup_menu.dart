import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_recipes/Widgets/custom_button.dart';
import 'package:get/get.dart';

import '../App Assets/app_assets.dart';
import '../Routes/route_name.dart';
import 'app_text.dart';
import 'color.dart';

class CustomPopupMenu extends StatefulWidget {
  const CustomPopupMenu({super.key});

  @override
  _CustomPopupMenuState createState() => _CustomPopupMenuState();
}

class _CustomPopupMenuState extends State<CustomPopupMenu> {
  double _rating = 0;

  void _showPopupMenu(BuildContext context) {
    const double paddingFromTop = kToolbarHeight + 20;
    const double paddingFromRight = kToolbarHeight + 70;
    final Offset offset = Offset(
      MediaQuery.of(context).size.width - 70 - paddingFromRight,
      paddingFromTop,
    );
    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(
        offset.dx,
        offset.dy,
        offset.dx + 70,
        offset.dy + 70,
      ),
      items: [
        PopupMenuItem(
          child: Row(
            children: [
              SvgPicture.asset(AppAssets.shareIcon),
              const SizedBox(width: 10),
              const Text('Share'),
            ],
          ),
          onTap: () {
            Navigator.pop(context); // Close the menu
            _showShareDialog(context);
          },
        ),
        PopupMenuItem(
          child: Row(
            children: [
              SvgPicture.asset(AppAssets.rateRecipeIcon),
              const SizedBox(width: 10),
              const Text('Rate Recipe'),
            ],
          ),
          onTap: () {
            Navigator.pop(context); // Close the menu
            _showRateDialog(context);
          },
        ),
        PopupMenuItem(
          child: Row(
            children: [
              SvgPicture.asset(AppAssets.messageIcon),
              const SizedBox(width: 10),
              const Text('Review'),
            ],
          ),
          onTap: () {
            Navigator.pop(context); // Close the menu
            Get.toNamed(RouteName.reviewsScreen);
          },
        ),
        PopupMenuItem(
          child: Row(
            children: [
              SvgPicture.asset(AppAssets.unsavedIcon),
              const SizedBox(width: 10),
              const Text('Unsave'),
            ],
          ),
          onTap: () {
            Navigator.pop(context); // Close the menu
            // Handle Unsave Action
          },
        ),
      ],
    );
  }

  void _showShareDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: Colors.white,
        title: const AppText(
          text: 'Recipe Link ',
          textColor: Colors.black,
          fontSize: 20,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppText(
              text:
                  'Copy recipe link and share your recipe link with friends and family.',
              fontWeight: FontWeight.w400,
              textColor: AppColors.greyColor,
              fontSize: 11,
            ),
            const SizedBox(height: 10),
            Container(
              width: 280,
              height: 43,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Row(
                  children: [
                    const SizedBox(width: 7),
                    const AppText(
                      text: 'ChefMaster-Aplication',
                      textColor: Colors.black,
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        // Implement copy functionality here
                      },
                      child: Container(
                        height: 43,
                        width: 50,
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Center(
                          child: AppText(
                            text: 'Copy',
                            textColor: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showRateDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          backgroundColor: Colors.white,
          title: const AppText(
            textAlign: TextAlign.center,
            text: 'Rate recipe',
            textColor: Colors.black,
            fontSize: 20,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RatingBar.builder(
                unratedColor: Colors.amber,
                initialRating: _rating,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemSize: 30,
                itemBuilder: (context, index) {
                  return Icon(
                    index < _rating.floor() ? Icons.star : Icons.star_border,
                    color: Colors.amber,
                  );
                },
                onRatingUpdate: (rating) {
                  setState(() {
                    _rating = rating;
                  });
                },
              ),
              const SizedBox(height: 20),
              CustomButton(
                onTap: () {
                  Navigator.pop(context);
                },
                backgroundColor: Colors.amber,
                label: 'Send',
                width: 70,
                height: 35,
                fontSize: 12,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.more_vert),
      onPressed: () => _showPopupMenu(context),
    );
  }
}
