import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'onboarding_controller.dart';

class StartingPageOne extends StatefulWidget {
  const StartingPageOne({super.key});

  @override
  State<StartingPageOne> createState() => _StartingPageOneState();
}

class _StartingPageOneState extends State<StartingPageOne> {
  @override
  Widget build(BuildContext context) {
    final control = Get.put(OnBoardingController());
    return Scaffold(
      body: PageView(
        controller: OnBoardingController.pageController,
        onPageChanged: control.updatePageIndicator,
        children: const [],
      ),
    );
  }
}
