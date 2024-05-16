import 'package:e_commerce/features/personalization/controller/user_controller.dart';
import 'package:e_commerce/features/personalization/screens/profile_screen/profile_screen.dart';
import 'package:e_commerce/utils/constants/enums.dart';
import 'package:e_commerce/utils/function/check_internet.dart';
import 'package:e_commerce/utils/function/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangeNameController extends GetxController {
  late TextEditingController firstName, lastName;
  final _userController = UserController.instance;
  late Rx<StatusRequest> statusRequest;
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  Future changeName() async {
    try {
      if (!formState.currentState!.validate()) return;
      statusRequest.value = StatusRequest.loading;
      if (await checkInternet()) {
        statusRequest.value = StatusRequest.offline;
      }
      Map<String, dynamic> data = {
        'FirstName': firstName.text,
        "LastName": lastName.text
      };
      _userController.user.value.firstName = firstName.text;
      _userController.user.value.lastName = lastName.text;
      await _userController.userRepo.updateSingleUserInf(data);
      Get.off(() => const ProfileScreen());
      showSuccessSnackbar('Success', 'Your name has been Chnaged');
    } catch (e) {
      showErrorSnackbar("Error", e.toString());
    }
  }

  @override
  void onInit() {
    firstName = TextEditingController();
    lastName = TextEditingController();
    firstName.text = _userController.user.value.firstName;
    lastName.text = _userController.user.value.lastName;
    statusRequest = StatusRequest.none.obs;

    super.onInit();
  }

  @override
  void onClose() {
    firstName.dispose();
    lastName.dispose();
    super.onClose();
  }
}
