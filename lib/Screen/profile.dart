import 'package:flutter/material.dart';
import 'package:food_recipes/ProfileTabContent/recipe_tab.dart';
import 'package:food_recipes/ProfileTabContent/tag_tab.dart';
import 'package:food_recipes/ProfileTabContent/vidieo-tab.dart';
import 'package:food_recipes/Widgets/custom_popup_menu.dart';

import 'package:get/get.dart';

import '../App Assets/app_assets.dart';
import '../Controler/profile_screen_controller.dart';
import '../Widgets/app_text.dart';
import '../Widgets/color.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List<String> profileType = ["Recipe", "Videos", "Tag"];
  final ProfileScreencontroller controller = Get.put(ProfileScreencontroller());
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final bool isTabletScreen = size.width >= 600;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            centerTitle: true,
            title: const AppText(
              text: 'Profile',
              textColor: Colors.black,
              fontSize: 18,
            ),
            actions: const [
              CustomPopupMenu(),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      decoration: const BoxDecoration(shape: BoxShape.circle),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset(
                          AppAssets.profilePhoto,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const Column(
                      children: [
                        AppText(
                          text: 'Recipe',
                          fontWeight: FontWeight.w400,
                          fontSize: 11,
                          textColor: AppColors.greyColor,
                        ),
                        AppText(
                          text: '4',
                          fontSize: 20,
                          textColor: Colors.black,
                        ),
                      ],
                    ),
                    const Column(
                      children: [
                        AppText(
                          text: 'Followers',
                          fontWeight: FontWeight.w400,
                          fontSize: 11,
                          textColor: AppColors.greyColor,
                        ),
                        AppText(
                          text: '2.5M',
                          fontSize: 20,
                          textColor: Colors.black,
                        ),
                      ],
                    ),
                    const Column(
                      children: [
                        AppText(
                          text: 'Following',
                          fontWeight: FontWeight.w400,
                          fontSize: 11,
                          textColor: AppColors.greyColor,
                        ),
                        AppText(
                          text: '259',
                          fontSize: 20,
                          textColor: Colors.black,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const AppText(
                  text: 'Afuwape Abiodun',
                  textColor: Colors.black,
                  fontSize: 16,
                ),
                const SizedBox(
                  height: 2,
                ),
                const AppText(
                  text: 'Chef',
                  textColor: Colors.grey,
                  fontSize: 11,
                  fontWeight: FontWeight.w400,
                ),
                const SizedBox(
                  height: 10,
                ),
                const AppText(
                  text: 'Private Chef \n'
                      'Passionate about food and life 🥘🍲🍝🍱\n'
                      'More...',
                  textColor: Colors.grey,
                  fontSize: 11,
                  fontWeight: FontWeight.w400,
                ),
                const SizedBox(
                  height: 20,
                ),
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
                                  width: isTabletScreen
                                      ? MediaQuery.of(context).size.width
                                      : 95,
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
                                              fontSize:
                                                  isTabletScreen ? 20 : 12,
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
                        return const RecipeTab();
                      case 1:
                        return const VideosTab();
                      case 2:
                        return const TagTab();
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
