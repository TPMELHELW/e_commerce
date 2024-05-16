import 'package:e_commerce/common/widget/custom_clipper.dart';
import 'package:flutter/material.dart';

class ClipPathContainerWidget extends StatelessWidget {
  final Widget? child;
  const ClipPathContainerWidget({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MyClipper(),
      child: Container(
          color: Colors.blue,
          // width: double.infinity,
          child: child),
    );
  }
}
