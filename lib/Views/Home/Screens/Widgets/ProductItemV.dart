import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shoes_app/Models/Controller/ProductController.dart';
import 'package:shoes_app/Models/Model/ProductModel.dart';
import 'package:shoes_app/Views/ProductDetails/ProductDetails.dart';
import 'package:shoes_app/utils/constants/colors.dart';
import 'package:shoes_app/utils/constants/enums.dart';
import 'package:shoes_app/utils/constants/sizes.dart';
import 'package:shoes_app/utils/helpers/helper_functions.dart';
import 'package:shoes_app/utils/shared/CBoxshadow.dart';
import 'package:shoes_app/utils/shared/CProductTitleText.dart';
import 'package:shoes_app/utils/shared/CRoundedContainer.dart';
import 'package:shoes_app/utils/shared/CRoundedImage.dart';
import 'package:shoes_app/utils/shared/CVerfiedIconWithText.dart';

class CProductItemV extends StatelessWidget {
  const CProductItemV({
    super.key,
    this.ontap,
    required this.product,
  });
  final VoidCallback? ontap;
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final dark = CHelperFunctions.isDarkMode(context);
    final productcontroller = ProductController.instance;
    final salePercentage =
        productcontroller.salePercentage(product.price, product.saleprice);
    return GestureDetector(
      onTap: () {
        Get.to(() => ProductDetails(product: product));
      },
      child: Container(
        width: 180,
        decoration: BoxDecoration(
          boxShadow: [CBoxShadow.verticalboxshadow],
          borderRadius: BorderRadius.circular(CSizes.productImageRadius),
          color: dark ? CColors.darkGrey : CColors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CRoundedContainer(
              height: 180,
              width: 180,
              padding: const EdgeInsets.all(CSizes.sm),
              backgroundcolor: dark ? CColors.dark : CColors.light,
              child: Stack(
                children: [
                  CRoundedImage(
                    imageurl: product.thumbnail,
                    roundedborder: true,
                    isNetworkImage: true,
                  ),
                  if (salePercentage != null)
                    Positioned(
                      top: 10,
                      child: CRoundedContainer(
                        radius: CSizes.sm,
                        backgroundcolor: CColors.secondary.withOpacity(0.8),
                        padding: const EdgeInsets.symmetric(
                          horizontal: CSizes.sm,
                          vertical: CSizes.xs,
                        ),
                        child: Text(
                          '$salePercentage%',
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .apply(color: CColors.black),
                        ),
                      ),
                    ),
                  Positioned(
                    right: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: dark
                            ? CColors.black.withOpacity(0.9)
                            : CColors.white.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Iconsax.heart5,
                          color: Colors.red,
                          size: CSizes.lg,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: CSizes.xs),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CProductTitleText(
                    title: product.title,
                    smallsize: true,
                  ),
                  const SizedBox(height: CSizes.spaceBtwItems / 2),
                  CVerifiedIconWithText(text: product.brand!.name),
                ],
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Column(
                    children: [
                      if (product.productType ==
                              ProductType.single.toString() &&
                          product.saleprice > 0)
                        Padding(
                          padding: const EdgeInsets.only(left: CSizes.xs),
                          child: Text(
                            product.price.toString(),
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .apply(decoration: TextDecoration.lineThrough),
                          ),
                        ),
                      Padding(
                        padding: const EdgeInsets.only(left: CSizes.xs),
                        child: Text(
                          productcontroller.getProductPrice(product),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: CColors.dark,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(
                        CSizes.cardRadiusMd,
                      ),
                      bottomRight: Radius.circular(CSizes.productImageRadius),
                    ),
                  ),
                  child: const SizedBox(
                    height: CSizes.iconLg * 1.2,
                    width: CSizes.iconLg * 1.2,
                    child: Icon(
                      Iconsax.add,
                      color: CColors.white,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
