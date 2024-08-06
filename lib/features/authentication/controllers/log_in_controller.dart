import 'package:e_commerce/data/auth_repository.dart';
import 'package:e_commerce/data/user_repository.dart';
import 'package:e_commerce/features/authentication/models/user_model.dart';
import 'package:e_commerce/utils/constants/enums.dart';
import 'package:e_commerce/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:e_commerce/utils/function/check_internet.dart';
import 'package:e_commerce/utils/function/snack_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LogInController extends GetxController {
  static LogInController get instance => Get.find();

  late TextEditingController email;
  late TextEditingController password;
  GlobalKey<FormState> formState = GlobalKey();
  Rx<bool> isHide = true.obs;
  Rx<bool> isCheck = false.obs;
  final GetStorage storage = GetStorage();
  late Rx<StatusRequest> statusRequest;

  Future<void> signInWithEmailAndPassword() async {
    try {
      if (!await checkInternet()) {
        statusRequest.value = StatusRequest.offline;
        update();
        return;
      }
      if (!formState.currentState!.validate()) return;
      if (isCheck.value) {
        storage.write('Email', email.text.trim());
        storage.write('Password', password.text.trim());
      }
      statusRequest.value = StatusRequest.loading;
      update();
      await AuthRepository.instance
          .logInWithEmailAndPassword(email.text.trim(), password.text.trim());

      AuthRepository.instance.screenRedirect();
    } on FirebaseAuthException catch (e) {
      final error = AuthError.from(e);
      showErrorSnackbar(error.dialogTitle, error.dialogText);
      statusRequest.value = StatusRequest.serverFailure;
      update();
    }
  }

  Future<void> googleSignIn() async {
    try {
      if (!await checkInternet()) {
        statusRequest.value = StatusRequest.offline;
        update();
      }

      final credential = await AuthRepository.instance.googleSignIn();

      final UserModel user = UserModel(
          id: credential.user!.uid,
          firstName: credential.user?.displayName ?? '',
          lastName: credential.user?.displayName ?? '',
          userName: credential.user?.displayName ?? '',
          email: credential.user?.email ?? '',
          number: credential.user?.phoneNumber ?? '',
          profilePicture: credential.user?.photoURL ?? '');

      UserRepository().saveUserInf(user);

      AuthRepository.instance.screenRedirect();

      statusRequest.value = StatusRequest.success;
      update();
    } on FirebaseAuthException catch (e) {
      final error = AuthError.from(e);
      showErrorSnackbar(error.dialogTitle, error.dialogText);
      statusRequest.value = StatusRequest.serverFailure;
      // update();
    }
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    email.text = storage.read('Email') ?? '';
    password.text = storage.read('Password') ?? '';
    statusRequest = StatusRequest.none.obs;
    super.onInit();
  }
}
