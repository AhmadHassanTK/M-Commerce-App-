import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_app/Models/Model/BrandModel.dart';
import 'package:shoes_app/Views/Brands/Widgets/BrandProduct.dart';
import 'package:shoes_app/utils/constants/colors.dart';
import 'package:shoes_app/utils/constants/sizes.dart';
import 'package:shoes_app/utils/helpers/helper_functions.dart';
import 'package:shoes_app/utils/shared/CProductContainer.dart';
import 'package:shoes_app/utils/shared/CRoundedContainer.dart';

class CBrandShow extends StatelessWidget {
  const CBrandShow({
    super.key,
    required this.images,
    required this.brand,
  });

  final List<String> images;
  final BrandModel brand;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => BrandProducts(brand: brand)),
      child: CRoundedContainer(
        showborder: true,
        backgroundcolor: Colors.transparent,
        padding: const EdgeInsets.all(CSizes.md),
        bordercolor: CColors.darkGrey,
        margin: const EdgeInsets.all(CSizes.spaceBtwItems),
        child: Column(
          children: [
            CProductContainer(showBorder: true, brand: brand),
            Row(
                children:
                    images.map((image) => brandImages(image, context)).toList())
          ],
        ),
      ),
    );
  }

  Widget brandImages(String image, context) {
    return Expanded(
      child: CRoundedContainer(
        height: 100,
        padding: const EdgeInsets.all(CSizes.sm),
        margin: const EdgeInsets.all(CSizes.sm),
        backgroundcolor: CHelperFunctions.isDarkMode(context)
            ? CColors.darkGrey
            : CColors.light,
        child: CachedNetworkImage(
          imageUrl: image,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
