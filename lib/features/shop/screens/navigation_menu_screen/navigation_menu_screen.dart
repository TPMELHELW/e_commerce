import 'package:e_commerce/features/shop/controllers/navigation_menu_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class NavigationMenuScreen extends StatelessWidget {
  const NavigationMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    NavigationBarController controller = Get.put(NavigationBarController());
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          elevation: 0,
          selectedIndex: controller.currentIndex.value,
          onDestinationSelected: controller.onSelect,
          destinations: const [
            NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
            NavigationDestination(icon: Icon(Iconsax.shop), label: 'Shop'),
            NavigationDestination(icon: Icon(Iconsax.heart), label: 'Heart'),
            NavigationDestination(icon: Icon(Iconsax.user), label: 'User'),
          ],
        ),
      ),
      body: Obx(
        () => controller.screens[controller.currentIndex.value],
      ),
    );
  }
}
