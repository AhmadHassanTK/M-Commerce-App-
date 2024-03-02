import 'package:flutter/material.dart';
import 'package:shoes_app/utils/constants/sizes.dart';
import 'package:shoes_app/utils/shared/Shimmers/CShimmerEffect.dart';

class CListTileShimmer extends StatelessWidget {
  const CListTileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CShimmerEffect(width: 50, height: 50, radius: 50),
        SizedBox(width: CSizes.spaceBtwItems),
        Column(
          children: [
            CShimmerEffect(width: 100, height: 15),
            SizedBox(height: CSizes.spaceBtwItems / 2),
            CShimmerEffect(width: 50, height: 12),
          ],
        )
      ],
    );
  }
}
