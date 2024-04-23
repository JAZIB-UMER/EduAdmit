import 'package:edu_admit/views/auth_screens/sign_up_screen.dart';
import 'package:edu_admit/views/splash_screen/splash_services.dart';
import 'package:edu_admit/views/starting_screen/startingScreen.dart';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices _splashServices = SplashServices();
  @override
  void initState() {
    super.initState();
    _splashServices.isLogin(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF43C3E),
      body: Center(child: Image.asset('assets/icons/edu_admit.png')),
    );
  }
}
