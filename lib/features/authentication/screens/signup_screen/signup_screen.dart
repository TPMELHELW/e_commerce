import 'package:e_commerce/common/widget/divider_widget.dart';
import 'package:e_commerce/common/widget/social_widget.dart';
import 'package:e_commerce/features/authentication/controllers/signup_controller.dart';
import 'package:e_commerce/features/authentication/screens/signup_screen/widget/signup_form_widget.dart';
import 'package:e_commerce/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpController());
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        children: [
          Text(
            AppTexts.signupTitle,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(
            height: 10,
          ),
          const SignupFormWidget(),
          const DividerWidget(
            text: AppTexts.orSignUpWith,
          ),
          const SizedBox(
            height: 10,
          ),
          const SocialWidget()
        ],
      ),
    );
  }
}
