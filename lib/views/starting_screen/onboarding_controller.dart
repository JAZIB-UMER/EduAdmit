import 'dart:async';

import 'package:edu_admit/views/auth_screens/sign_up_screen.dart';


import 'package:get/get.dart';


class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  final carouselCurrentIndex = 0.obs;

  void updatePageIndicator(index) {
    carouselCurrentIndex.value = index;
    if (carouselCurrentIndex.value == 3) {
      Timer(const Duration(seconds: 2),
          () => Get.offAll(() => const SignUpScreen()));
    }
  }
}
