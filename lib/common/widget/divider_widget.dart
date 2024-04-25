import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DividerWidget extends StatelessWidget {
  final String text;
  const DividerWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Flexible(
          child: Divider(
            endIndent: 5,
            indent: 60,
          ),
        ),
        Text(
          text.capitalize!,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        const Flexible(
          child: Divider(
            endIndent: 60,
            indent: 5,
          ),
        ),
      ],
    );
  }
}
