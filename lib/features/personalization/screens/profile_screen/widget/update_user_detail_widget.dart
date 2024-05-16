import 'package:e_commerce/common/widget/button_widget.dart';
import 'package:e_commerce/features/personalization/controller/change_name_controller.dart';
import 'package:e_commerce/utils/constants/text_strings.dart';
import 'package:e_commerce/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class UpdateUserDetailWidget extends StatelessWidget {
  const UpdateUserDetailWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ChangeNameController());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Change Name',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Form(
              key: controller.formState,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    validator: (value) => AppFieldValidator.validateEmpty(
                        value, AppTexts.firstName),
                    controller: controller.firstName,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.user),
                      labelText: AppTexts.firstName,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    validator: (value) => AppFieldValidator.validateEmpty(
                        value, AppTexts.lastName),
                    controller: controller.lastName,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.user),
                      labelText: AppTexts.lastName,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Obx(
                    () => ButtonWidget(
                      text: 'Save',
                      onPress: () => controller.changeName(),
                      statusRequest: controller.statusRequest.value,
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
