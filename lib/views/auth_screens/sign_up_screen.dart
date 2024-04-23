import 'package:edu_admit/resources/components/button.dart';
import 'package:edu_admit/resources/components/Signin_screen_container.dart';
import 'package:edu_admit/services/auth_services/firebase_services.dart';
import 'package:edu_admit/services/auth_services/shared_pref_services.dart';
import 'package:edu_admit/utils/utilities.dart';
import 'package:edu_admit/view_model/auth_view_model.dart';
import 'package:edu_admit/views/main_screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../resources/components/button2.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final FireBaseServices _myRepo = FireBaseServices();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final object = Get.put(AuthViewModel());

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _userNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    dynamic height = MediaQuery.of(context).size.height;
    dynamic width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
            SigninScreenContainer(
              controller: _userNameController,
              title: 'Username',
              icon: Icon(Icons.person_2_outlined),
            ),
            const SizedBox(height: 5),
            SigninScreenContainer(
              title: 'Email',
              icon: Icon(Icons.email_outlined),
              controller: _emailController,
            ),
            const SizedBox(height: 5),
            SigninScreenContainer(
              title: 'Password( at least 8 character )',
              icon: Icon(Icons.lock_open_outlined),
              controller: _passwordController,
            ),
            const SizedBox(height: 25),
            Obx(() => Button(
                  loading: object.loading.value,
                  height: height * 0.07,
                  width: width * 0.84,
                  title: 'Sign in',
                  radius: 16,
                  onPress: () async {
                    if (_userNameController.text.isEmpty) {
                      Utils.flushBarErrorMessage(
                          'Username is missing', Colors.red, context);
                    } else if (_emailController.text.isEmpty) {
                      Utils.flushBarErrorMessage(
                          'Email is missing', Colors.red, context);
                    } else if (_passwordController.text.isEmpty) {
                      Utils.flushBarErrorMessage(
                          'Password is missing', Colors.red, context);
                    } else if (_passwordController.text.length < 8) {
                      Utils.flushBarErrorMessage(
                          'Password length is short', Colors.red, context);
                    } else {
                      object.setLoading(true);
                      await _myRepo
                          .signUp(
                              context,
                              _emailController.text,
                              _passwordController.text,
                              _userNameController.text)
                          .then((value) async {
                        await SharedPreferencesHelper()
                            .setData(_userNameController.text.toString());
                        _emailController.clear();
                        _passwordController.clear();
                        _userNameController.clear();

                        object.setLoading(false);
                        Get.off(MainScreen());
                      }).onError((error, stackTrace) {
                        object.setLoading(false);
                        Utils.flushBarErrorMessage(
                            error.toString(), Colors.red, context);
                      });
                    }
                  },
                )),
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
                image: 'assets/icons/google.png'),
            const SizedBox(height: 24),
            Button2(
                height: height * 0.07,
                width: width * 0.84,
                title: 'Sign in with Facebook',
                radius: 16,
                onPress: () {},
                image: 'assets/icons/facebook.png'),
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
      ),
    );
  }
}
