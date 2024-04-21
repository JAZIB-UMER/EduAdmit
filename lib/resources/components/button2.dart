import 'package:flutter/material.dart';

class Button2 extends StatelessWidget {
  final double height;
  final double width;
  final double radius;
  final String title;
  final String image;
  final VoidCallback onPress;
  const Button2({super.key,
    required this.height,
    required this.width,
    required this.radius,
    required this.title,
    required this.image,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          border: Border.all(
            color: const Color(0xffD8D8D8), // Color of the border
            width: 2, // Width of the border
          ),
          color: const Color(0xffFFFFFF),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Image.asset(image),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Text(title,style: const TextStyle(color: Colors.black,fontWeight: FontWeight.w700),),
            ),
          ],
        ),
      ),
    );
  }
}
