import 'package:e_commerce/features/authentication/models/on_boarding/on_boarding_data.dart';
import 'package:e_commerce/features/authentication/screens/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingController extends GetxController {
  final PageController pageController = PageController();
  int currentPage = 0;

  void onChangeIndex(int index) {
    currentPage = index;
  }

  void nextPage() {
    if (onBoardingData.length == currentPage + 1) {
      Get.delete<OnBoardingController>();
      Get.offAll(() => const LoginScreen());
    } else {
      pageController.animateToPage(currentPage + 1,
          duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
    }
  }

  void skipPages() {
    pageController.animateToPage(onBoardingData.length - 1,
        duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
  }
}
