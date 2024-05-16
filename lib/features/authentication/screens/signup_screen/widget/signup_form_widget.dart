import 'package:e_commerce/common/widget/button_widget.dart';
import 'package:e_commerce/features/authentication/controllers/signup_controller.dart';
import 'package:e_commerce/utils/constants/text_strings.dart';
import 'package:e_commerce/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SignupFormWidget extends StatelessWidget {
  const SignupFormWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = SignUpController.instance;
    return Form(
      key: controller.formState,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  validator: (value) => AppFieldValidator.validateEmpty(
                      value, AppTexts.firstName),
                  controller: controller.firstName,
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
                  validator: (value) =>
                      AppFieldValidator.validateEmpty(value, AppTexts.lastName),
                  controller: controller.lastName,
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
            validator: (value) =>
                AppFieldValidator.validateEmpty(value, AppTexts.username),
            controller: controller.userName,
            decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.user_edit),
              labelText: AppTexts.username,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            validator: (val) => AppFieldValidator.validateEmail(val),
            controller: controller.email,
            decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.direct_right),
              labelText: AppTexts.email,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            validator: (value) => AppFieldValidator.validatePhoneNumber(value),
            controller: controller.phone,
            decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.call),
              labelText: AppTexts.phoneNo,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Obx(
            () => TextFormField(
              obscureText: controller.isHide.value,
              validator: (value) => AppFieldValidator.validatePassword(value),
              controller: controller.password,
              decoration: InputDecoration(
                prefixIcon: const Icon(Iconsax.password_check),
                labelText: AppTexts.password,
                suffixIcon: IconButton(
                  icon: Icon(controller.isHide.value
                      ? Iconsax.eye_slash
                      : Iconsax.eye),
                  onPressed: () =>
                      controller.isHide.value = !controller.isHide.value,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Obx(
                () => Checkbox(
                  value: controller.isCheck.value,
                  onChanged: (val) => controller.isCheck.value = val,
                ),
              ),
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
          Obx(
            ()=> ButtonWidget(
              statusRequest: controller.statusRequest.value,
              onPress: () async => await controller.signUp(),
              text: AppTexts.createAccount,
            ),
          ),
          const SizedBox(
            height: 25,
          ),
        ],
      ),
    );
  }
}
