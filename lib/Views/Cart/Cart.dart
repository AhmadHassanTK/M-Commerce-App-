import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_app/Models/Controller/CartController.dart';
import 'package:shoes_app/Views/Cart/Widgets/CartItem.dart';
import 'package:shoes_app/Views/Checkout/CheckOut.dart';
import 'package:shoes_app/Views/NavigationMenu/Screens/NavigationMenu.dart';
import 'package:shoes_app/utils/animantion/animationLoader.dart';
import 'package:shoes_app/utils/constants/image_strings.dart';
import 'package:shoes_app/utils/constants/sizes.dart';
import 'package:shoes_app/utils/shared/CAppBar.dart';
import 'package:shoes_app/utils/shared/CPlusAndMinusButtons.dart';
import 'package:shoes_app/utils/shared/CProductPriceText.dart';

class CartView extends StatelessWidget {
  const CartView({
    super.key,
    this.showAddRemoveButtons = true,
  });

  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    final cartcontroller = CartController.instance;
    return Scaffold(
      bottomNavigationBar: cartcontroller.cartItems.isEmpty
          ? const SizedBox()
          : Padding(
              padding: const EdgeInsets.all(CSizes.sm),
              child: ElevatedButton(
                onPressed: () => Get.to(() => const CheckoutView()),
                child: Obx(() =>
                    Text('Checkout \$${cartcontroller.totalCartPrice.value}')),
              ),
            ),
      appBar: const CAppBar(
        title: Text('Cart'),
        showbackarrow: true,
      ),
      body: Obx(() {
        final emptywidget = CAnimationLoader(
          text: 'Whoops! Cart is EMPTY.',
          animation: CImages.cartAnimation,
          showAction: true,
          actiontext: 'Let\'s fill it',
          onActionPressed: () => Get.off(() => const NavigationMenu()),
        );

        if (cartcontroller.cartItems.isEmpty) {
          return emptywidget;
        } else {
          return Padding(
            padding: const EdgeInsets.all(CSizes.defaultSpace),
            child: ListView.separated(
              shrinkWrap: true,
              separatorBuilder: (context, index) =>
                  const SizedBox(height: CSizes.defaultSpace),
              itemCount: cartcontroller.cartItems.length,
              itemBuilder: (context, index) {
                return Obx(() {
                  final items = cartcontroller.cartItems;
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CCartItem(item: items[index]),
                      if (showAddRemoveButtons)
                        const SizedBox(height: CSizes.spaceBtwItems),
                      if (showAddRemoveButtons)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const SizedBox(width: 70),
                                CPlusAndMinusButtons(
                                  quantity: items[index].quantity,
                                  add: () =>
                                      cartcontroller.addOneToCart(items[index]),
                                  remove: () => cartcontroller
                                      .removeOneFromCart(items[index]),
                                ),
                              ],
                            ),
                            CProductPriceText(
                                price:
                                    (items[index].price * items[index].quantity)
                                        .toStringAsFixed(1))
                          ],
                        )
                    ],
                  );
                });
              },
            ),
          );
        }
      }),
    );
  }
}
