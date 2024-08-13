import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../App Assets/app_assets.dart';
import '../Routes/route_name.dart';
import '../Widgets/appbar.dart';
import '../Widgets/color.dart';
import '../Widgets/saved_container.dart';

class SavedScreen extends StatefulWidget {
  const SavedScreen({super.key});

  @override
  State<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  final TextEditingController _searchController = TextEditingController();
  // ignore: unused_field
  bool _isSearchFocused = false;

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
  ];

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Appbar(
                title: 'Saved recipes',
                subtitle: 'Your favorite recipes are stored here.',
                profileImage: AppAssets.profileIcon,
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _isSearchFocused = true;
                          });
                        },
                        child: Container(
                          height: 45,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.search,
                                color: Colors.grey,
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: TextFormField(
                                  cursorColor: Colors.grey,
                                  controller: _searchController,
                                  decoration: const InputDecoration(
                                    hintText: 'Search Your Food',
                                    border: InputBorder.none,
                                  ),
                                  onTap: () {
                                    setState(() {
                                      _isSearchFocused = true;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: _showFilterDialog,
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: const Icon(
                          Icons.filter_list,
                          color: AppColors.whiteColor,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Expanded(
                child: ListView.builder(
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
              ),
            ],
          ),
        ),
      ),
    );
  }

  void toggleTheme(bool isOn) {
    setState(() {
      Get.changeThemeMode(isOn ? ThemeMode.dark : ThemeMode.light);
    });
  }

  void _showFilterDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Filter'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CheckboxListTile(
                title: const Text('Indian'),
                value: false,
                onChanged: (value) {},
              ),
              CheckboxListTile(
                title: const Text('Italian'),
                value: false,
                onChanged: (value) {},
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
