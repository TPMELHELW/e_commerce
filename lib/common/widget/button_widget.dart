// import 'package:e_commerce/features/authentication/screens/signup_screen/verify_screen.dart';
// import 'package:e_commerce/utils/constants/text_strings.dart';
import 'package:e_commerce/utils/constants/enums.dart';
import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';

class ButtonWidget extends StatelessWidget {
  final void Function()? onPress;
  final String text;
  final StatusRequest statusRequest;
  const ButtonWidget({
    super.key,
    this.onPress,
    required this.text,
    this.statusRequest = StatusRequest.none,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      child: statusRequest == StatusRequest.loading
          ? const Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            )
          : Text(text),
    );
  }
}
