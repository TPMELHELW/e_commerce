import 'package:e_commerce/data/auth_repository.dart';
import 'package:e_commerce/features/authentication/screens/reset_password_screen/reset_password_screen.dart';
import 'package:e_commerce/utils/constants/enums.dart';
import 'package:e_commerce/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:e_commerce/utils/function/check_internet.dart';
import 'package:e_commerce/utils/function/snack_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  late TextEditingController email;

  late Rx<StatusRequest> statusRequest;

  GlobalKey<FormState> formState = GlobalKey<FormState>();

  Future<void> sendResetPassword() async {
    try {
      if (!await checkInternet()) {
        statusRequest.value = StatusRequest.offline;
        update();
        return;
      }

      if (!formState.currentState!.validate()) return;

      statusRequest.value = StatusRequest.loading;
      update();

      await AuthRepository.instance.forgetPassword(email.text);
      Get.to(() => ResetPasswordScreen(
            email: email.text,
          ));
      statusRequest.value = StatusRequest.success;
      update();
    } on FirebaseAuthException catch (e) {
      final error = AuthError.from(e);
      showErrorSnackbar(error.dialogTitle, error.dialogText);
      statusRequest.value = StatusRequest.serverFailure;
      update();
    }
  }

  Future<void> resendPasswordReset(String email) async {
    try {
      if (!await checkInternet()) {
        statusRequest.value = StatusRequest.offline;
        update();
        return;
      }
      await AuthRepository.instance.forgetPassword(email);
    } on FirebaseAuthException catch (e) {
      final error = AuthError.from(e);
      showErrorSnackbar(error.dialogTitle, error.dialogText);
      statusRequest.value = StatusRequest.serverFailure;
      update();
    }
  }

  @override
  void onInit() {
    statusRequest = StatusRequest.none.obs;
    email = TextEditingController();

    super.onInit();
  }
}
