import 'package:flutter/material.dart';
import 'package:food_recipes/Widgets/custom_popup_menu.dart';
import '../Widgets/app_text.dart';
import '../Widgets/color.dart';
import '../Widgets/reviews_container.dart';
import '../Widgets/text_form.dart';

class ReviewsScreen extends StatefulWidget {
  const ReviewsScreen({super.key});

  @override
  State<ReviewsScreen> createState() => _ReviewsScreenState();
}

class _ReviewsScreenState extends State<ReviewsScreen> {
  // Sample data for reviews
  final List<Map<String, dynamic>> reviews = [
    {
      'userName': 'Fahad Farooq',
      'userHandle': '@fahadfarooq02',
      'reviewText':
          'This recipe turned out great! The instructions were easy to follow, and the result was delicious.',
      'upvotes': 9,
      'downvotes': 1,
    },
    {
      'userName': 'Umer Khan',
      'userHandle': '@UmerKhan25',
      'reviewText': 'Not bad, but the cooking time was a bit too long for me.',
      'upvotes': 5,
      'downvotes': 3,
    },
    // Add more reviews here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        actions: const [
          CustomPopupMenu(),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.comment, color: AppColors.greyColor),
                      SizedBox(width: 5),
                      AppText(
                        text: '10 Comments',
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        textColor: AppColors.greyColor,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.bookmark, color: AppColors.greyColor),
                      SizedBox(width: 5),
                      AppText(
                        text: '10 Saved',
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        textColor: AppColors.greyColor,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const AppText(
                text: 'Leave a comment',
                fontSize: 16,
                fontWeight: FontWeight.w600,
                textColor: Colors.black,
              ),
              const SizedBox(height: 15),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    const Expanded(
                      child: CustomTextFormField(
                        borderColor: Colors.transparent,
                        hintText: 'Say something...',
                      ),
                    ),
                    const SizedBox(width: 7),
                    GestureDetector(
                      onTap: () {
                        // Add your send comment logic here
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 15),
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Row(
                          children: [
                            Icon(Icons.send, color: Colors.white, size: 18),
                            SizedBox(width: 5),
                            AppText(
                              text: 'Send',
                              textColor: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                height: MediaQuery.of(context).size.height * .62,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: reviews.length,
                  itemBuilder: (context, index) {
                    final review = reviews[index];
                    return ReviewsContainer(
                      userName: review['userName'],
                      userHandle: review['userHandle'],
                      reviewText: review['reviewText'],
                      upvotes: review['upvotes'],
                      downvotes: review['downvotes'],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
