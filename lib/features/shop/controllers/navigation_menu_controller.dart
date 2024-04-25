import 'package:e_commerce/features/shop/screens/home_screen/home_screen.dart';
import 'package:e_commerce/features/shop/screens/store_screen/store_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class NavigationBarController extends GetxController {
  final Rx<int> currentIndex = 0.obs;

  void onSelect(index) {
    currentIndex.value = index;
  }

  final screens = [
    const HomeScreen(),
    const StoreScreen(),
    Container(
      color: Colors.red,
    ),
    Container(
      color: Colors.red,
    ),
  ];

  @override
  void onInit() {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.blue));
    super.onInit();
  }
}
