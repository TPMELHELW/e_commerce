import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  final String text;
  final bool isButton;
  final Color color;
  const HeaderWidget(
      {super.key,
      required this.text,
      required this.isButton,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isButton ? 15 : 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style:
                Theme.of(context).textTheme.headlineSmall!.apply(color: color),
          ),
          isButton
              ? TextButton(onPressed: () {}, child: const Text('View All'))
              : const Text('')
        ],
      ),
    );
  }
}
