import 'package:flutter/material.dart';
import 'package:shoes_app/utils/constants/sizes.dart';

class CGridView extends StatelessWidget {
  const CGridView({
    super.key,
    required this.itemcount,
    this.mainaxisextent = 288,
    required this.itembuilder,
  });

  final int itemcount;
  final double mainaxisextent;
  final Widget? Function(BuildContext, int) itembuilder;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: itemcount,
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: CSizes.gridViewSpacing,
        mainAxisSpacing: CSizes.gridViewSpacing,
        mainAxisExtent: mainaxisextent,
      ),
      itemBuilder: itembuilder,
    );
  }
}
