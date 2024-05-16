import 'package:e_commerce/common/widget/app_bar_widget.dart';
import 'package:e_commerce/common/widget/product_card_vertical_widget.dart';
import 'package:e_commerce/common/widget/product_grid_view_widget.dart';
import 'package:flutter/material.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarWidget(
          title: 'Whishlist', isSubTitle: false, color: Colors.black),
      body: SingleChildScrollView(
        child: ProductGridWidget(
          itemBuilder: (_, index) {
            return const ProductCardVerticalWidget();
          },
          mainAxisExtent: 255,
          itemCount: 6,
        ),
      ),
    );
  }
}
