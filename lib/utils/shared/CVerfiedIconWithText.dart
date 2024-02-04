import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shoes_app/utils/constants/colors.dart';
import 'package:shoes_app/utils/constants/sizes.dart';

class CVerifiedIconWithText extends StatelessWidget {
  const CVerifiedIconWithText({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        const SizedBox(width: CSizes.xs),
        const Icon(
          Iconsax.verify5,
          color: CColors.primary,
          size: CSizes.iconXs,
        )
      ],
    );
  }
}
