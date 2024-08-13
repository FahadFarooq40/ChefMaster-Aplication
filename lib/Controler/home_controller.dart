import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../Widgets/app_text.dart';
import '../Widgets/color.dart';
import '../Widgets/custom_button.dart';

class HomeScreenController extends GetxController {
  final RxInt _selectedIndex = 0.obs;

  int get selectedIndex => _selectedIndex.value;

  get tabController => null;

  void changeTabIndex(int index) {
    _selectedIndex.value = index;
  }

  // filter code
  List<RxBool> selectedTimes =
      List.generate(4, (index) => index == 0 ? true.obs : false.obs);

  void selectedTime(int index) {
    for (int i = 0; i < selectedTimes.length; i++) {
      if (i == index) {
        selectedTimes[i].value = true;
      } else {
        selectedTimes[i].value = false;
      }
    }
    update();
  }

  List<RxBool> selectedRates =
      List.generate(5, (index) => index == 0 ? true.obs : false.obs);

  void selectedRate(int index) {
    for (int i = 0; i < selectedRates.length; i++) {
      if (i == index) {
        selectedRates[i].value = true;
      } else {
        selectedRates[i].value = false;
      }
    }
    update();
  }

  List<RxBool> selectedCategories =
      List.generate(10, (index) => index == 0 ? true.obs : false.obs);

  void selectedCategory(int index) {
    for (int i = 0; i < selectedCategories.length; i++) {
      if (i == index) {
        selectedCategories[i].value = true;
      } else {
        selectedCategories[i].value = false;
      }
    }
    update();
  }

  void showForgetPasswordBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              height: 500,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                      child: AppText(
                    text: 'Filter Search',
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    textColor: Colors.black,
                  )),
                  const SizedBox(
                    height: 10,
                  ),
                  const AppText(
                    textAlign: TextAlign.left,
                    text: 'Time',
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    textColor: Colors.black,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Obx(() => Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: List.generate(
                          selectedTimes.length,
                          (index) => CustomButton(
                            backgroundColor: selectedTimes[index].value
                                ? AppColors.primaryColor
                                : Colors.transparent,
                            textColor: selectedTimes[index].value
                                ? Colors.white
                                : AppColors.primaryColor,
                            borderWidth: 1,
                            onTap: () {
                              selectedTime(index);
                            },
                            fontSize: 11,
                            label: index == 0
                                ? "All"
                                : [
                                    "Newest",
                                    "Oldest",
                                    "Popularity",
                                  ][index - 1],
                            height: 34,
                            width: 65,
                            borderColor: selectedTimes[index].value
                                ? Colors.transparent
                                : AppColors.primaryColor,
                          ),
                        ),
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  const AppText(
                    text: 'Rate',
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    textColor: Colors.black,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Obx(() => Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: List.generate(
                          selectedRates.length,
                          (index) => CustomButton(
                            backgroundColor: selectedRates[index].value
                                ? AppColors.primaryColor
                                : Colors.transparent,
                            textColor: selectedRates[index].value
                                ? Colors.white
                                : AppColors.primaryColor,
                            onTap: () {
                              selectedRate(index);
                            },
                            fontSize: 14,
                            label: index == 0
                                ? "5"
                                : ["4", "3", "2", "1"][index - 1],
                            spacing: 5,
                            icon: Icons.star,
                            iconSize: 15,
                            iconColor: selectedRates[index].value
                                ? Colors.white
                                : AppColors.primaryColor,
                            height: 34,
                            width: 65,
                            borderColor: selectedRates[index].value
                                ? Colors.transparent
                                : AppColors.primaryColor,
                            borderWidth: 1,
                          ),
                        ),
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  const AppText(
                    text: 'Category',
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    textColor: Colors.black,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Obx(() => Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: List.generate(
                          selectedCategories.length,
                          (index) => CustomButton(
                            backgroundColor: selectedCategories[index].value
                                ? AppColors.primaryColor
                                : Colors.transparent,
                            textColor: selectedCategories[index].value
                                ? Colors.white
                                : AppColors.primaryColor,
                            onTap: () {
                              selectedCategory(index);
                            },
                            fontSize: 10,
                            borderWidth: 1,
                            label: index == 0
                                ? "All"
                                : [
                                    "Cereal",
                                    "Vegetables",
                                    "Dinner",
                                    "Chinese",
                                    "Local Dish",
                                    "Fruit",
                                    "BreakFast",
                                    "Spanish",
                                    "Lunch",
                                  ][index - 1],
                            height: 34,
                            width: 65,
                            borderColor: selectedCategories[index].value
                                ? Colors.transparent
                                : AppColors.primaryColor,
                          ),
                        ),
                      )),
                  const Spacer(),
                  const Center(
                      child: CustomButton(
                    label: 'Filter',
                    height: 37,
                    width: 174,
                  )),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ));
      },
    );
  }
}
