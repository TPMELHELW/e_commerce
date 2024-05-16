import 'package:e_commerce/utils/constants/enums.dart';
import 'package:flutter/material.dart';

class CustomOutlineButtonWidget extends StatelessWidget {
  final void Function()? onPress;
  final String text;
  final Color color;
  final StatusRequest statusRequest;
  const CustomOutlineButtonWidget(
      {super.key,
      this.onPress,
      required this.text,
      this.statusRequest = StatusRequest.none,
      this.color = Colors.black});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPress,
      child: statusRequest == StatusRequest.loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Text(
              text,
              style: TextStyle(color: color),
            ),
    );
  }
}
