import 'package:flutter/material.dart';
import 'package:food_recipes/App%20Assets/app_assets.dart';
import 'package:food_recipes/NotificationTabContent/read.dart';
import 'package:food_recipes/Screen/reviews_screen.dart';
import 'package:food_recipes/Widgets/appbar.dart';
import 'package:get/get.dart';

import '../Controler/notifications_screen_controller.dart';
import '../NotificationTabContent/all.dart';
import '../Widgets/color.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  List<String> profileType = [
    "All",
    "Read",
    "Reviews Screen",
  ];
  final NotificationsController controller = Get.put(NotificationsController());
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          backgroundColor: AppColors.whiteColor,
          resizeToAvoidBottomInset: false,
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Appbar(
                  title: 'Notifications',
                  subtitle: 'Stay updated with the latest alerts',
                  profileImage: AppAssets.profileIcon,
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
                        labelPadding: const EdgeInsets.symmetric(horizontal: 0),
                        onTap: (index) {
                          controller.changeTabIndex(index);
                        },
                        tabs: profileType.map<Widget>((type) {
                          return Tab(
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () {
                                  controller.changeTabIndex(
                                      profileType.indexOf(type));
                                },
                                child: Container(
                                  height: 35,
                                  padding: const EdgeInsets.all(2),
                                  width: 100,
                                  decoration: BoxDecoration(
                                    color: controller.selectedIndex ==
                                            profileType.indexOf(type)
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
                                                      profileType.indexOf(type)
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
                        return const All();
                      case 1:
                        return const Read();

                      case 2:
                        return const ReviewsScreen();

                      default:
                        return const SizedBox.shrink();
                    }
                  }),
                ),
              ],
            ),
          )),
    );
  }
}
