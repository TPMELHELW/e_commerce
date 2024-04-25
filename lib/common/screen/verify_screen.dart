import 'package:e_commerce/common/widget/button_widget.dart';
import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:e_commerce/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

class VerifyScreen extends StatelessWidget {
  final String title, subTitle;
  final void Function()? onPress;
  const VerifyScreen(
      {super.key,
      // required this.image,
      required this.title,
      required this.subTitle, this.onPress});

  @override
  Widget build(BuildContext context) {
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
            title,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'professort47@gmail.com',
            style: Theme.of(context).textTheme.labelLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            subTitle,
            style: Theme.of(context).textTheme.labelMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 25,
          ),
          ButtonWidget(
            onPress: onPress,
            text: AppTexts.tContinue,
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              AppTexts.resendEmail,
            ),
          )
        ],
      ),
    );
  }
}
