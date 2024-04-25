import 'package:e_commerce/common/widget/app_bar_widget.dart';
import 'package:e_commerce/common/widget/header_widget.dart';
import 'package:e_commerce/common/widget/product_grid_view_widget.dart';
import 'package:e_commerce/common/widget/search_bar_widget.dart';
import 'package:e_commerce/features/shop/screens/store_screen/widget/featured_brands_widget.dart';
import 'package:e_commerce/features/shop/screens/store_screen/widget/tab_bar_widget.dart';
import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, val) {
            return [
              SliverAppBar(
                  pinned: true,
                  expandedHeight: 440,
                  floating: true,
                  flexibleSpace: ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      const SizedBox(height: 50),
                      const SearchBarWidget(),
                      const SizedBox(height: 30),
                      const HeaderWidget(
                        text: 'Featured Brands',
                        isButton: true,
                        color: Colors.black,
                      ),
                      ProductGridWidget(
                          itemCount: 4,
                          mainAxisExtent: 80,
                          itemBuilder: (context, index) =>
                              const FeaturedBrandsWidget())
                    ],
                  ),
                  bottom: const TabBarWidget())
            ];
          },
          body: TabBarView(
            children: [
              ListView(
                physics:const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: [
                  Container(
                    margin: const EdgeInsets.all(20),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Flexible(
                              child: Image.asset(
                                AppImages.nikeLogo,
                                height: 50,
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Row(
                                    children: [
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          'Nike',
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleLarge,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 2,
                                      ),
                                      const Icon(
                                        Iconsax.verify5,
                                        size: 15,
                                      ),
                                    ],
                                  ),
                                  Text(
                                    '250 Products',
                                    textAlign: TextAlign.left,
                                    overflow: TextOverflow.ellipsis,
                                    style:
                                        Theme.of(context).textTheme.labelMedium,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Flexible(
                              child: Container(
                                  margin: const EdgeInsets.only(right: 5),
                                  padding: const EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Image.asset(
                                    AppImages.productImage1,
                                  )),
                            ),
                            Flexible(
                              child: Container(
                                  margin: const EdgeInsets.only(right: 5),
                                  padding: const EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Image.asset(
                                    AppImages.productImage1,
                                  )),
                            ),
                            Flexible(
                              child: Container(
                                  margin: const EdgeInsets.only(right: 5),
                                  padding: const EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Image.asset(
                                    AppImages.productImage1,
                                  )),
                            ),
                          ],
                        ),

                      ],
                    ),
                  ),

                ],
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
