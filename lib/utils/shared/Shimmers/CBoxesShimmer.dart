import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shoes_app/utils/constants/sizes.dart';
import 'package:shoes_app/utils/shared/Shimmers/CShimmerEffect.dart';

class CBoxesShimmer extends StatelessWidget {
  const CBoxesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            Expanded(child: CShimmerEffect(width: 150, height: 110)),
            SizedBox(width: CSizes.spaceBtwItems),
            Expanded(child: CShimmerEffect(width: 150, height: 110)),
            SizedBox(width: CSizes.spaceBtwItems),
            Expanded(child: CShimmerEffect(width: 150, height: 110)),
            SizedBox(width: CSizes.spaceBtwItems),
          ],
        )
      ],
    );
  }
}
