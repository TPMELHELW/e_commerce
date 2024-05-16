import 'package:e_commerce/common/widget/custom_outline_button_widget.dart';
import 'package:e_commerce/features/authentication/screens/login_screen/login_screen.dart';
import 'package:e_commerce/features/personalization/models/settings_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsScreenBodyWidget extends StatelessWidget {
  const SettingsScreenBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Account Settings',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          ...List.generate(
            accountSettingsData.length,
            (index) => ListTile(
              onTap: () {},
              title: Text(
                accountSettingsData[index].title,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              subtitle: Text(
                accountSettingsData[index].subTitle,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              leading: accountSettingsData[index].icon,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'App Settings',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          ...List.generate(
            appSettingsData.length,
            (index) => ListTile(
              onTap: () {},
              title: Text(
                appSettingsData[index].title,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              subtitle: Text(
                appSettingsData[index].subTitle,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              leading: appSettingsData[index].icon,
              trailing: appSettingsData[index].trailing,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          CustomOutlineButtonWidget(
            text: 'Logout',
            onPress: () async {
              await FirebaseAuth.instance.signOut();
              Get.offAll(() => const LoginScreen());
            },
          )
        ],
      ),
    );
  }
}
