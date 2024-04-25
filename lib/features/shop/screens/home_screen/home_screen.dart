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
            ClipPath(
              clipper: MyClipper(),
              child: Container(
                color: Colors.blue,
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.48,
                child: const Column(
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
                    PopularCategoriesWidget()
                  ],
                ),
              ),
            ),
            PromoSliderWidget(
              controller: controller,
            ),
            ProductGridWidget(
              itemCount: 10,
              mainAxisExtent: 277,
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
