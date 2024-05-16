import 'package:e_commerce/features/authentication/controllers/log_in_controller.dart';
import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SocialWidget extends StatelessWidget {
  const SocialWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = LogInController.instance;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () => controller.googleSignIn(),
          child: Image.asset(
            AppImages.google,
            width: 24,
            height: 24,
          ),
        ),
        const SizedBox(
          width: 30,
        ),
        Image.asset(
          AppImages.facebook,
          width: 24,
          height: 24,
        ),
      ],
    );
  }
}
