import 'package:flutter/material.dart';
import 'package:food_recipes/Widgets/item_container.dart';
import 'package:get/get.dart';

import '../App Assets/app_assets.dart';
import '../Routes/route_name.dart';
import '../Widgets/app_text.dart';
import '../Widgets/recipies_container.dart';

class IndianTab extends StatelessWidget {
  const IndianTab({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> items = [
      {
        'imagePath': AppAssets.thaliImage,
        'time': '15 Mins',
        'rating': 4.5,
        'title': 'Classic Indian Thali',
      },
      {
        'imagePath': AppAssets.samosaImage,
        'time': '20 Mins',
        'rating': 4.3,
        'title': 'Best Delicious Samosa',
      },
      {
        'imagePath': AppAssets.pakoraImage,
        'time': '10 Mins',
        'rating': 5.3,
        'title': 'Classic Spicy Pakoras',
      },
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            SizedBox(
              height: 231,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  return GestureDetector(
                    onTap: () {
                      // Pass the item data to ItemDetailScreen
                      Get.toNamed(
                        RouteName.homeDetailScreen,
                        arguments: item,
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: index == 0
                            ? 0
                            : 20, // Prevent extra padding at start
                        right: index == items.length - 1
                            ? 0
                            : 20, // Prevent extra padding at end
                      ),
                      child: ItemContainer(
                        imagePath: item['imagePath'],
                        time: item['time'],
                        rating: item['rating'],
                        title: item['title'],
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 20),

            // All Categories Section Title
            const AppText(
              text: 'All Categories',
              fontWeight: FontWeight.bold,
              fontSize: 17,
              textColor: Colors.black,
            ),

            const SizedBox(height: 10),

            // New Recipes List
            SizedBox(
              height: 127,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 2,
                itemBuilder: (context, index) {
                  return const Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: RecipiesContainer(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
