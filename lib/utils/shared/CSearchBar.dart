import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shoes_app/utils/constants/colors.dart';
import 'package:shoes_app/utils/constants/sizes.dart';
import 'package:shoes_app/utils/device/device_utility.dart';
import 'package:shoes_app/utils/helpers/helper_functions.dart';

class CSearchBar extends StatelessWidget {
  const CSearchBar({
    super.key,
    required this.text,
    required this.showbackground,
    required this.showborder,
    this.icon = Iconsax.search_normal,
    this.padding = const EdgeInsets.symmetric(horizontal: CSizes.defaultSpace),
  });

  final IconData? icon;
  final String text;
  final bool showbackground, showborder;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final isdark = CHelperFunctions.isDarkMode(context);
    return Padding(
      padding: padding,
      child: Container(
        width: CDeviceUtils.getScreenWidth(context),
        padding: const EdgeInsets.all(CSizes.md),
        decoration: BoxDecoration(
          color: showbackground
              ? isdark
                  ? CColors.dark
                  : CColors.light
              : Colors.transparent,
          borderRadius:
              showborder ? BorderRadius.circular(CSizes.cardRadiusLg) : null,
          border: Border.all(
            color: CColors.grey,
          ),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: CColors.darkGrey,
            ),
            const SizedBox(width: CSizes.spaceBtwItems),
            Text(
              text,
              style: Theme.of(context).textTheme.bodySmall,
            )
          ],
        ),
      ),
    );
  }
}
