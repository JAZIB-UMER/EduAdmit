import 'package:edu_admit/utils/colors.dart';
import 'package:flutter/material.dart';

class SignInScreenContainer extends StatelessWidget {
  final String title;
  final Icon icon;
  final bool obscure;
  final TextEditingController controller;

  const SignInScreenContainer({
    super.key,
    required this.title,
    required this.icon,
    required this.controller,
    required this.obscure,
  });

  @override
  Widget build(BuildContext context) {
    dynamic height = MediaQuery.of(context).size.height;
    dynamic width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.05,
      ),
      child: SizedBox(
        height: height * 0.09,
        width: width * 0.84,
        child: TextFormField(
          controller: controller,
          obscureText: obscure,
          decoration: InputDecoration(
              hintText: title,
              labelText: title,
              prefixIcon: icon,
              hintStyle: const TextStyle(fontSize: 15),
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: appThemeColor),
                  borderRadius: BorderRadius.circular(16)),
              enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color(0xffD8D8D8)),
                  borderRadius: BorderRadius.circular(16))),
        ),
      ),
    );
  }
}
