import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shoes_app/utils/constants/colors.dart';
import 'package:shoes_app/utils/constants/image_strings.dart';
import 'package:shoes_app/utils/constants/sizes.dart';
import 'package:shoes_app/utils/helpers/helper_functions.dart';
import 'package:shoes_app/utils/shared/CBoxshadow.dart';
import 'package:shoes_app/utils/shared/CProductTitleText.dart';
import 'package:shoes_app/utils/shared/CRoundedContainer.dart';
import 'package:shoes_app/utils/shared/CRoundedImage.dart';

class CProductItem extends StatelessWidget {
  const CProductItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = CHelperFunctions.isDarkMode(context);

    return Container(
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
            padding: const EdgeInsets.all(CSizes.sm),
            backgroundcolor: dark ? CColors.dark : CColors.light,
            child: Stack(
              children: [
                const CRoundedImage(
                  imageurl: CImages.productImage1,
                  roundedborder: true,
                ),
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
                      '25%',
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
                const CProductTitleText(
                  title: 'Green Nike Air Shoes',
                  smallsize: true,
                ),
                const SizedBox(height: CSizes.spaceBtwItems / 2),
                Row(
                  children: [
                    Text(
                      'Nike',
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    const SizedBox(width: CSizes.xs),
                    const Icon(
                      Iconsax.verify5,
                      color: CColors.primary,
                      size: CSizes.iconXs,
                    )
                  ],
                ),
              ],
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: CSizes.xs),
                child: Text(
                  '\$35.0',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.headlineSmall,
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
    );
  }
}
