import 'dart:async';
import 'package:e_commerce/common/screen/success_screen.dart';
import 'package:e_commerce/data/auth_repository.dart';
import 'package:e_commerce/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:e_commerce/utils/function/snack_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class VerificationController extends GetxController {
  @override
  void onInit() {
    sendEmailVerification();
    autoDirect();
    super.onInit();
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<void> sendEmailVerification() async {
    try {
      await AuthRepository().sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      final error = AuthError.from(e);
      showErrorSnackbar(error.dialogTitle, error.dialogText);
    }
  }

  Future<void> autoDirect() async {
    Timer.periodic(const Duration(seconds: 2), (timer) async {
      await _auth.currentUser!.reload();
      if (_auth.currentUser!.emailVerified) {
        timer.cancel();
        Get.off(() => const SuccessScreen());
      }
    });
  }

  Future<void> checkEmailVerification() async {
    if (_auth.currentUser != null && _auth.currentUser!.emailVerified) {
      Get.off(() => const SuccessScreen());
    }
  }
}
