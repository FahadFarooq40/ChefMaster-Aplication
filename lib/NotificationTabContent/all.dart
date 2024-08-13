import 'package:flutter/material.dart';

import '../App Assets/app_assets.dart';
import '../Widgets/app_text.dart';
import '../Widgets/notificationContainer.dart';

class All extends StatefulWidget {
  const All({super.key});

  @override
  State<All> createState() => _AllState();
}

class _AllState extends State<All> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          const AppText(
            text: 'Today',
            fontSize: 15,
            textColor: Colors.black,
          ),
          ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: 2,
              itemBuilder: (index, context) {
                return const NotificationContainer(
                  title: 'New Recipe Alert!',
                  message:
                      'Check out this amazing new recipe that you’ll love.',
                  timeAgo: '5 mins ago',
                  iconPath: AppAssets.fileIcon,
                );
              }),
          const AppText(
            text: 'Yesterday',
            fontSize: 15,
            textColor: Colors.black,
          ),
          ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: 3,
              itemBuilder: (index, context) {
                return const NotificationContainer(
                  title: 'Cooking Tip of the Day!',
                  message:
                      'Learn how to perfectly season your dishes with this simple trick.',
                  timeAgo: '15 mins ago',
                  iconPath: AppAssets.fileIcon,
                );
              }),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
