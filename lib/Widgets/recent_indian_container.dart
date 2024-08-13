import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../App Assets/app_assets.dart';
import 'app_text.dart';
import 'color.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RecipiesIndianContainer extends StatefulWidget {
  const RecipiesIndianContainer(
      {super.key,
      required double elevation,
      required BorderRadius borderRadius});

  @override
  State<RecipiesIndianContainer> createState() =>
      _RecipiesIndianContainerState();
}

class _RecipiesIndianContainerState extends State<RecipiesIndianContainer> {
  double _rating = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        color: Colors.white,
        width: 251,
        height: 127,
      ),
      Positioned(
        right: 0,
        bottom: 0,
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.grey.shade100,
          ),
          height: 95,
          width: 251,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const AppText(
                textAlign: TextAlign.center,
                text: 'Steak with tomato..',
                fontSize: 14,
                textColor: Colors.black,
              ),
              RatingBar.builder(
                initialRating: _rating,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemSize: 12,
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  setState(() {
                    _rating = rating;
                  });
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 25,
                    height: 25,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(13),
                      child: Image.asset(AppAssets.personImage),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const AppText(
                    text: 'By James Milner',
                    textColor: AppColors.blackColor,
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  const AppText(
                    text: '20 mins',
                    textColor: AppColors.blackColor,
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  SvgPicture.asset(AppAssets.timerIcon),
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
          AppAssets.recipiesImage,
          width: 105,
          height: 94,
        ),
      ),
    ]);
  }
}
