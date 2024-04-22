import 'package:edu_admit/resources/components/button.dart';
import 'package:edu_admit/resources/components/Signin_screen_container.dart';
import 'package:edu_admit/views/main_screens/main_screen.dart';
import 'package:flutter/material.dart';

import '../../resources/components/button2.dart';

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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 80, right: 90),
            child: SizedBox(
                height: height * 0.06,
                width: width * 0.6,
                child: Text(
                  "Let's Get Started",
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(fontWeight: FontWeight.bold),
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 90),
            child: SizedBox(
                height: height * 0.07,
                width: width * 0.6,
                child: Text(
                  "Create an account to continue",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: const Color(0xffB3B3B3),
                      fontWeight: FontWeight.bold),
                )),
          ),
          const SigninScreenContainer(
            title: 'Username',
            icon: Icon(Icons.person_2_outlined),
          ),
          const SizedBox(height: 5),
          const SigninScreenContainer(
            title: 'Email',
            icon: Icon(Icons.email_outlined),
          ),
          const SizedBox(height: 5),
          const SigninScreenContainer(
            title: 'Password( at least 8 character )',
            icon: Icon(Icons.lock_open_outlined),
          ),
          const SizedBox(height: 25),
          Button(
              height: height * 0.07,
              width: width * 0.84,
              title: 'Sign in',
              radius: 16,
              onPress: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MainScreen()));
              }),
          const SizedBox(height: 24),
          SizedBox(
              height: height * 0.04,
              width: width * 0.84,
              child: const Image(
                  image: AssetImage(
                'assets/icons/orcontinuewith.png',
              ))),
          const SizedBox(height: 24),
          Button2(
              height: height * 0.07,
              width: width * 0.84,
              title: 'Sign in with Google',
              radius: 16,
              onPress: () {},
              image: 'assets/icons/Google.png'),
          const SizedBox(height: 24),
          Button2(
              height: height * 0.07,
              width: width * 0.84,
              title: 'Sign in with Facebook',
              radius: 16,
              onPress: () {},
              image: 'assets/icons/Facebook.png'),
          SizedBox(height: height * 0.01),
          SizedBox(
            height: height * 0.06,
            width: width * 0.99,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account?",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "Login",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: const Color(0xffF43C3E),
                          fontWeight: FontWeight.bold),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
