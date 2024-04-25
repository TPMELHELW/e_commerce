import 'package:e_commerce/common/screen/verify_screen.dart';
import 'package:e_commerce/common/widget/button_widget.dart';
import 'package:e_commerce/features/authentication/screens/login_screen/login_screen.dart';
import 'package:e_commerce/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              AppTexts.forgetPasswordTitle,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              AppTexts.forgetPasswordSubTitle,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: const InputDecoration(
                  labelText: AppTexts.email,
                  prefixIcon: Icon(Iconsax.direct_right)),
            ),
            const SizedBox(
              height: 10,
            ),
            ButtonWidget(
              text: AppTexts.tContinue,
              onPress: () => Get.off(
                VerifyScreen(
                  title: AppTexts.changeYourPasswordTitle,
                  subTitle: AppTexts.changeYourPasswordSubTitle,
                  onPress: () => Get.to(() => const LoginScreen()),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
