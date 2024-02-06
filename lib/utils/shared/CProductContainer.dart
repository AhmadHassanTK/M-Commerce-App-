import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shoes_app/utils/constants/colors.dart';
import 'package:shoes_app/utils/constants/image_strings.dart';
import 'package:shoes_app/utils/constants/sizes.dart';
import 'package:shoes_app/utils/helpers/helper_functions.dart';
import 'package:shoes_app/utils/shared/CRoundedContainer.dart';

class CProductContainer extends StatelessWidget {
  const CProductContainer({
    super.key,
    this.onPressed,
  });

  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: CRoundedContainer(
        showborder: true,
        padding: const EdgeInsetsDirectional.all(CSizes.sm),
        child: Row(
          children: [
            Flexible(
              child: Container(
                height: 56,
                width: 56,
                padding: const EdgeInsets.all(CSizes.sm),
                decoration: BoxDecoration(
                  color: CHelperFunctions.isDarkMode(context)
                      ? CColors.black
                      : CColors.white,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Image(
                  image: const AssetImage(CImages.clothIcon),
                  color: CHelperFunctions.isDarkMode(context)
                      ? CColors.white
                      : CColors.black,
                ),
              ),
            ),
            const SizedBox(width: CSizes.spaceBtwItems / 2),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
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
                  ),
                  Text(
                    '256 products',
                    style: Theme.of(context).textTheme.labelMedium,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
