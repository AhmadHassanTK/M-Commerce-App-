import 'package:flutter/material.dart';
import 'package:shoes_app/Models/Controller/CartController.dart';
import 'package:shoes_app/Views/Cart/Widgets/CartItem.dart';
import 'package:shoes_app/utils/constants/sizes.dart';

class CheckoutItems extends StatelessWidget {
  const CheckoutItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (context, index) =>
          const SizedBox(height: CSizes.defaultSpace),
      itemCount: controller.cartItems.length,
      itemBuilder: (context, index) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CCartItem(item: controller.cartItems[index]),
          ],
        );
      },
    );
  }
}
