import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProductCardVerticalWidget extends StatelessWidget {
  const ProductCardVerticalWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      width: 180,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.black,
            offset: Offset(5, 5),
            blurRadius: 20,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black38,
                ),
                child: Image.asset(
                  AppImages.productImage1,
                ),
              ),
              Positioned(
                right: 0,
                top: 0,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Iconsax.heart),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(5),
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  '25%',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ),
            ],
          ),
          Text(
            'Green Nike Air Force',
            textAlign: TextAlign.left,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text(
                'Nike',
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const SizedBox(
                width: 5,
              ),
              const Icon(
                Iconsax.verify5,
                size: 25,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$300',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Iconsax.add,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
