import 'package:e_commerce/features/authentication/screens/signup_screen/verify_screen.dart';
import 'package:e_commerce/data/auth_repository.dart';
import 'package:e_commerce/data/user_repository.dart';
import 'package:e_commerce/features/authentication/models/user_model.dart';
import 'package:e_commerce/utils/constants/enums.dart';
import 'package:e_commerce/utils/function/check_internet.dart';
import 'package:e_commerce/utils/function/snack_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  final Rx<bool> isHide = true.obs;
  final Rx<bool?> isCheck = false.obs;
  late TextEditingController firstName;
  late TextEditingController lastName;
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController phone;
  late TextEditingController userName;
  GlobalKey<FormState> formState = GlobalKey();
  late Rx<StatusRequest> statusRequest;

  Future<void> signUp() async {
    try {
      ///Check Internet
      if (!await checkInternet()) {
        statusRequest.value = StatusRequest.offline;
        return;
      }

      ///Field Validation
      if (!formState.currentState!.validate()) return;

      ///Privacy Check
      if (!isCheck.value!) {
        showErrorSnackbar('Privacy Policy and Terms Of Use', 'Check the box');
        return;
      }
      statusRequest.value = StatusRequest.loading;

      ///Create Account
      final user = await AuthRepository.instance
          .signUpWithEmailAndPassword(email.text.trim(), password.text.trim());
      final UserModel userData = UserModel(
        id: user.user!.uid,
        firstName: firstName.text,
        lastName: lastName.text,
        userName: userName.text,
        email: email.text,
        number: phone.text,
      );

      ///Store User Data in Firestore
      await UserRepository().saveUserInf(userData);

      Get.to(
        () => VerifyScreen(
          email: email.text,
        ),
      );
      statusRequest.value = StatusRequest.success;

      ///Send Email Verification
    } on FirebaseAuthException catch (_) {
      statusRequest.value = StatusRequest.serverFailure;
    }
  }

  @override
  void onInit() {
    firstName = TextEditingController();
    lastName = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    phone = TextEditingController();
    userName = TextEditingController();
    statusRequest = StatusRequest.none.obs;
    super.onInit();
  }
}
