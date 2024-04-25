import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';

class SocialWidget extends StatelessWidget {
  const SocialWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          AppImages.google,
          width: 24,
          height: 24,
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
