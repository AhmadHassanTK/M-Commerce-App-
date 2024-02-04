import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shoes_app/utils/constants/colors.dart';
import 'package:shoes_app/utils/constants/sizes.dart';
import 'package:shoes_app/utils/helpers/helper_functions.dart';
import 'package:shoes_app/utils/shared/CRoundedIcon.dart';

class CPlusAndMinusButtons extends StatelessWidget {
  const CPlusAndMinusButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = CHelperFunctions.isDarkMode(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CRoundedIcon(
          icon: Iconsax.minus,
          height: 32,
          width: 32,
          iconsize: CSizes.md,
          iconcolor: dark ? CColors.light : CColors.dark,
          backgroundColor: dark ? CColors.darkGrey : CColors.light,
        ),
        const SizedBox(width: CSizes.spaceBtwItems),
        Text('2', style: Theme.of(context).textTheme.titleSmall),
        const SizedBox(width: CSizes.spaceBtwItems),
        const CRoundedIcon(
          icon: Iconsax.add,
          height: 32,
          width: 32,
          iconsize: CSizes.md,
          iconcolor: CColors.white,
          backgroundColor: CColors.primary,
        ),
      ],
    );
  }
}
