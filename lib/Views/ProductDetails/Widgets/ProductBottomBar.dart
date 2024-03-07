import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shoes_app/Models/Controller/CartController.dart';
import 'package:shoes_app/Models/Model/ProductModel.dart';
import 'package:shoes_app/utils/constants/colors.dart';
import 'package:shoes_app/utils/constants/sizes.dart';
import 'package:shoes_app/utils/helpers/helper_functions.dart';
import 'package:shoes_app/utils/shared/CRoundedIcon.dart';

class ProductBottomBar extends StatelessWidget {
  const ProductBottomBar({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = CHelperFunctions.isDarkMode(context);
    final cartcontroller = CartController.instance;
    cartcontroller.updateAlreadyAddedProductCount(product);

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: CSizes.defaultSpace,
        vertical: CSizes.defaultSpace / 2,
      ),
      decoration: BoxDecoration(
        color: dark ? CColors.dark : CColors.light,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(CSizes.cardRadiusLg),
          topRight: Radius.circular(CSizes.cardRadiusLg),
        ),
      ),
      child: Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CRoundedIcon(
                  icon: Iconsax.minus,
                  onPressed: () =>
                      cartcontroller.productQuantityInCart.value < 1
                          ? null
                          : cartcontroller.productQuantityInCart -= 1,
                ),
                const SizedBox(width: CSizes.spaceBtwItems),
                Text(
                  cartcontroller.productQuantityInCart.toString(),
                  style: Theme.of(context).textTheme.titleSmall!.apply(
                        color: dark ? CColors.white : CColors.black,
                      ),
                ),
                const SizedBox(width: CSizes.spaceBtwItems),
                CRoundedIcon(
                  icon: Iconsax.add,
                  backgroundColor: CColors.black,
                  onPressed: () => cartcontroller.productQuantityInCart += 1,
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () => cartcontroller.productQuantityInCart < 1
                  ? null
                  : cartcontroller.addToCart(product),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(CSizes.md),
                backgroundColor: CColors.black,
                side: const BorderSide(color: CColors.black),
              ),
              child: const Text('Add to Cart'),
            )
          ],
        ),
      ),
    );
  }
}
