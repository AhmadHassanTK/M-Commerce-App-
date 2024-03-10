import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_app/Views/Checkout/Controller/CheckoutController.dart';
import 'package:shoes_app/utils/constants/colors.dart';
import 'package:shoes_app/utils/constants/sizes.dart';
import 'package:shoes_app/utils/helpers/helper_functions.dart';
import 'package:shoes_app/utils/shared/CRoundedContainer.dart';
import 'package:shoes_app/utils/shared/CSectionTitle.dart';

class PaymentSection extends StatelessWidget {
  const PaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = CHelperFunctions.isDarkMode(context);
    final checkoutcontroller = Get.put(CheckOutController());
    return Column(
      children: [
        CSectionTitle(
          title: 'Payment Method',
          buttontitle: 'Change',
          onPressed: () => checkoutcontroller.selectPaymentMethod(context),
        ),
        const SizedBox(height: CSizes.spaceBtwItems / 2),
        Obx(
          () => Row(
            children: [
              CRoundedContainer(
                width: 60,
                height: 35,
                padding: const EdgeInsets.all(CSizes.sm),
                backgroundcolor: dark ? CColors.light : CColors.white,
                child: Image(
                  image: AssetImage(
                      checkoutcontroller.selectedPaymentMethod.value.image),
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(width: CSizes.spaceBtwItems / 2),
              Text(
                checkoutcontroller.selectedPaymentMethod.value.name,
                style: Theme.of(context).textTheme.bodyLarge,
              )
            ],
          ),
        )
      ],
    );
  }
}
