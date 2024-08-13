import 'package:flutter/material.dart';
import '../Widgets/color.dart';
import 'home_screen.dart';
import 'notifications_screen.dart';
import 'profile.dart';
import 'saved_screen.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  const BottomNavigationBarScreen({super.key});

  @override
  State<BottomNavigationBarScreen> createState() =>
      _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen> {
  int _bottomNavIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const SavedScreen(),
    const NotificationsScreen(),
    const ProfileScreen(),
    // Add other screens here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: _screens[_bottomNavIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors.primaryColor,
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: const Icon(Icons.add, color: Colors.white, size: 30),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        color: Colors.white,
        elevation: 8,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: IconButton(
                icon: Icon(Icons.home_filled,
                    size: 35,
                    color: _bottomNavIndex == 0
                        ? AppColors.primaryColor
                        : AppColors.blackColor),
                onPressed: () {
                  setState(() {
                    _bottomNavIndex = 0;
                  });
                },
              ),
            ),
            Expanded(
              child: IconButton(
                icon: Icon(Icons.bookmark_border_outlined,
                    size: 35,
                    color: _bottomNavIndex == 1
                        ? AppColors.primaryColor
                        : AppColors.blackColor),
                onPressed: () {
                  setState(() {
                    _bottomNavIndex = 1;
                  });
                },
              ),
            ),
            const SizedBox(width: 40),
            Expanded(
              child: IconButton(
                icon: Icon(Icons.notifications_outlined,
                    size: 35,
                    color: _bottomNavIndex == 2
                        ? AppColors.primaryColor
                        : AppColors.blackColor),
                onPressed: () {
                  setState(() {
                    _bottomNavIndex = 2;
                  });
                },
              ),
            ),
            Expanded(
              child: IconButton(
                icon: Icon(Icons.person_outline_outlined,
                    size: 35,
                    color: _bottomNavIndex == 3
                        ? AppColors.primaryColor
                        : AppColors.blackColor),
                onPressed: () {
                  setState(() {
                    _bottomNavIndex = 3;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
