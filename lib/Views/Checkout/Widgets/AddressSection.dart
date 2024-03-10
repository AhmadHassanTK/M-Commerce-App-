import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_app/Models/Controller/AddressController.dart';
import 'package:shoes_app/utils/constants/colors.dart';
import 'package:shoes_app/utils/constants/sizes.dart';
import 'package:shoes_app/utils/shared/CSectionTitle.dart';

class AddressSection extends StatelessWidget {
  const AddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddressController());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CSectionTitle(
          title: 'Shipping Address',
          buttontitle: 'Change',
          onPressed: () => controller.selectNewAddressPopup(context),
        ),
        controller.selectedAddress.value.id.isNotEmpty
            ? Obx(
                () => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      controller.selectedAddress.value.name,
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
                          controller.selectedAddress.value.phoneNumber,
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
                            controller.selectedAddress.value.toString(),
                            style: Theme.of(context).textTheme.bodyMedium,
                            softWrap: true,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            : Text('Select Address',
                style: Theme.of(context).textTheme.bodyMedium)
      ],
    );
  }
}
