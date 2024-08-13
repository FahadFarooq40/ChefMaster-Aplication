import 'package:food_recipes/Routes/route_name.dart';
import 'package:get/get.dart';

import '../Screen/bottom_navigation_bar.dart';
import '../Screen/home_detail_screen.dart';
import '../Screen/home_screen.dart';
import '../Screen/item_detail_screen.dart';
import '../Screen/login_screen.dart';
import '../Screen/notifications_screen.dart';
import '../Screen/onborading.dart';
import '../Screen/profile.dart';
import '../Screen/reviews_screen.dart';
import '../Screen/saved_screen.dart';
import '../Screen/sign_up.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
          name: RouteName.splashScreen,
          page: () => const Onboarding(),
        ),
        GetPage(
          name: RouteName.loginscreen,
          page: () => const LoginScreen(),
        ),
        GetPage(
          name: RouteName.signUpScreen,
          page: () => const SigupScreen(),
        ),
        GetPage(
          name: RouteName.homeScreen,
          page: () => const HomeScreen(),
        ),
        GetPage(
          name: RouteName.bottomNavigationBar,
          page: () => const BottomNavigationBarScreen(),
        ),
        GetPage(
          name: RouteName.savedScreen,
          page: () => const SavedScreen(),
        ),
        GetPage(
          name: RouteName.itemDetailScreen,
          page: () => const ItemDetailScreen(),
        ),
        GetPage(
          name: RouteName.profileScreen,
          page: () => const ProfileScreen(),
        ),
        GetPage(
          name: RouteName.reviewsScreen,
          page: () => const ReviewsScreen(),
        ),
        GetPage(
          name: RouteName.homeDetailScreen,
          page: () => const HomeDetailScreen(),
        ),
        GetPage(
          name: RouteName.notificationsScreen,
          page: () => const NotificationsScreen(),
        ),
      ];
}
