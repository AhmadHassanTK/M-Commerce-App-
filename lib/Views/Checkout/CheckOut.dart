import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_app/Models/Controller/CartController.dart';
import 'package:shoes_app/Models/Controller/OrderController.dart';
import 'package:shoes_app/Views/Checkout/Widgets/AddressSection.dart';
import 'package:shoes_app/Views/Checkout/Widgets/AmountSection.dart';
import 'package:shoes_app/Views/Checkout/Widgets/PaymentSection.dart';
import 'package:shoes_app/Views/Checkout/Widgets/checkoutItems.dart';
import 'package:shoes_app/utils/constants/colors.dart';
import 'package:shoes_app/utils/constants/sizes.dart';
import 'package:shoes_app/utils/helpers/pricing_calculator.dart';
import 'package:shoes_app/utils/shared/CAppBar.dart';
import 'package:shoes_app/utils/shared/CCouponCode.dart';
import 'package:shoes_app/utils/shared/CRoundedContainer.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    final cartcontroller = CartController.instance;
    final ordercontroller = Get.put(OrderController());
    final subtotal = cartcontroller.totalCartPrice.value;
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(CSizes.sm),
        child: ElevatedButton(
          onPressed: () => ordercontroller.processOrder(subtotal),
          child: Text(
              'Checkout \$${TPricingCalculator.calculateTotalPrice(subtotal, 'US')}'),
        ),
      ),
      appBar: CAppBar(
        title: Text(
          'Order Review',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        showbackarrow: true,
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(CSizes.defaultSpace),
          child: Column(
            children: [
              CheckoutItems(),
              SizedBox(height: CSizes.spaceBtwSections),
              CCouponCode(),
              SizedBox(height: CSizes.spaceBtwSections),
              CRoundedContainer(
                showborder: true,
                bordercolor: CColors.grey,
                padding: EdgeInsets.all(CSizes.md),
                child: Column(
                  children: [
                    AmountSection(),
                    SizedBox(height: CSizes.spaceBtwItems / 2),
                    Divider(),
                    SizedBox(height: CSizes.spaceBtwItems / 2),
                    PaymentSection(),
                    SizedBox(height: CSizes.spaceBtwItems / 2),
                    AddressSection(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
