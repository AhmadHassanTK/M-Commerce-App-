import 'package:flutter/material.dart';
import 'package:shoes_app/Models/Model/BrandModel.dart';
import 'package:shoes_app/utils/constants/colors.dart';
import 'package:shoes_app/utils/constants/sizes.dart';
import 'package:shoes_app/utils/helpers/helper_functions.dart';
import 'package:shoes_app/utils/shared/CProductContainer.dart';
import 'package:shoes_app/utils/shared/CRoundedContainer.dart';

class CBrandShow extends StatelessWidget {
  const CBrandShow({
    super.key,
    required this.images,
  });

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return CRoundedContainer(
      showborder: true,
      backgroundcolor: Colors.transparent,
      padding: const EdgeInsets.all(CSizes.md),
      bordercolor: CColors.darkGrey,
      margin: const EdgeInsets.all(CSizes.spaceBtwItems),
      child: Column(
        children: [
          //  CProductContainer(showBorder: true, brand: BrandModel.empty()),
          Row(
              children:
                  images.map((image) => brandImages(image, context)).toList())
        ],
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
        child: Image(
          image: AssetImage(
            image,
          ),
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
