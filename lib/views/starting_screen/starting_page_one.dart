import 'package:flutter/material.dart';

class StartingPageOne extends StatefulWidget {
  const StartingPageOne({super.key});

  @override
  State<StartingPageOne> createState() => _StartingPageOneState();
}

class _StartingPageOneState extends State<StartingPageOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/icons/bg-image.png'), // Replace 'background_image.jpg' with your image file
            fit: BoxFit.cover, // You can adjust the fit as per your requirement
          ),
        ),
      ),
    );
  }
}
