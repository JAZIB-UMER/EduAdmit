import 'package:flutter/material.dart';

class NameContainer extends StatelessWidget {
  final double height;
  final double width;
  final double radius;
  final String title;
  final Color colors;
  final Color textcolors;
  const NameContainer({super.key,
    required this.height,
    required this.width,
    required this.radius,
    required this.title,
    required this.colors,
    required this.textcolors,
  });

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),

        color:  colors,
      ),
      child: Center(child: Text(title, style: Theme.of(context)
          .textTheme.bodyMedium!.copyWith(color: textcolors,fontWeight: FontWeight.bold),)),
    );
  }
}
