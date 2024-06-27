import 'dart:async';

import 'package:coinspace/view/auth/onboarding_screen.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  customInit() {
    Timer(
      const Duration(seconds: 2),
      () {
        Get.to(
          () => const OnBoardingScreen(),
          transition: Transition.rightToLeft,
        );
      },
    );
  }
}
