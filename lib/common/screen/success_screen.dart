import 'package:e_commerce/common/widget/button_widget.dart';
import 'package:e_commerce/features/authentication/screens/login_screen/login_screen.dart';
import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:e_commerce/utils/constants/text_strings.dart';
import 'package:e_commerce/utils/function/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
          children: [
            Image.asset(
              AppImages.staticSuccessIllustration,
              height: 200,
            ),
            const SizedBox(
              height: 25,
            ),
            Text(
              AppTexts.yourAccountCreatedTitle,
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              AppTexts.yourAccountCreatedSubTitle,
              style: Theme.of(context).textTheme.labelMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 25,
            ),
            ButtonWidget(
              onPress: () {
                Get.offAll(() => const LoginScreen());

                showSuccessSnackbar(
                    'Success', 'Your Account has been verified');
              },
              text: AppTexts.tContinue,
            )
          ],
        ),
      ),
    );
  }
}
