import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shoes_app/Models/Controller/ProductController.dart';
import 'package:shoes_app/Models/Model/ProductModel.dart';
import 'package:shoes_app/Views/Home/Screens/Widgets/FavoriteIcon.dart';
import 'package:shoes_app/utils/constants/colors.dart';
import 'package:shoes_app/utils/constants/enums.dart';
import 'package:shoes_app/utils/constants/sizes.dart';
import 'package:shoes_app/utils/helpers/helper_functions.dart';
import 'package:shoes_app/utils/shared/CProductPriceText.dart';
import 'package:shoes_app/utils/shared/CProductTitleText.dart';
import 'package:shoes_app/utils/shared/CRoundedContainer.dart';
import 'package:shoes_app/utils/shared/CRoundedImage.dart';
import 'package:shoes_app/utils/shared/CVerfiedIconWithText.dart';

class ProductItemH extends StatelessWidget {
  const ProductItemH({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = CHelperFunctions.isDarkMode(context);
    final productcontroller = ProductController.instance;
    final salePercentage =
        productcontroller.salePercentage(product.price, product.saleprice);
    return Container(
      width: 310,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(CSizes.productImageRadius),
        color: dark ? CColors.darkGrey : CColors.softGrey,
      ),
      child: Row(
        children: [
          CRoundedContainer(
            height: 120,
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
                  top: 0,
                  child: FavoriteIcon(productId: product.id),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 190,
            child: Padding(
              padding: const EdgeInsets.only(top: CSizes.sm, left: CSizes.sm),
              child: Column(
                children: [
                  Column(
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
                              CProductPriceText(
                                price: product.price.toString(),
                                linethrough: true,
                              ),
                            CProductPriceText(
                                price:
                                    productcontroller.getProductPrice(product)),
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
                            bottomRight:
                                Radius.circular(CSizes.productImageRadius),
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
          )
        ],
      ),
    );
  }
}
