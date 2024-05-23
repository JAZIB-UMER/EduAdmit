import 'package:edu_admit/services/auth_services/shared_pref_services.dart';

import 'package:edu_admit/views/splash_screen/splash_screen.dart';

import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseMessaging.onBackgroundMessage(_fireBaseMessagingBackgroundHandler);

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp, // Allow only portrait orientation
  ]);
  final prefs = SharedPreferencesHelper();
  await prefs.init();
  runApp(const MyApp());
}

@pragma('vm:entry-point')
Future<void> _fireBaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        home: SplashScreen());
  }
}
