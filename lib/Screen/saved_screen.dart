import 'package:flutter/material.dart';
import 'package:food_recipes/Controler/home_controller.dart';
import 'package:food_recipes/Widgets/app_text.dart';

import 'package:get/get.dart';

import '../App Assets/app_assets.dart';
import '../Routes/route_name.dart';
import '../Widgets/saved_container.dart';

class SavedScreen extends StatefulWidget {
  const SavedScreen({super.key});

  @override
  State<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  final HomeScreenController controller = Get.put(HomeScreenController());

  final List<Map<String, dynamic>> savedItems = [
    {
      'imagePath': AppAssets.saveItem,
      'rating': 4.5,
      'title': 'Traditional Burger with Fries',
      'chefName': 'Chef Subhan khan',
      'cookingTime': '20 mins',
    },
    {
      'imagePath': AppAssets.biryaniImage,
      'rating': 4.8,
      'title': 'Chicken Biryani',
      'chefName': 'Chef Fahad Farooq',
      'cookingTime': '15 mins',
    },
    {
      'imagePath': AppAssets.shawarmaImage,
      'rating': 4.8,
      'title': 'Spicy Chicken Shawarma',
      'chefName': 'Chef Umer Farooq',
      'cookingTime': '5 mins',
    },
    {
      'imagePath': AppAssets.biryaniImage,
      'rating': 4.8,
      'title': 'Chicken Biryani',
      'chefName': 'Chef Fahad Farooq',
      'cookingTime': '15 mins',
    },
    {
      'imagePath': AppAssets.shawarmaImage,
      'rating': 4.8,
      'title': 'Spicy Chicken Shawarma',
      'chefName': 'Chef Umer Farooq',
      'cookingTime': '5 mins',
    },
  ];

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const AppText(
          text: 'Saved Recipies',
          fontSize: 18,
          textColor: Colors.black,
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: savedItems.length,
        itemBuilder: (context, index) {
          final item = savedItems[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: GestureDetector(
              onTap: () {
                // Pass the item data to ItemDetailScreen
                Get.toNamed(
                  RouteName.itemDetailScreen,
                  arguments: item,
                );
              },
              child: SavedContainer(
                imagePath: item['imagePath'],
                rating: item['rating'],
                title: item['title'],
                chefName: item['chefName'],
                cookingTime: item['cookingTime'],
              ),
            ),
          );
        },
      ),
    );
  }
}
