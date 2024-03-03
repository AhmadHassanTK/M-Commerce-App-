import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shoes_app/Models/Controller/AddressController.dart';
import 'package:shoes_app/Models/Model/AddressModel.dart';
import 'package:shoes_app/utils/constants/colors.dart';
import 'package:shoes_app/utils/constants/sizes.dart';
import 'package:shoes_app/utils/helpers/helper_functions.dart';
import 'package:shoes_app/utils/shared/CRoundedContainer.dart';

class AddressContainer extends StatelessWidget {
  const AddressContainer({
    super.key,
    required this.addressmodel,
    required this.onTap,
  });
  final AddressModel addressmodel;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    final controller = AddressController.instance;
    final dark = CHelperFunctions.isDarkMode(context);

    return Obx(
      () {
        final selectedAddressId = controller.selectedAddress.value.id;
        final selectedAddress = selectedAddressId == addressmodel.id;
        return GestureDetector(
          onTap: onTap,
          child: CRoundedContainer(
            width: double.infinity,
            margin: const EdgeInsets.only(bottom: CSizes.spaceBtwItems),
            backgroundcolor: selectedAddress
                ? CColors.primary.withOpacity(0.5)
                : Colors.transparent,
            padding: const EdgeInsets.all(CSizes.md),
            showborder: true,
            bordercolor: selectedAddress
                ? Colors.transparent
                : dark
                    ? CColors.darkerGrey
                    : CColors.grey,
            child: Stack(
              children: [
                Positioned(
                  right: 8,
                  top: 0,
                  child: Icon(selectedAddress ? Iconsax.tick_circle5 : null,
                      color: selectedAddress
                          ? dark
                              ? CColors.light
                              : CColors.dark
                          : null),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      addressmodel.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: CSizes.sm / 2),
                    Text(
                      addressmodel.phoneNumber,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: CSizes.sm / 2),
                    Text(
                      addressmodel.toString(),
                      softWrap: true,
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
