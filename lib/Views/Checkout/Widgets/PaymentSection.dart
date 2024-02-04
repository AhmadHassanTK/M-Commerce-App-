import 'package:flutter/material.dart';
import 'package:shoes_app/utils/constants/colors.dart';
import 'package:shoes_app/utils/constants/image_strings.dart';
import 'package:shoes_app/utils/constants/sizes.dart';
import 'package:shoes_app/utils/helpers/helper_functions.dart';
import 'package:shoes_app/utils/shared/CRoundedContainer.dart';
import 'package:shoes_app/utils/shared/CSectionTitle.dart';

class PaymentSection extends StatelessWidget {
  const PaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = CHelperFunctions.isDarkMode(context);

    return Column(
      children: [
        const CSectionTitle(
          title: 'Payment Method',
          buttontitle: 'Change',
        ),
        const SizedBox(height: CSizes.spaceBtwItems / 2),
        Row(
          children: [
            CRoundedContainer(
              width: 60,
              height: 35,
              padding: const EdgeInsets.all(CSizes.sm),
              backgroundcolor: dark ? CColors.light : CColors.white,
              child: const Image(
                image: AssetImage(CImages.paypal),
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(width: CSizes.spaceBtwItems / 2),
            Text(
              'PayPal',
              style: Theme.of(context).textTheme.bodyLarge,
            )
          ],
        )
      ],
    );
  }
}
