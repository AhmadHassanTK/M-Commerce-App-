import 'package:flutter/material.dart';

class CProductPriceText extends StatelessWidget {
  const CProductPriceText({
    super.key,
    required this.price,
    this.currancysign = '\$',
    this.islarge = false,
    this.linethrough = false,
    this.maxlines = 1,
  });

  final String currancysign;
  final String price;
  final bool islarge;
  final bool linethrough;
  final int maxlines;
  @override
  Widget build(BuildContext context) {
    return Text(
      currancysign + price,
      maxLines: maxlines,
      overflow: TextOverflow.ellipsis,
      style: islarge
          ? Theme.of(context).textTheme.headlineMedium!.apply(
              decoration: linethrough ? TextDecoration.lineThrough : null)
          : Theme.of(context).textTheme.titleLarge!.apply(
              decoration: linethrough ? TextDecoration.lineThrough : null),
    );
  }
}
