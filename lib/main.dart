import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'Routes/screen_rountes.dart';
import 'Screen/onborading.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Food Aplication',
      theme: ThemeData(
        fontFamily: 'Raleway',
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      getPages: AppRoutes.appRoutes(),
      home: const Onboarding(),
    );
  }
}
