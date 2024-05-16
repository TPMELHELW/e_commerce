import 'package:e_commerce/common/widget/button_widget.dart';
import 'package:e_commerce/features/authentication/controllers/log_in_controller.dart';
import 'package:e_commerce/features/authentication/screens/forget_password_screen/forget_password_screen.dart';
import 'package:e_commerce/features/authentication/screens/signup_screen/signup_screen.dart';
import 'package:e_commerce/utils/constants/text_strings.dart';
import 'package:e_commerce/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class LoginFormWidget extends StatelessWidget {
  const LoginFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final LogInController controller = LogInController.instance;
    return Form(
      key: controller.formState,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            validator: (value) => AppFieldValidator.validateEmail(value),
            controller: controller.email,
            decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.direct_right),
              labelText: AppTexts.email,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Obx(
            () => TextFormField(
              validator: (value) => AppFieldValidator.validatePassword(value),
              obscureText: controller.isHide.value,
              controller: controller.password,
              decoration: InputDecoration(
                prefixIcon: const Icon(Iconsax.password_check),
                labelText: AppTexts.password,
                suffixIcon: IconButton(
                  onPressed: () =>
                      controller.isHide.value = !controller.isHide.value,
                  icon: Icon(controller.isHide.value
                      ? Iconsax.eye
                      : Iconsax.eye_slash),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Obx(
                    () => Checkbox(
                      value: controller.isCheck.value,
                      onChanged: (val) => controller.isCheck.value = val!,
                    ),
                  ),
                  const Text(AppTexts.rememberMe),
                ],
              ),
              TextButton(
                onPressed: () => Get.to(() => const ForgetPasswordScreen()),
                child: const Text(AppTexts.forgetPassword),
              )
            ],
          ),
          Obx(
            () => ButtonWidget(
                statusRequest: controller.statusRequest.value,
                text: AppTexts.signIn,
                onPress: () async =>
                    await controller.signInWithEmailAndPassword()),
          ),
          const SizedBox(
            height: 10,
          ),
          OutlinedButton(
            onPressed: () => Get.to(() => const SignupScreen()),
            child: const Text(
              AppTexts.createAccount,
            ),
          )
        ],
      ),
    );
  }
}
