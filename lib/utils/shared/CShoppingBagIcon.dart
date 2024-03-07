import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shoes_app/Models/Controller/CartController.dart';
import 'package:shoes_app/utils/constants/colors.dart';

class CShoppingCartIcon extends StatelessWidget {
  const CShoppingCartIcon(
      {super.key, this.iconcolor = CColors.black, this.onPressed});

  final Color? iconcolor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CartController());
    return Stack(
      children: [
        IconButton(
          onPressed: onPressed,
          icon: Icon(
            Iconsax.shopping_bag,
            color: iconcolor,
          ),
        ),
        Container(
          width: 18,
          height: 18,
          decoration: BoxDecoration(
            color: CColors.black.withOpacity(0.5),
            borderRadius: BorderRadius.circular(100),
          ),
          child: Center(
            child: Obx(
              () => Text(
                controller.noOfCartItems.toString(),
                style: Theme.of(context)
                    .textTheme
                    .labelSmall!
                    .apply(color: CColors.white),
              ),
            ),
          ),
        )
      ],
    );
  }
}
