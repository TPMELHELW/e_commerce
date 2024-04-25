import 'package:e_commerce/common/widget/button_widget.dart';
import 'package:e_commerce/features/authentication/screens/forget_password_screen/forget_password_screen.dart';
import 'package:e_commerce/features/authentication/screens/signup_screen/signup_screen.dart';
import 'package:e_commerce/features/shop/screens/navigation_menu_screen/navigation_menu_screen.dart';
import 'package:e_commerce/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class LoginFormWidget extends StatelessWidget {
  const LoginFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.direct_right),
              labelText: AppTexts.email,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.password_check),
              labelText: AppTexts.password,
              suffixIcon: Icon(Iconsax.eye_slash),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Checkbox(value: false, onChanged: (val) {}),
                  const Text(AppTexts.rememberMe),
                ],
              ),
              TextButton(
                onPressed: () => Get.to(() => const ForgetPasswordScreen()),
                child: const Text(AppTexts.forgetPassword),
              )
            ],
          ),
          ButtonWidget(
            text: AppTexts.signIn,
            onPress: () {
               Get.offAll(() => const NavigationMenuScreen());
            }
          ),
          const SizedBox(
            height: 10,
          ),
          OutlinedButton(
            onPressed: () {
              Get.to(() => const SignupScreen());
            },
            child: const Text(
              AppTexts.createAccount,
            ),
          )
        ],
      ),
    );
  }
}
