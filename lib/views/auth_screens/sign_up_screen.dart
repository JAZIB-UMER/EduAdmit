import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    dynamic height = MediaQuery.of(context).size.height;
    dynamic width = MediaQuery.of(context).size.width;
    return Scaffold(
      body:Column(
        children: [

            Padding(
              padding: const EdgeInsets.only(top: 80,left: 30),
              child: SizedBox(
                  height: height * 0.4,
                  width: width * 0.3,
                  child: Text("Let's Get Started", style: Theme.of(context).textTheme.headlineMedium!.copyWith(),)),
            )
        ],
      ),
    );
  }
}
