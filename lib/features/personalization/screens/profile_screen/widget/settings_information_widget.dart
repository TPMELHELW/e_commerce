import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class SettingsInformationWidget extends StatelessWidget {
  final String leading, title;
  final void Function()? onPress;
  const SettingsInformationWidget(
      {super.key, required this.leading, required this.title, this.onPress});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          leading,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Text(
          title,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        IconButton(
          onPressed: onPress,
          icon: const Icon(Iconsax.arrow_right_34),
        )
      ],
    );
  }
}
