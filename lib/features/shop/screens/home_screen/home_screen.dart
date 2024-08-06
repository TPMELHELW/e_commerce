import 'package:e_commerce/common/widget/clip_path_container_widget.dart';
import 'package:e_commerce/common/widget/product_grid_view_widget.dart';
import 'package:e_commerce/features/shop/controllers/home_controller.dart';
import 'package:e_commerce/common/widget/app_bar_widget.dart';
import 'package:e_commerce/features/shop/screens/home_screen/widget/popular_categories_widget.dart';
import 'package:e_commerce/common/widget/product_card_vertical_widget.dart';
import 'package:e_commerce/features/shop/screens/home_screen/widget/promo_slider_widget.dart';
import 'package:e_commerce/common/widget/search_bar_widget.dart';
import 'package:e_commerce/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ClipPathContainerWidget(
              child: Column(
                children: [
                  CustomAppBarWidget(
                    title: AppTexts.homeAppbarTitle,
                    isSubTitle: true,
                    color: Colors.white,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SearchBarWidget(),
                  SizedBox(
                    height: 20,
                  ),
                  PopularCategoriesWidget(),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            PromoSliderWidget(
              controller: controller,
            ),
            ProductGridWidget(
              itemCount: 10,
              mainAxisExtent: 274,
              itemBuilder: (BuildContext context, int index) {
                return const ProductCardVerticalWidget();
              },
            )
          ],
        ),
      ),
    );
  }
}
