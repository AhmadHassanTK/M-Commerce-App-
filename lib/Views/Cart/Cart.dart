import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_app/Views/Cart/Widgets/CartItem.dart';
import 'package:shoes_app/Views/Checkout/CheckOut.dart';
import 'package:shoes_app/utils/constants/sizes.dart';
import 'package:shoes_app/utils/shared/CAppBar.dart';
import 'package:shoes_app/utils/shared/CPlusAndMinusButtons.dart';
import 'package:shoes_app/utils/shared/CProductPriceText.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(CSizes.sm),
        child: ElevatedButton(
          onPressed: () => Get.to(() => const CheckoutView()),
          child: const Text('Checkout \$256'),
        ),
      ),
      appBar: const CAppBar(
        title: Text('Cart'),
        showbackarrow: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(CSizes.defaultSpace),
        child: ListView.separated(
          shrinkWrap: true,
          separatorBuilder: (context, index) =>
              const SizedBox(height: CSizes.defaultSpace),
          itemCount: 10,
          itemBuilder: (context, index) {
            return const Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CCartItem(),
                SizedBox(height: CSizes.spaceBtwItems),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(width: 70),
                        CPlusAndMinusButtons(),
                      ],
                    ),
                    CProductPriceText(price: '256')
                  ],
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
