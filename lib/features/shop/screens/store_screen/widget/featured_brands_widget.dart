import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class FeaturedBrandsWidget extends StatelessWidget {
  const FeaturedBrandsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(20)),
      child: Row(
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
                        style: Theme.of(context).textTheme.titleLarge,
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
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
