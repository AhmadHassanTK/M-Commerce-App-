import 'package:flutter/material.dart';
import 'package:shoes_app/utils/constants/sizes.dart';
import 'package:shoes_app/utils/shared/Shimmers/CShimmerEffect.dart';

class CHorizaontalShimmerEffect extends StatelessWidget {
  const CHorizaontalShimmerEffect({super.key, this.itemcont = 4});

  final int itemcont;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: CSizes.spaceBtwSections),
      height: 120,
      child: ListView.separated(
        separatorBuilder: (context, index) =>
            const SizedBox(width: CSizes.spaceBtwItems),
        itemCount: itemcont,
        itemBuilder: (context, index) => const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CShimmerEffect(width: 120, height: 120),
            SizedBox(width: CSizes.spaceBtwItems),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: CSizes.spaceBtwItems / 2),
                CShimmerEffect(width: 160, height: 15),
                SizedBox(height: CSizes.spaceBtwItems / 2),
                CShimmerEffect(width: 110, height: 15),
                SizedBox(height: CSizes.spaceBtwItems / 2),
                CShimmerEffect(width: 80, height: 15),
                //  Spacer(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
