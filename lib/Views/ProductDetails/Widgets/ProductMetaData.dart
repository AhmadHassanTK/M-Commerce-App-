import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shoes_app/Models/Controller/ProductController.dart';
import 'package:shoes_app/Models/Model/ProductModel.dart';
import 'package:shoes_app/utils/constants/colors.dart';
import 'package:shoes_app/utils/constants/enums.dart';
import 'package:shoes_app/utils/constants/sizes.dart';
import 'package:shoes_app/utils/helpers/helper_functions.dart';
import 'package:shoes_app/utils/shared/CProductTitleText.dart';
import 'package:shoes_app/utils/shared/CRoundedContainer.dart';
import 'package:shoes_app/utils/shared/CRoundedImage.dart';

class ProductMetaData extends StatelessWidget {
  const ProductMetaData({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = CHelperFunctions.isDarkMode(context);
    final productController = ProductController.instance;
    final salePercentage =
        productController.salePercentage(product.price, product.saleprice);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: CSizes.defaultSpace),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Iconsax.star5, color: Colors.amber, size: 24),
                  const SizedBox(width: CSizes.spaceBtwItems / 2),
                  Text.rich(TextSpan(children: [
                    TextSpan(
                        text: '5.0',
                        style: Theme.of(context).textTheme.bodyLarge),
                    const TextSpan(text: '(199)')
                  ]))
                ],
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.share,
                  size: CSizes.md,
                ),
              )
            ],
          ),
          Row(
            children: [
              CRoundedContainer(
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
              const SizedBox(width: CSizes.spaceBtwItems),
              if (product.productType == ProductType.single.toString() &&
                  product.saleprice > 0)
                Text(
                  '\$${product.price}',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .apply(decoration: TextDecoration.lineThrough),
                ),
              if (product.productType == ProductType.single.toString() &&
                  product.saleprice > 0)
                const SizedBox(width: CSizes.spaceBtwItems),
              Text('\$${productController.getProductPrice(product)}',
                  style: Theme.of(context).textTheme.titleLarge!)
            ],
          ),
          const SizedBox(width: CSizes.spaceBtwItems),
          CProductTitleText(title: product.title),
          const SizedBox(width: CSizes.spaceBtwItems / 1.5),
          Row(
            children: [
              const CProductTitleText(title: 'Status'),
              const SizedBox(width: CSizes.spaceBtwItems),
              Text(
                productController.stockStatue(product.stock),
                style:
                    productController.stockStatue(product.stock) == 'In Stock'
                        ? Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .apply(color: Colors.green)
                        : Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .apply(color: Colors.red),
              ),
            ],
          ),
          Row(
            children: [
              CRoundedImage(
                imageurl: product.brand != null ? product.brand!.image : '',
                height: 32,
                width: 32,
                backgroundcolor: dark ? CColors.dark : CColors.light,
              ),
              const SizedBox(width: CSizes.spaceBtwItems),
              Text(
                product.brand != null ? product.brand!.name : '',
                style: Theme.of(context).textTheme.titleLarge,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              const SizedBox(width: CSizes.xs),
              const Icon(
                Iconsax.verify5,
                color: CColors.primary,
                size: CSizes.iconXs,
              )
            ],
          )
        ],
      ),
    );
  }
}
