import 'package:flutter/material.dart';
import 'package:shoes_app/utils/constants/sizes.dart';
import 'package:shoes_app/utils/shared/CRatingBar.dart';

class ProductRating extends StatelessWidget {
  const ProductRating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Text(
            '4.8',
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        const SizedBox(width: CSizes.spaceBtwItems),
        const Expanded(
          flex: 7,
          child: Column(
            children: [
              CRatingBar(text: "5", value: 1),
              CRatingBar(text: "4", value: 0.8),
              CRatingBar(text: "3", value: 0.6),
              CRatingBar(text: "2", value: 0.4),
              CRatingBar(text: "1", value: 0.2),
            ],
          ),
        )
      ],
    );
  }
}
