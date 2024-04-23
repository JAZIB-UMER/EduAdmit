import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final double height;
  final double width;
  final double radius;
  final String title;
  final VoidCallback onPress;
  final bool loading;
  const Button({
    super.key,
    required this.height,
    required this.width,
    required this.radius,
    required this.title,
    required this.onPress,
    required this.loading,
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
          color: const Color(0xffF43C3E),
        ),
        child: Center(
            child: loading
                ? const CircularProgressIndicator(
                    color: Colors.white,
                  )
                : Text(
                    title,
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  )),
      ),
    );
  }
}
