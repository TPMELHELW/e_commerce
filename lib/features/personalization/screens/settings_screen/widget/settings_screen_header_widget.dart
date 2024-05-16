import 'package:e_commerce/features/personalization/controller/user_controller.dart';
import 'package:e_commerce/features/personalization/screens/profile_screen/profile_screen.dart';
import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SettingsScreenHeaderWidget extends StatelessWidget {
  const SettingsScreenHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Text(
              // textAlign: TextAlign.left,
              'Account',
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .apply(color: Colors.white),
            ),
          ),
          ListTile(
            leading: CircleAvatar(
              child: Image.asset(AppImages.user),
            ),
            title: Text(
              controller.user.value.firstName,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .apply(color: Colors.white),
            ),
            subtitle: Text(
              controller.user.value.email,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .apply(color: Colors.white),
            ),
            trailing: IconButton(
              onPressed: () => Get.to(() => const ProfileScreen()),
              icon: const Icon(
                Iconsax.edit,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
