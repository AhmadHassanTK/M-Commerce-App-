import 'package:flutter/material.dart';
import 'package:shoes_app/Models/Controller/CartController.dart';
import 'package:shoes_app/utils/constants/sizes.dart';
import 'package:shoes_app/utils/helpers/pricing_calculator.dart';

class AmountSection extends StatelessWidget {
  const AmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    final cartcontroller = CartController.instance;
    final subtotal = cartcontroller.totalCartPrice.value;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Subtotal',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              '\$$subtotal',
              style: Theme.of(context).textTheme.labelLarge,
            )
          ],
        ),
        const SizedBox(height: CSizes.spaceBtwItems / 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Shipping Fee',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              '\$${TPricingCalculator.calculateShippingCost(subtotal, 'US')}',
              style: Theme.of(context).textTheme.labelLarge,
            )
          ],
        ),
        const SizedBox(height: CSizes.spaceBtwItems / 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Tax Fee',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              '\$${TPricingCalculator.calculateTax(subtotal, 'US')}',
              style: Theme.of(context).textTheme.labelLarge,
            )
          ],
        ),
        const SizedBox(height: CSizes.spaceBtwItems / 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Subtotal',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              '\$${TPricingCalculator.calculateTotalPrice(subtotal, 'US')}',
              style: Theme.of(context).textTheme.labelLarge,
            )
          ],
        ),
      ],
    );
  }
}
