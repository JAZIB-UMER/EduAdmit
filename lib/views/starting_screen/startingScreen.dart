import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StartingScreen extends StatelessWidget {
  const StartingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    dynamic height = MediaQuery.of(context).size.height;
    dynamic width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  'assets/icons/bg-image.png'), // Replace 'background_image.jpg' with your image file
              fit: BoxFit
                  .cover, // You can adjust the fit as per your requirement
            ),
          ),
        ),
        Container(
          height: height * 0.1,
          width: width * 0.8,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30), topLeft: Radius.circular(30))),
        ),
      ],
    ));
  }
}
