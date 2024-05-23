import 'dart:async';

import 'package:edu_admit/services/auth_services/firebase_services.dart';
import 'package:edu_admit/services/auth_services/shared_pref_services.dart';
import 'package:edu_admit/services/auth_services/user_id.dart';
import 'package:edu_admit/services/notifications/notification_services.dart';
import 'package:edu_admit/utils/utilities.dart';
import 'package:edu_admit/views/auth_screens/login_screen.dart';

import 'package:edu_admit/views/main_screens/main_screen.dart';
import 'package:edu_admit/views/starting_screen/startingScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashServices {
  void isLogin(BuildContext context) {
    final auth = FirebaseAuth.instance;

    final user = auth.currentUser;

    if (user != null) {
      SessionController().userId = user.uid.toString();
      Timer(
          const Duration(seconds: 3), () => Get.off(() => const MainScreen()));
    } else {
      Timer(const Duration(seconds: 3),
          () => Get.off(() => const StartingScreen()));
    }
  }

  void logOut(BuildContext context) {
    final auth = FirebaseAuth.instance;
    auth.signOut().then((value) async {
      SessionController().userId = '';
      SharedPreferencesHelper().clearPreferences();
      Get.offAll(() => const LoginScreen());
      String token = await NotificationServices().getDeviceToken();
      FireBaseServices().deleteDeviceToken(token);
    }).onError((error, stackTrace) {
      Utils.flushBarErrorMessage(error.toString(), Colors.red, context);
    });
  }
}
