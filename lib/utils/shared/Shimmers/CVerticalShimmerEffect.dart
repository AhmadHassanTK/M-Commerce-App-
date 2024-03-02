import 'package:flutter/material.dart';
import 'package:shoes_app/utils/constants/sizes.dart';
import 'package:shoes_app/utils/shared/CGridView.dart';
import 'package:shoes_app/utils/shared/Shimmers/CShimmerEffect.dart';

class CVerticalShimmerEffect extends StatelessWidget {
  const CVerticalShimmerEffect({
    super.key,
    this.itemCount = 4,
  });

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return CGridView(
      itemcount: itemCount,
      itembuilder: (context, index) {
        return const SizedBox(
          width: 180,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CShimmerEffect(width: 180, height: 180),
              SizedBox(height: CSizes.spaceBtwItems),
              CShimmerEffect(width: 160, height: 15),
              SizedBox(height: CSizes.spaceBtwItems / 2),
              CShimmerEffect(width: 110, height: 15),
            ],
          ),
        );
      },
    );
  }
}
