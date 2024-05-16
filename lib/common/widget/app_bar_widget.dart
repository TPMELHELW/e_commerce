import 'package:e_commerce/features/personalization/controller/user_controller.dart';
import 'package:e_commerce/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class CustomAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  final bool isSubTitle;
  final Color color;
  const CustomAppBarWidget(
      {super.key,
      required this.title,
      required this.isSubTitle,
      required this.color});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return AppBar(
      automaticallyImplyLeading: false,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          isSubTitle
              ? Text(
                  AppTexts.homeAppbarTitle,
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .apply(color: Colors.white),
                )
              : Text(''),
          Obx(
            () => Text(
              controller.user.value.firstName,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .apply(color: color),
            ),
          )
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Iconsax.shopping_bag),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
