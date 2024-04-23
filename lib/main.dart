import 'package:edu_admit/services/auth_services/shared_pref_services.dart';
import 'package:edu_admit/views/splash_screen/splash_screen.dart';
import 'package:edu_admit/views/starting_screen/startingScreen.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp, // Allow only portrait orientation
  ]);
  final prefs = SharedPreferencesHelper();
  await prefs.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(themeMode: ThemeMode.system, home: StartingScreen());
  }
}
