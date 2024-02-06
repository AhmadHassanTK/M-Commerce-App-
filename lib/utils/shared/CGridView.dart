import 'package:flutter/material.dart';
import 'package:shoes_app/utils/constants/sizes.dart';

class CGridView extends StatelessWidget {
  const CGridView({
    super.key,
    required this.itemcount,
    required this.child,
    this.mainaxisextent = 288,
  });

  final int itemcount;
  final Widget child;
  final double mainaxisextent;

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
      itemBuilder: (context, index) {
        return child;
      },
    );
  }
}
