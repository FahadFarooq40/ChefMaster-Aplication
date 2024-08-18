import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import '../Controler/item_detail_controller.dart';
import '../Widgets/app_text.dart';
import '../Widgets/color.dart';
import '../Widgets/custom_button.dart';
import '../Widgets/custom_popup_menu.dart';
import '../Widgets/reviews_container.dart';
import '../App Assets/app_assets.dart';
import '../Widgets/saved_container.dart';
import '../tab/all_tab.dart';

class ItemDetailScreen extends StatefulWidget {
  const ItemDetailScreen({super.key});

  @override
  State<ItemDetailScreen> createState() => _ItemDetailScreenState();
}

class _ItemDetailScreenState extends State<ItemDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? item = Get.arguments as Map<String, dynamic>?;

    if (item == null) {
      return const Scaffold(
        body: Center(
          child: Text('No item data found'),
        ),
      );
    }

    final ItemDetailScreenController controller =
        Get.put(ItemDetailScreenController());
    List<String> detailType = ["Ingrident", "Procedure"];
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        appBar: AppBar(
          actions: const [
            CustomPopupMenu(),
          ],
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SavedContainer(
                  imagePath: item['imagePath'] ?? '',
                  rating: item['rating'] ?? 0.0,
                  title: item['title'] ?? '',
                  chefName: item['chefName'] ?? '',
                  cookingTime: item['cookingTime'] ?? '',
                ),
                const SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: AppText(
                        text: item['title'] ?? 'No Title',
                        textColor: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                    AppText(
                      text: item['reviews'] != null
                          ? '(${item['reviews']} Reviews)'
                          : '(No Reviews)',
                      textColor: AppColors.greyColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          AppAssets.profilePhoto,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            text: item['chefName'] ?? 'Chef Name',
                            fontSize: 15,
                            textColor: Colors.black,
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(AppAssets.locationIcon),
                              const SizedBox(width: 5),
                              AppText(
                                text: item['location'] ?? 'Karachi, Pakistan',
                                fontSize: 11,
                                textColor: AppColors.greyColor,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const CustomButton(
                      label: 'Saved Recipe',
                      width: 85,
                      height: 37,
                      fontSize: 11,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const AppText(
                  text: 'All Categories',
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  textColor: Colors.black,
                ),
                const SizedBox(height: 20),
                Obx(() => Container(
                      width: MediaQuery.of(context).size.width,
                      height: 40,
                      child: TabBar(
                        // isScrollable: true,
                        dividerColor: Colors.transparent,
                        indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.transparent,
                        ),
                        labelPadding: EdgeInsets.symmetric(horizontal: 0),
                        onTap: (index) {
                          controller.changeTabIndex(index);
                        },
                        tabs: detailType.map<Widget>((type) {
                          return Tab(
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () {
                                  controller
                                      .changeTabIndex(detailType.indexOf(type));
                                },
                                child: Container(
                                  height: 35,
                                  padding: const EdgeInsets.all(2),
                                  width: MediaQuery.of(context).size.width * .5,
                                  decoration: BoxDecoration(
                                    color: controller.selectedIndex ==
                                            detailType.indexOf(type)
                                        ? AppColors.primaryColor
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      type,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge!
                                          .merge(
                                            TextStyle(
                                              color: controller.selectedIndex ==
                                                      detailType.indexOf(type)
                                                  ? Colors.white
                                                  : AppColors.primaryColor,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12,
                                            ),
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    )),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: Obx(() {
                    switch (controller.selectedIndex) {
                      case 0:
                        return const AllTab();
                      case 1:
                        return const ReviewsContainer(
                          userName: 'Fahad Farooq',
                          userHandle: '@fahadfarooq02',
                          reviewText:
                              'This recipe turned out great! The instructions were easy to follow, and the result was delicious.',
                          upvotes: 9,
                          downvotes: 1,
                        );
                      default:
                        return const SizedBox.shrink();
                    }
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
