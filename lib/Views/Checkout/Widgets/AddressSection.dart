import 'package:flutter/material.dart';
import 'package:shoes_app/utils/constants/colors.dart';
import 'package:shoes_app/utils/constants/sizes.dart';
import 'package:shoes_app/utils/shared/CSectionTitle.dart';

class AddressSection extends StatelessWidget {
  const AddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CSectionTitle(
          title: 'Shipping Address',
          buttontitle: 'Change',
        ),
        Text(
          'Coding with T',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: CSizes.spaceBtwItems / 2),
        Row(
          children: [
            const Icon(
              Icons.phone,
              color: CColors.grey,
              size: 16,
            ),
            const SizedBox(width: CSizes.spaceBtwItems),
            Text(
              '+201145615820',
              style: Theme.of(context).textTheme.bodyMedium,
            )
          ],
        ),
        const SizedBox(height: CSizes.spaceBtwItems / 2),
        Row(
          children: [
            const Icon(
              Icons.location_history,
              color: CColors.grey,
              size: 16,
            ),
            const SizedBox(width: CSizes.spaceBtwItems),
            Expanded(
              child: Text(
                '22k, hadayek el ahram, Giza, Egypt',
                style: Theme.of(context).textTheme.bodyMedium,
                softWrap: true,
              ),
            )
          ],
        )
      ],
    );
  }
}
