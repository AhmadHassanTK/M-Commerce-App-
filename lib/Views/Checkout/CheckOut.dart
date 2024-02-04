// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_app/Views/Checkout/Widgets/AddressSection.dart';
import 'package:shoes_app/Views/Checkout/Widgets/AmountSection.dart';
import 'package:shoes_app/Views/Checkout/Widgets/PaymentSection.dart';
import 'package:shoes_app/Views/Checkout/Widgets/checkoutItems.dart';
import 'package:shoes_app/Views/NavigationMenu/Screens/NavigationMenu.dart';
import 'package:shoes_app/utils/constants/colors.dart';
import 'package:shoes_app/utils/constants/image_strings.dart';
import 'package:shoes_app/utils/constants/sizes.dart';
import 'package:shoes_app/utils/shared/CAppBar.dart';
import 'package:shoes_app/utils/shared/CCouponCode.dart';
import 'package:shoes_app/utils/shared/CRoundedContainer.dart';
import 'package:shoes_app/utils/shared/CSuccessScreen.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(CSizes.sm),
        child: ElevatedButton(
          onPressed: () => Get.to(
            () => SuccessScreen(
              image: CImages.successfulPaymentIcon,
              subTitle: 'Your item will be shipped soon!',
              title: 'Payment Success!',
              onPressed: () => Get.offAll(() => const NavigationMenu()),
            ),
          ),
          child: const Text('Checkout \$256'),
        ),
      ),
      appBar: CAppBar(
        title: Text(
          'Order Review',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        showbackarrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CSizes.defaultSpace),
          child: Column(
            children: [
              const CheckoutItems(),
              const SizedBox(height: CSizes.spaceBtwSections),
              const CCouponCode(),
              const SizedBox(height: CSizes.spaceBtwSections),
              CRoundedContainer(
                showborder: true,
                bordercolor: CColors.grey,
                padding: const EdgeInsets.all(CSizes.md),
                child: Column(
                  children: [
                    AmountSection(),
                    const SizedBox(height: CSizes.spaceBtwItems / 2),
                    Divider(),
                    const SizedBox(height: CSizes.spaceBtwItems / 2),
                    PaymentSection(),
                    const SizedBox(height: CSizes.spaceBtwItems / 2),
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
