import 'package:edu_admit/views/auth_screens/sign_up_screen.dart';
import 'package:edu_admit/views/starting_pages/starting_page_one.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    super.initState();
    Future.delayed( const Duration(seconds: 2),(){
Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const SignUpScreen()),);
    });


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF43C3E),
      body: Center(
          child: Image.asset('assets/icons/edu_admit.png')
      ),
    );
  }
}
