import 'package:e_commerce/common/screen/success_screen.dart';
import 'package:e_commerce/common/screen/verify_screen.dart';
import 'package:e_commerce/common/widget/button_widget.dart';
// import 'package:e_commerce/features/authentication/screens/signup_screen/verify_screen.dart';
import 'package:e_commerce/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SignupFormWidget extends StatelessWidget {
  const SignupFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.user),
                    labelText: AppTexts.firstName,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.user),
                    labelText: AppTexts.lastName,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.user_edit),
              labelText: AppTexts.username,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
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
              prefixIcon: Icon(Iconsax.call),
              labelText: AppTexts.phoneNo,
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
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Checkbox(value: true, onChanged: (val) {}),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                        text: '${AppTexts.iAgreeTo} ',
                        style: Theme.of(context).textTheme.bodySmall),
                    TextSpan(
                        text: '${AppTexts.privacyPolicy} ',
                        style: Theme.of(context).textTheme.bodyMedium!.apply(
                              decoration: TextDecoration.underline,
                            )),
                    TextSpan(
                        text: '${AppTexts.and} ',
                        style: Theme.of(context).textTheme.bodySmall),
                    TextSpan(
                      text: AppTexts.termsOfUse,
                      style: Theme.of(context).textTheme.bodyMedium!.apply(
                            decoration: TextDecoration.underline,
                          ),
                    )
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          ButtonWidget(
            onPress: () => Get.to(
              () =>  VerifyScreen(
                title: AppTexts.confirmEmail,
                subTitle: AppTexts.confirmEmailSubTitle,
                onPress: ()=> Get.to(() => const SuccessScreen()),
              ),
            ),
            text: AppTexts.createAccount,
          ),
          const SizedBox(
            height: 25,
          ),
        ],
      ),
    );
  }
}
