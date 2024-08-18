import 'package:flutter/material.dart';
import '../App Assets/app_assets.dart';

import 'package:get/get.dart';
import '../Routes/route_name.dart';
import '../Widgets/app_text.dart';
import '../Widgets/item_container.dart';
import '../Widgets/recipies_container.dart';

class AllTab extends StatelessWidget {
  const AllTab({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> items = [
      {
        'imagePath': AppAssets.foodImage,
        'time': '15 Mins',
        'rating': 4.5,
        'title': 'Classic Greek Salad',
      },
      {
        'imagePath': AppAssets.pizzaImage,
        'time': '20 Mins',
        'rating': 4.3,
        'title': 'Best Delicious Pizza',
      },
      {
        'imagePath': AppAssets.burgerImage,
        'time': '10 Mins',
        'rating': 4.8,
        'title': 'Classic Cheesy Burger',
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
                      padding: const EdgeInsets.only(right: 10),
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

            const SizedBox(height: 20),
            const AppText(
              text: 'New Recipes',
              fontWeight: FontWeight.w600,
              fontSize: 16,
              textColor: Colors.black,
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 127,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 7,
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
