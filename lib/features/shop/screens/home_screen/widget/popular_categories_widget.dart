import 'package:e_commerce/common/widget/header_widget.dart';
import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';

class PopularCategoriesWidget extends StatelessWidget {
  const PopularCategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
         const HeaderWidget(text: 'Popular Categories', isButton: false, color: Colors.white,),
          SizedBox(
            height: 100,
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 10),
              shrinkWrap: true,
              itemCount: 12,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 4.0, bottom: 5),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 25,
                        child: Image.asset(
                          AppImages.shoeIcon,
                          height: 30,
                        ),
                      ),
                    ),
                    Text(
                      'Shoes',
                      style: Theme.of(context).textTheme.labelMedium,
                    )
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
