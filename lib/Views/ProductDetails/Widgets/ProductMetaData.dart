import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shoes_app/utils/constants/colors.dart';
import 'package:shoes_app/utils/constants/image_strings.dart';
import 'package:shoes_app/utils/constants/sizes.dart';
import 'package:shoes_app/utils/helpers/helper_functions.dart';
import 'package:shoes_app/utils/shared/CProductTitleText.dart';
import 'package:shoes_app/utils/shared/CRoundedContainer.dart';
import 'package:shoes_app/utils/shared/CRoundedImage.dart';

class ProductMetaData extends StatelessWidget {
  const ProductMetaData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = CHelperFunctions.isDarkMode(context);

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
                  '25%',
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .apply(color: CColors.black),
                ),
              ),
              const SizedBox(width: CSizes.spaceBtwItems),
              Text(
                '\$250',
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .apply(decoration: TextDecoration.lineThrough),
              ),
              const SizedBox(width: CSizes.spaceBtwItems),
              Text('\$175', style: Theme.of(context).textTheme.titleLarge!)
            ],
          ),
          const SizedBox(width: CSizes.spaceBtwItems),
          const CProductTitleText(title: 'Green Nike Sports Shirt'),
          const SizedBox(width: CSizes.spaceBtwItems / 1.5),
          Row(
            children: [
              const CProductTitleText(title: 'Status'),
              const SizedBox(width: CSizes.spaceBtwItems),
              Text(
                'In Stock',
                style: Theme.of(context).textTheme.titleMedium,
              )
            ],
          ),
          Row(
            children: [
              CRoundedImage(
                imageurl: CImages.nikeLogo,
                height: 32,
                width: 32,
                backgroundcolor: dark ? CColors.dark : CColors.light,
              ),
              const SizedBox(width: CSizes.spaceBtwItems),
              Text(
                'Nike',
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
