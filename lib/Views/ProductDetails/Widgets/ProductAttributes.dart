import 'package:flutter/material.dart';
import 'package:shoes_app/utils/constants/colors.dart';
import 'package:shoes_app/utils/constants/sizes.dart';
import 'package:shoes_app/utils/helpers/helper_functions.dart';
import 'package:shoes_app/utils/shared/CChoiceChip.dart';
import 'package:shoes_app/utils/shared/CProductPriceText.dart';
import 'package:shoes_app/utils/shared/CProductTitleText.dart';
import 'package:shoes_app/utils/shared/CRoundedContainer.dart';
import 'package:shoes_app/utils/shared/CSectionTitle.dart';

class ProductAttributes extends StatelessWidget {
  const ProductAttributes({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = CHelperFunctions.isDarkMode(context);

    return Column(
      children: [
        CRoundedContainer(
          backgroundcolor: dark ? CColors.darkGrey : CColors.grey,
          padding: const EdgeInsets.all(CSizes.md),
          margin: const EdgeInsets.all(CSizes.md),
          radius: 20,
          child: Column(
            children: [
              Row(
                children: [
                  const CSectionTitle(
                    title: 'Variation',
                    showactionbutton: false,
                  ),
                  const SizedBox(width: CSizes.md),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const CProductTitleText(
                              title: 'price :', smallsize: true),
                          const SizedBox(width: CSizes.sm),
                          Text(
                            '\$25',
                            style:
                                Theme.of(context).textTheme.titleSmall!.apply(
                                      decoration: TextDecoration.lineThrough,
                                    ),
                          ),
                          const SizedBox(width: CSizes.spaceBtwItems),
                          const CProductPriceText(price: '20')
                        ],
                      ),
                      Row(
                        children: [
                          const CProductTitleText(
                              title: 'Stock :', smallsize: true),
                          const SizedBox(width: CSizes.sm),
                          Text(
                            'In Stock',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(height: CSizes.spaceBtwItems / 2),
              const CProductTitleText(
                title:
                    'This is the description of the Product and it can go up to max 4 lines',
                maxlines: 4,
                smallsize: true,
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: CSizes.defaultSpace),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CSectionTitle(title: 'Colors', showactionbutton: false),
                  const SizedBox(height: CSizes.spaceBtwItems / 2),
                  Wrap(
                    spacing: 8,
                    children: [
                      CChoiceChip(
                          text: 'Green', selected: true, onselected: (v) {}),
                      CChoiceChip(
                          text: 'Blue', selected: false, onselected: (v) {}),
                      CChoiceChip(
                          text: 'Red', selected: false, onselected: (v) {})
                    ],
                  ),
                ],
              ),
              const SizedBox(height: CSizes.spaceBtwItems),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CSectionTitle(title: 'Sizes', showactionbutton: false),
                  const SizedBox(height: CSizes.spaceBtwItems / 2),
                  Wrap(
                    spacing: 8,
                    children: [
                      CChoiceChip(
                          text: 'EU 34', selected: false, onselected: (v) {}),
                      CChoiceChip(
                          text: 'EU 36', selected: true, onselected: (v) {}),
                      CChoiceChip(
                          text: 'EU 38', selected: false, onselected: (v) {})
                    ],
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
