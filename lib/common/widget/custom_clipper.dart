import 'package:flutter/material.dart';

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);

    final firstCurve = Offset(30, size.height - 20);
    path.arcToPoint(
      radius: const Radius.circular(30),
      firstCurve,
    );

    path.lineTo(size.width - 30, size.height - 20);
    final secondCurve = Offset(size.width, size.height);
    path.arcToPoint(
      radius: const Radius.circular(30),
      secondCurve,
    );
    path.lineTo(size.width, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
