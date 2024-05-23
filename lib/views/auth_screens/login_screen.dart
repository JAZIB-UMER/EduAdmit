import 'package:edu_admit/services/auth_services/firebase_services.dart';
import 'package:edu_admit/services/auth_services/shared_pref_services.dart';
import 'package:edu_admit/utils/colors.dart';

import 'package:edu_admit/utils/utilities.dart';
import 'package:edu_admit/view_model/auth_view_model.dart';
import 'package:edu_admit/views/auth_screens/sign_up_screen.dart';
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
          Image.asset('assets/icons/eduadmitlogo.png'),
          SigninScreenContainer(
            obscure: false,
            title: 'Email',
            icon: Icon(Icons.person_2_outlined),
            controller: _emailController,
          ),
          const SizedBox(height: 5),
          SigninScreenContainer(
            obscure: true,
            title: 'Password',
            icon: Icon(Icons.lock_open_outlined),
            controller: _passwordController,
          ),
          const SizedBox(height: 25),
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
                Text(
                  "Don't have an account?",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontWeight: FontWeight.normal),
                ),
                TextButton(
                    onPressed: () {
                      Get.to(() => const SignUpScreen());
                    },
                    child: Text(
                      "Sign Up",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: appThemeColor, fontWeight: FontWeight.bold),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
