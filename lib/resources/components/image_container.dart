import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
  final double height;

  final double radius;
  final String image;
  final VoidCallback onPress;
  const ImageContainer({
    super.key,
    required this.height,
    required this.radius,
    required this.image,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Padding(
        padding: const EdgeInsets.only(left: 20, top: 5, bottom: 5),
        child: Container(
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            border: Border.all(
              color: const Color(0xffD8D8D8), // Color of the border
              width: 0, // Width of the border
            ),
            color: const Color(0xffF43C3E),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(image),
            ],
          ),
        ),
      ),
    );
  }
}
