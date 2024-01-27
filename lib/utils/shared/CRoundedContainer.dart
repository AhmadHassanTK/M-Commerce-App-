import 'package:flutter/material.dart';
import 'package:shoes_app/utils/constants/colors.dart';
import 'package:shoes_app/utils/constants/sizes.dart';

class CRoundedContainer extends StatelessWidget {
  const CRoundedContainer({
    super.key,
    this.width,
    this.height,
    this.padding,
    this.radius = CSizes.productImageRadius,
    this.margin,
    this.backgroundcolor = CColors.white,
    this.child,
    this.bordercolor = CColors.borderPrimary,
    this.showborder = false,
  });

  final double? width, height;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double radius;
  final Color backgroundcolor;
  final Widget? child;
  final Color bordercolor;
  final bool showborder;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: backgroundcolor,
        border: showborder ? Border.all(color: bordercolor) : null,
      ),
      child: child,
    );
  }
}
