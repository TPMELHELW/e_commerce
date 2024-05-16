import 'package:e_commerce/common/widget/button_widget.dart';
import 'package:e_commerce/features/authentication/controllers/forget_password_controller.dart';
import 'package:e_commerce/features/authentication/screens/login_screen/login_screen.dart';
import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:e_commerce/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordScreen extends StatelessWidget {
  final String email;
  const ResetPasswordScreen({
    super.key,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    final controller = ForgetPasswordController.instance;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        children: [
          Image.asset(
            AppImages.deliveredEmailIllustration,
            height: 200,
          ),
          const SizedBox(
            height: 25,
          ),
          Text(
            AppTexts.changeYourPasswordTitle,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            email,
            style: Theme.of(context).textTheme.labelLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            AppTexts.changeYourPasswordSubTitle,
            style: Theme.of(context).textTheme.labelMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 25,
          ),
          ButtonWidget(
            onPress: () => Get.offAll(() => const LoginScreen()),
            text: AppTexts.tContinue,
          ),
          TextButton(
            onPressed: () => controller.resendPasswordReset(email),
            child: const Text(
              AppTexts.resendEmail,
            ),
          )
        ],
      ),
    );
  }
}
