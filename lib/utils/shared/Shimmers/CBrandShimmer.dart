import 'package:flutter/material.dart';
import 'package:shoes_app/utils/shared/CGridView.dart';
import 'package:shoes_app/utils/shared/Shimmers/CShimmerEffect.dart';

class CBrandShimmer extends StatelessWidget {
  const CBrandShimmer({
    super.key,
    this.itemcount = 4,
  });

  final int itemcount;

  @override
  Widget build(BuildContext context) {
    return CGridView(
      mainaxisextent: 80,
      itemcount: itemcount,
      itembuilder: (_, __) => const CShimmerEffect(width: 300, height: 80),
    );
  }
}
