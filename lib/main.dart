import 'package:edu_admit/views/splash_screen/splash_screen.dart';
import 'package:edu_admit/views/starting_screen/startingScreen.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(themeMode: ThemeMode.system, home: SplashScreen());
  }
}
