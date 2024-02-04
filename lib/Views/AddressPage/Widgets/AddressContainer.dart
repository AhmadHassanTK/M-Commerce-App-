import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shoes_app/utils/constants/colors.dart';
import 'package:shoes_app/utils/constants/sizes.dart';
import 'package:shoes_app/utils/helpers/helper_functions.dart';
import 'package:shoes_app/utils/shared/CRoundedContainer.dart';

class AddressContainer extends StatelessWidget {
  const AddressContainer({
    super.key,
    required this.selectedaddress,
  });
  final bool selectedaddress;
  @override
  Widget build(BuildContext context) {
    final dark = CHelperFunctions.isDarkMode(context);
    return CRoundedContainer(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: CSizes.spaceBtwItems),
      backgroundcolor: selectedaddress
          ? CColors.primary.withOpacity(0.5)
          : Colors.transparent,
      padding: const EdgeInsets.all(CSizes.md),
      showborder: true,
      bordercolor: selectedaddress
          ? Colors.transparent
          : dark
              ? CColors.darkerGrey
              : CColors.grey,
      child: Stack(
        children: [
          Positioned(
            right: 8,
            top: 0,
            child: Icon(selectedaddress ? Iconsax.tick_circle5 : null,
                color: selectedaddress
                    ? dark
                        ? CColors.light
                        : CColors.dark
                    : null),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Ahmad Taha',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: CSizes.sm / 2),
              const Text(
                '(+20)1145615820',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: CSizes.sm / 2),
              const Text(
                '22 k hadayek al ahram , giza , egypt',
                softWrap: true,
              ),
            ],
          )
        ],
      ),
    );
  }
}
