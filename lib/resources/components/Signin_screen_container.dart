import 'package:flutter/material.dart';

class SigninScreenContainer extends StatelessWidget {
  final String title;
  final Icon icon;
  final bool obscure;
  final TextEditingController controller;

  const SigninScreenContainer({
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
      padding: const EdgeInsets.only(left: 34, right: 34),
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
                  borderSide: const BorderSide(color: Color(0xffF43C3E)),
                  borderRadius: BorderRadius.circular(16)),
              enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color(0xffD8D8D8)),
                  borderRadius: BorderRadius.circular(16))),
        ),
      ),
    );
  }
}
