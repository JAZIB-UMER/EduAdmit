import 'dart:ui';

import 'package:edu_admit/services/auth_services/firebase_services.dart';
import 'package:edu_admit/services/auth_services/shared_pref_services.dart';
import 'package:edu_admit/utils/colors.dart';

import 'package:edu_admit/utils/utilities.dart';
import 'package:edu_admit/view_model/auth_view_model.dart';
import 'package:edu_admit/views/auth_screens/forgot_pass_screen.dart';
import 'package:edu_admit/views/auth_screens/sign_up_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../resources/components/Signin_screen_container.dart';
import '../../resources/components/button.dart';
import '../main_screens/main_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //FirebaseAuth _auth = FirebaseAuth.instance;
  final FireBaseServices _firebaseservices = FireBaseServices();
  final object = Get.put(AuthViewModel());
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    dynamic height = MediaQuery.of(context).size.height;
    dynamic width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          SizedBox(height: height * 0.04),
          Image.asset('assets/icons/eduadmitlogo.png'),
          SignInScreenContainer(
            obscure: false,
            title: 'Email',
            icon: const Icon(Icons.person_2_outlined),
            controller: _emailController,
          ),
          SignInScreenContainer(
            obscure: true,
            title: 'Password',
            icon: const Icon(Icons.lock_open_outlined),
            controller: _passwordController,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Align(
              alignment: Alignment.topRight,
              child: TextButton(
                  onPressed: () {
                    Get.to(() => const ForgotPasswordScreen());
                  },
                  child: const Text(
                    "Forgot Password",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  )),
            ),
          ),
          Obx(() => Button(
                loading: object.loading.value,
                height: height * 0.07,
                width: width * 0.84,
                title: 'Login',
                radius: 16,
                onPress: () async {
                  if (_emailController.text.isEmpty) {
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
                    FocusScope.of(context).unfocus();
                    await _firebaseservices
                        .login(context, _emailController.text,
                            _passwordController.text)
                        .then((value) async {
                      _emailController.clear();
                      _passwordController.clear();

                      //-----
                      //fetching userdata
                      await SharedPreferencesHelper().fetchData();
                      object.setLoading(false);

                      Get.offAll(() => const MainScreen());
                    }).onError((error, stackTrace) {
                      object.setLoading(false);
                      Utils.flushBarErrorMessage(
                          error.toString(), Colors.red, context);
                    });
                  }
                },
              )),
          SizedBox(
            height: height * 0.09,
            width: width * 0.99,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an account?",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                ),
                TextButton(
                    onPressed: () {
                      Get.to(() => const SignUpScreen());
                    },
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: appThemeColor),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
