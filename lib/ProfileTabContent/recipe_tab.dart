import 'package:flutter/material.dart';
import 'package:food_recipes/App%20Assets/app_assets.dart';
import 'package:food_recipes/Widgets/saved_container.dart';

class RecipeTab extends StatefulWidget {
  const RecipeTab({super.key});

  @override
  State<RecipeTab> createState() => _RecipeTabState();
}

class _RecipeTabState extends State<RecipeTab> {
  final List<Map<String, dynamic>> items = [
    {
      'imagePath': AppAssets.saveItem,
      'rating': 4.5,
      'title': 'Traditional Burger with Fries',
      'chefName': 'Chef Subhan Khan',
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
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return SavedContainer(
          imagePath: item['imagePath'],
          rating: item['rating'],
          title: item['title'],
          chefName: item['chefName'],
          cookingTime: item['cookingTime'],
        );
      },
    );
  }
}
