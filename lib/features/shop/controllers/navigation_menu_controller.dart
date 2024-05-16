import 'package:e_commerce/features/personalization/screens/settings_screen/settings_screen.dart';
import 'package:e_commerce/features/shop/screens/favourite_product_screen/favourite_screen.dart';
import 'package:e_commerce/features/shop/screens/home_screen/home_screen.dart';
import 'package:e_commerce/features/shop/screens/store_screen/store_screen.dart';
import 'package:get/get.dart';

class NavigationBarController extends GetxController {
  final Rx<int> currentIndex = 0.obs;

  void onSelect(index) {
    currentIndex.value = index;
  }

  final screens = [
    const HomeScreen(),
    const StoreScreen(),
    const FavouriteScreen(),
    const SettingsScreen(),
  ];
}
