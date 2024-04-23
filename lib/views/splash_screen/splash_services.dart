import 'dart:async';

import 'package:edu_admit/services/auth_services/shared_pref_services.dart';
import 'package:edu_admit/services/auth_services/user_id.dart';
import 'package:edu_admit/utils/utilities.dart';
import 'package:edu_admit/views/auth_screens/sign_up_screen.dart';
import 'package:edu_admit/views/main_screens/main_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashServices {
  void isLogin(BuildContext context) {
    final auth = FirebaseAuth.instance;

    final user = auth.currentUser;

    if (user != null) {
      SessionController().userId = user.uid.toString();
      Timer(const Duration(seconds: 3), () => Get.to(MainScreen()));
    } else {
      Timer(const Duration(seconds: 3), () => Get.to(SignUpScreen()));
    }
  }

  void logOut(BuildContext context) {
    final auth = FirebaseAuth.instance;
    auth.signOut().then((value) {
      SessionController().userId = '';
      SharedPreferencesHelper().clearPreferences();
    }).onError((error, stackTrace) {
      Utils.flushBarErrorMessage(error.toString(), Colors.red, context);
    });
  }
}
