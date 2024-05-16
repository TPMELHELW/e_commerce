import 'package:flutter/material.dart';

class ProductGridWidget extends StatelessWidget {
  final Widget Function(BuildContext, int) itemBuilder;
  final double mainAxisExtent;
  final int itemCount;
  const ProductGridWidget(
      {super.key,
      required this.itemBuilder,
      required this.mainAxisExtent,
      required this.itemCount});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        itemCount: itemCount,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          mainAxisExtent: mainAxisExtent,
        ),
        itemBuilder: itemBuilder);
  }
}
