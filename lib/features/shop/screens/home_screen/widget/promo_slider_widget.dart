import 'package:e_commerce/features/shop/controllers/home_controller.dart';
import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PromoSliderWidget extends StatelessWidget {
  final HomeController controller;
  const PromoSliderWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 180,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: PageView(
              controller: controller.pageController,
              scrollDirection: Axis.horizontal,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    fit: BoxFit.cover,
                    AppImages.banner1,
                    height: 150,
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    AppImages.banner2,
                    height: 150,
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    AppImages.banner3,
                    height: 150,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Center(
          child: SmoothPageIndicator(
            controller: controller.pageController,
            count: 3,
            effect: const ExpandingDotsEffect(dotWidth: 30, dotHeight: 5),
          ),
        )
      ],
    );
  }
}
