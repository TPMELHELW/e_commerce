import 'package:e_commerce/common/widget/button_widget.dart';
import 'package:e_commerce/features/personalization/controller/user_controller.dart';
import 'package:e_commerce/features/personalization/screens/profile_screen/widget/settings_information_widget.dart';
import 'package:e_commerce/features/personalization/screens/profile_screen/widget/update_user_detail_widget.dart';
import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile Settings',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        children: [
          Image.asset(
            AppImages.user,
            height: 100,
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'Change Profile Picture',
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Profile Information',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          SettingsInformationWidget(
            leading: 'Name',
            title: controller.user.value.firstName,
            onPress: () => Get.to(() => const UpdateUserDetailWidget()),
          ),
          SettingsInformationWidget(
            leading: 'Username',
            title: controller.user.value.userName,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Personal Information',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SettingsInformationWidget(
            leading: 'User ID',
            title: '12345',
          ),
          SettingsInformationWidget(
            leading: 'E-mail',
            title: controller.user.value.email,
          ),
          const SettingsInformationWidget(
            leading: 'Gender',
            title: 'Male',
          ),
          const SettingsInformationWidget(
            leading: 'Date of Birth',
            title: '10 OCT,2005',
          ),
          ButtonWidget(
            text: "Delete Account",
            onPress: () => controller.showEnsureDeleteAccount(),
          )
        ],
      ),
    );
  }
}
