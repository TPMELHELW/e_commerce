// import ':flutter/foundation.dart';
import 'package:e_commerce/common/widget/custom_outline_button_widget.dart';
import 'package:e_commerce/features/personalization/controller/user_controller.dart';
import 'package:e_commerce/utils/constants/text_strings.dart';
import 'package:e_commerce/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:iconsax/iconsax.dart';

class ReauthLoginWidget extends StatelessWidget {
  const ReauthLoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Delete Account'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Form(
              key: controller.reAuthFormState,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    validator: (value) =>
                        AppFieldValidator.validateEmail(value),
                    controller: controller.email,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.direct_right),
                      labelText: AppTexts.email,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Obx(
                    () => TextFormField(
                      obscureText: controller.isHide.value,
                      validator: (value) =>
                          AppFieldValidator.validatePassword(value),
                      controller: controller.password,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Iconsax.password_check),
                        labelText: AppTexts.password,
                        suffixIcon: IconButton(
                          icon: Icon(controller.isHide.value
                              ? Iconsax.eye_slash
                              : Iconsax.eye),
                          onPressed: () => controller.isHide.value =
                              !controller.isHide.value,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Obx(
                    () => CustomOutlineButtonWidget(
                      text: 'Delete Account',
                      onPress: () => controller.reAuthDeleteAccount(),
                      statusRequest: controller.statusRequest.value,
                      color: Colors.red,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
