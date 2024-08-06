import 'package:cached_network_image/cached_network_image.dart';
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
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        // padding: const EdgeInsets.symmetric(horizontal: 10),
        children: [
          Obx(() {
            final networkImage = controller.user.value.profilePicture;
            final image =
                networkImage.isNotEmpty ? networkImage : AppImages.user;
            return networkImage.isNotEmpty
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: CachedNetworkImage(
                      imageUrl: image,
                      fit: BoxFit.cover,
                      height: 80,
                      width: 80,
                      progressIndicatorBuilder: (context, i, index) =>
                          const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  )
                : Image.asset(AppImages.user);
          }),
          TextButton(
            onPressed: () async => await controller.uploadImage(),
            child: Text(
              'Change Profile Picture',
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Profile Information',
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center,
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
                textAlign: TextAlign.center,
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
          )
        ],
      ),
    );
  }
}
