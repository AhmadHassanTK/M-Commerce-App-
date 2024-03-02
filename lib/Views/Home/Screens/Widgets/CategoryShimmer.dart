import 'package:flutter/material.dart';
import 'package:shoes_app/utils/constants/sizes.dart';
import 'package:shoes_app/utils/shared/Shimmers/CShimmerEffect.dart';

class CCategoryShimmer extends StatelessWidget {
  const CCategoryShimmer({
    super.key,
    this.itemcount = 6,
  });

  final int itemcount;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: itemcount,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return const Column(
            children: [
              Flexible(
                  child: CShimmerEffect(width: 55, height: 55, radius: 55)),
              SizedBox(height: CSizes.spaceBtwItems / 2),
              Flexible(child: CShimmerEffect(width: 55, height: 55)),
            ],
          );
        },
      ),
    );
  }
}
