import 'package:flutter/material.dart';
import 'package:food_recipes/tab/italian_tab.dart';

import 'package:get/get.dart';

import '../App Assets/app_assets.dart';
import '../Controler/home_controller.dart';
import '../Widgets/app_text.dart';
import '../Widgets/appbar.dart';
import '../Widgets/color.dart';
import '../Widgets/recent_search_container.dart';
import '../tab/all_tab.dart';
import '../tab/asian_tab.dart';
import '../tab/chines_tab.dart';
import '../tab/indian_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  List<String> dishType = ["All", "Indian", "Italian", 'chines', 'Asian'];
  final HomeScreenController controller = Get.put(HomeScreenController());
  final TextEditingController _searchController = TextEditingController();
  bool _isSearchFocused = false;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final bool isTabletScreen = size.width >= 600;

    return DefaultTabController(
      length: 5,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.whiteColor,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Appbar(
                  title: 'Fahad Farooq',
                  subtitle: 'what are you cooking today?',
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
                                    onChanged: (value) {},
                                    onSaved: (value) {},
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            controller.showForgetPasswordBottomSheet(context);
                          });
                        },
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
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: _isSearchFocused
                      ? Padding(
                          padding: const EdgeInsets.all(
                              7.0), // Add padding around the entire column
                          child: Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(
                                    bottom:
                                        8.0), // Add margin below the container
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                height: 40,
                                child: Row(
                                  children: [
                                    const AppText(
                                      text: 'Recent Searches',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      textColor: Colors.black,
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.clear),
                                      onPressed: () {
                                        setState(() {
                                          _isSearchFocused = false;
                                          _searchController.clear();
                                        });
                                      },
                                    )
                                  ],
                                ),
                              ),
                              ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: 1,
                                  itemBuilder: (context, index) {
                                    // Swapped context and index
                                    return const RecentSearchContainer();
                                  }),
                            ],
                          ),
                        )
                      : Obx(
                          () => Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            height: 40,
                            child: TabBar(
                              dividerColor: Colors.transparent,
                              indicator: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.transparent,
                              ),
                              labelPadding:
                                  const EdgeInsets.symmetric(horizontal: 0),
                              onTap: (index) {
                                controller.changeTabIndex(index);
                              },
                              tabs: dishType.map<Widget>((type) {
                                return Tab(
                                  child: Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () {
                                        controller.changeTabIndex(
                                            dishType.indexOf(type));
                                      },
                                      child: Container(
                                        height: 35,
                                        padding: const EdgeInsets.all(2),
                                        width: isTabletScreen
                                            ? MediaQuery.of(context).size.width
                                            : 50,
                                        decoration: BoxDecoration(
                                          color: controller.selectedIndex ==
                                                  dishType.indexOf(type)
                                              ? AppColors.primaryColor
                                              : Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
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
                                                    color: controller
                                                                .selectedIndex ==
                                                            dishType
                                                                .indexOf(type)
                                                        ? Colors.white
                                                        : AppColors
                                                            .primaryColor,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: isTabletScreen
                                                        ? 25
                                                        : 15,
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
                          ),
                        ),
                ),
                _isSearchFocused
                    ? const Center()
                    : Expanded(
                        child: Obx(() {
                          switch (controller.selectedIndex) {
                            case 0:
                              return const AllTab();
                            case 1:
                              return const IndianTab();
                            case 2:
                              return const ItalianTab();
                            case 3:
                              return const chinesTab();
                            case 4:
                              return const AsianTab();
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
