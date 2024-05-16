import 'package:e_commerce/common/widget/divider_widget.dart';
import 'package:e_commerce/common/widget/social_widget.dart';
import 'package:e_commerce/features/authentication/controllers/log_in_controller.dart';
import 'package:e_commerce/features/authentication/screens/login_screen/widget/login_form_widget.dart';
import 'package:e_commerce/features/authentication/screens/login_screen/widget/login_header_widget.dart';
import 'package:e_commerce/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LogInController());
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        children: const [
          LoginHeaderWidget(),
          SizedBox(
            height: 20,
          ),
          LoginFormWidget(),
          SizedBox(
            height: 40,
          ),
          DividerWidget(
            text: AppTexts.orSignInWith,
          ),
          SizedBox(
            height: 20,
          ),
          SocialWidget()
        ],
      ),
    );
  }
}
