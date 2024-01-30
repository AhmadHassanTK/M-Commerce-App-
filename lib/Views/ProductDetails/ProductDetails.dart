// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shoes_app/utils/constants/colors.dart';
import 'package:shoes_app/utils/constants/image_strings.dart';
import 'package:shoes_app/utils/constants/sizes.dart';
import 'package:shoes_app/utils/helpers/helper_functions.dart';
import 'package:shoes_app/utils/shared/CAppBar.dart';
import 'package:shoes_app/utils/shared/CPrimaryHeaderContainer.dart';
import 'package:shoes_app/utils/shared/CProductTitleText.dart';
import 'package:shoes_app/utils/shared/CRoundedContainer.dart';
import 'package:shoes_app/utils/shared/CRoundedImage.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = CHelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CPrimaryHeaderContainer(
              child: Container(
                color: dark ? CColors.dark : CColors.light,
                child: Stack(
                  children: [
                    SizedBox(
                      height: 400,
                      child: Padding(
                        padding: const EdgeInsets.all(CSizes.defaultSpace),
                        child: Center(
                          child:
                              Image(image: AssetImage(CImages.productImage1)),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 30,
                      right: 0,
                      left: CSizes.defaultSpace,
                      child: SizedBox(
                        height: 80,
                        child: ListView.separated(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          physics: AlwaysScrollableScrollPhysics(),
                          itemCount: 8,
                          separatorBuilder: (context, index) => SizedBox(
                            width: CSizes.defaultSpace,
                          ),
                          itemBuilder: (context, index) {
                            return CRoundedImage(
                              width: 80,
                              imageurl: CImages.productImage5,
                              padding: EdgeInsets.all(CSizes.sm),
                              border: Border.all(color: CColors.primary),
                              backgroundcolor:
                                  dark ? CColors.dark : CColors.light,
                            );
                          },
                        ),
                      ),
                    ),
                    CAppBar(
                      showbackarrow: true,
                      actions: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: dark ? CColors.dark : CColors.light,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Iconsax.heart5,
                                color: Colors.red,
                              )),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(CSizes.defaultSpace),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Iconsax.star5, color: Colors.amber, size: 24),
                          SizedBox(width: CSizes.spaceBtwItems / 2),
                          Text.rich(TextSpan(children: [
                            TextSpan(
                                text: '5.0',
                                style: Theme.of(context).textTheme.bodyLarge),
                            TextSpan(text: '(199)')
                          ]))
                        ],
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
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
                      SizedBox(width: CSizes.spaceBtwItems),
                      Text(
                        '\$250',
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .apply(decoration: TextDecoration.lineThrough),
                      ),
                      SizedBox(width: CSizes.spaceBtwItems),
                      Text('\$175',
                          style: Theme.of(context).textTheme.titleLarge!)
                    ],
                  ),
                  SizedBox(width: CSizes.spaceBtwItems),
                  CProductTitleText(title: 'Green Nike Sports Shirt'),
                  SizedBox(width: CSizes.spaceBtwItems / 1.5),
                  Row(
                    children: [
                      CProductTitleText(title: 'Status'),
                      SizedBox(width: CSizes.spaceBtwItems),
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
                      SizedBox(width: CSizes.spaceBtwItems),
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
            )
          ],
        ),
      ),
    );
  }
}
