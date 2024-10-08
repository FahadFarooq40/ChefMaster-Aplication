import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:food_recipes/Screen/home_screen.dart';
import 'package:food_recipes/Screen/profile.dart';
import 'package:food_recipes/Screen/saved_screen.dart';
import 'package:food_recipes/Widgets/color.dart';

import 'notifications_screen.dart';

class BottomNavigationBar extends StatefulWidget {
  const BottomNavigationBar({super.key});

  @override
  State<BottomNavigationBar> createState() => _BottomNavigationBarState();
}

class _BottomNavigationBarState extends State<BottomNavigationBar> {
  int _bottomNavIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const SavedScreen(),
    const NotificationsScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: Container(
        width: 56.0, // Width and height should be equal to create a circle
        height: 56.0,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.primaryColor,
        ),
        child: FloatingActionButton(
          highlightElevation: 0.0,
          splashColor: Colors.transparent,
          onPressed: () {
            // Add your action for the floating action button
          },
          child: const Icon(Icons.add, color: Colors.white),
          backgroundColor:
              Colors.transparent, // Make the background color transparent
          elevation: 0, // Remove shadow
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        activeColor: AppColors.primaryColor,
        inactiveColor: AppColors.lightGreyColor,
        icons: const [
          Icons.home_outlined,
          Icons.save_alt_sharp,
          Icons.notifications_outlined,
          Icons.person_outline_outlined,
        ],
        activeIndex: _bottomNavIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.softEdge,
        onTap: (index) => setState(() => _bottomNavIndex = index),
      ),
      body: _screens[_bottomNavIndex],
    );
  }
}
