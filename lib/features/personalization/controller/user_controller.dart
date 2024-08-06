import 'package:e_commerce/common/widget/button_widget.dart';
import 'package:e_commerce/common/widget/custom_outline_button_widget.dart';
import 'package:e_commerce/data/auth_repository.dart';
import 'package:e_commerce/data/user_repository.dart';
import 'package:e_commerce/features/authentication/models/user_model.dart';
import 'package:e_commerce/features/authentication/screens/login_screen/login_screen.dart';
import 'package:e_commerce/features/personalization/screens/profile_screen/widget/reauth_login_widget.dart';
import 'package:e_commerce/utils/constants/enums.dart';
import 'package:e_commerce/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:e_commerce/utils/function/check_internet.dart';
import 'package:e_commerce/utils/function/snack_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find<UserController>();
  Rx<bool> isHide = false.obs;
  late TextEditingController email, password;
  Rx<UserModel> user = UserModel.empty().obs;
  final userRepo = UserRepository();
  final authRepo = AuthRepository.instance;
  late Rx<StatusRequest> statusRequest;
  GlobalKey<FormState> reAuthFormState = GlobalKey<FormState>();
  final auth = FirebaseAuth.instance.currentUser;

  Future<void> getUserData() async {
    try {
      final userData = await userRepo.getUserData();
      user(userData);
    } catch (e) {
      showErrorSnackbar('Error', '$e');
    }
  }

  void showEnsureDeleteAccount() {
    Get.defaultDialog(
      contentPadding: const EdgeInsets.all(15),
      title: 'Delete Account',
      middleText: 'Are you sure you want to delete your Account Permanently ?',
      cancel: ButtonWidget(
        text: 'Cancel',
        statusRequest: statusRequest.value,
        onPress: () => Get.back(),
      ),
      confirm: Obx(
        () => CustomOutlineButtonWidget(
          text: 'Delete Account',
          onPress: () async => await deleteAccount(),
          statusRequest: statusRequest.value,
          color: Colors.red,
        ),
      ),
    );
  }

  Future<void> deleteAccount() async {
    try {
      if (!await checkInternet()) {
        statusRequest.value = StatusRequest.offline;
        return;
      }
      // if
      statusRequest.value = StatusRequest.loading;
      final user = auth!.providerData.map((e) => e.providerId).first;
      if (user.isNotEmpty) {
        if (user == 'google.com') {
          await authRepo.googleSignIn();
          await userRepo.removeUserData();
          await authRepo.deleteAccount();
          Get.offAll(() => const LoginScreen());
        } else if (user == 'password') {
          Get.to(() => const ReauthLoginWidget());
          statusRequest.value = StatusRequest.success;
        }
      }
    } catch (e) {
      showErrorSnackbar('Error', e.toString());
    }
  }

  Future<void> reAuthDeleteAccount() async {
    try {
      if (!reAuthFormState.currentState!.validate()) return;
      if (!await checkInternet()) {
        statusRequest.value = StatusRequest.offline;
      }
      statusRequest.value = StatusRequest.loading;
      await authRepo.reAuth(email.text, password.text);
      await userRepo.removeUserData();
      await authRepo.deleteAccount();
      await Get.offAll(() => const LoginScreen());
    } on FirebaseAuthException catch (e) {
      final error = AuthError.from(e);
      showErrorSnackbar(error.dialogTitle, error.dialogText);
      statusRequest.value = StatusRequest.serverFailure;
    }
  }

  Future<void> uploadImage() async {
    try {
      final image = await ImagePicker()
          .pickImage(source: ImageSource.gallery, imageQuality: 70);
      if (image != null) {
        if (!await checkInternet()) {
          statusRequest.value = StatusRequest.offline;
          return;
        }
        statusRequest.value = StatusRequest.loading;
        final imageUrl =
            await userRepo.uploadProfileImage('Users/Profile/', image);
        Map<String, dynamic> data = {'ProfilePicture': imageUrl};
        await userRepo.updateSingleUserInf(data);
        user.value.profilePicture = imageUrl;
        user.refresh();
        statusRequest.value = StatusRequest.success;
        showSuccessSnackbar('Success', 'Upload Image Success');
      }
    } catch (e) {
      showErrorSnackbar('Error', e.toString());
      statusRequest.value = StatusRequest.serverFailure;
    }
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    statusRequest = StatusRequest.none.obs;
    getUserData();
    super.onInit();
  }
}
