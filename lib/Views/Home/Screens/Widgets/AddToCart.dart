import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shoes_app/Models/Controller/CartController.dart';
import 'package:shoes_app/Models/Model/ProductModel.dart';
import 'package:shoes_app/utils/constants/colors.dart';
import 'package:shoes_app/utils/constants/enums.dart';
import 'package:shoes_app/utils/constants/sizes.dart';

class AddToCart extends StatelessWidget {
  const AddToCart({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final cartcontroller = CartController.instance;
    return GestureDetector(
      onTap: () {
        if (product.productType == ProductType.single.toString()) {
          final cartitem = cartcontroller.convertToCartItem(product, 1);
          cartcontroller.addOneToCart(cartitem);
        } else {}
      },
      child: Obx(() {
        final productcounts =
            cartcontroller.getProductQuantityInCart(product.id);
        return Container(
          decoration: BoxDecoration(
            color: productcounts > 0 ? CColors.primary : CColors.dark,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(
                CSizes.cardRadiusMd,
              ),
              bottomRight: Radius.circular(CSizes.productImageRadius),
            ),
          ),
          child: SizedBox(
            height: CSizes.iconLg * 1.2,
            width: CSizes.iconLg * 1.2,
            child: productcounts > 0
                ? Text(productcounts.toString(),
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .apply(color: CColors.white))
                : const Icon(
                    Iconsax.add,
                    color: CColors.white,
                  ),
          ),
        );
      }),
    );
  }
}
