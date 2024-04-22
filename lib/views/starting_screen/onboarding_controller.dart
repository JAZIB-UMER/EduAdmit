import 'package:flutter/cupertino.dart';

import 'package:get/get.dart';
//import 'package:get/get_rx/get_rx.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  // Variables
  static final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;

  // Update Current Index When Page Scroll
  void updatePageIndicator(index) => currentPageIndex.value = index;

  // Jump To Specific Dot Selected Page
  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.jumpTo(index);
  }
}
