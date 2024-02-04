import 'package:flutter/material.dart';
import 'package:shoes_app/Views/Cart/Widgets/CartItem.dart';
import 'package:shoes_app/utils/constants/sizes.dart';

class CheckoutItems extends StatelessWidget {
  const CheckoutItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (context, index) =>
          const SizedBox(height: CSizes.defaultSpace),
      itemCount: 2,
      itemBuilder: (context, index) {
        return const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CCartItem(),
          ],
        );
      },
    );
  }
}
