import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shoes_app/Models/Model/BrandModel.dart';
import 'package:shoes_app/utils/constants/colors.dart';
import 'package:shoes_app/utils/constants/sizes.dart';
import 'package:shoes_app/utils/helpers/helper_functions.dart';
import 'package:shoes_app/utils/shared/CRoundedContainer.dart';
import 'package:shoes_app/utils/shared/CRoundedImage.dart';

class CProductContainer extends StatelessWidget {
  const CProductContainer({
    super.key,
    this.onPressed,
    required this.showBorder,
    required this.brand,
  });

  final VoidCallback? onPressed;
  final bool showBorder;
  final BrandModel brand;
  @override
  Widget build(BuildContext context) {
    final isdark = CHelperFunctions.isDarkMode(context);

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
                child: CRoundedImage(
                  imageurl: brand.image,
                  isNetworkImage: brand.image == '' ? false : true,
                  backgroundcolor: Colors.transparent,
                  overlaycolor: isdark ? CColors.white : CColors.black,
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          brand.name,
                          style: Theme.of(context).textTheme.titleLarge,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
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
                    '${brand.productsCount ?? 0} products',
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
