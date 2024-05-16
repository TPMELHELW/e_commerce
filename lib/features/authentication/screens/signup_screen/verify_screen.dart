import 'package:e_commerce/common/widget/button_widget.dart';
import 'package:e_commerce/features/authentication/controllers/verification_controller.dart';
import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:e_commerce/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyScreen extends StatelessWidget {
  final String email;
  const VerifyScreen({
    super.key,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    VerificationController controller = Get.put(VerificationController());
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
            AppTexts.confirmEmail,
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
            AppTexts.confirmEmailSubTitle,
            style: Theme.of(context).textTheme.labelMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 25,
          ),
          ButtonWidget(
            onPress: () => controller.checkEmailVerification(),
            text: AppTexts.tContinue,
          ),
          TextButton(
            onPressed: () => controller.sendEmailVerification(),
            child: const Text(
              AppTexts.resendEmail,
            ),
          )
        ],
      ),
    );
  }
}
