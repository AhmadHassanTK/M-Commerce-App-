import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shoes_app/utils/constants/colors.dart';
import 'package:shoes_app/utils/constants/sizes.dart';
import 'package:shoes_app/utils/helpers/helper_functions.dart';

class CCircularIcon extends StatelessWidget {
  const CCircularIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = CHelperFunctions.isDarkMode(context);

    return Container(
      height: 40,
      width: 40,
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
    );
  }
}
