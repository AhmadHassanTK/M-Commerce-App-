import 'package:flutter/material.dart';
import 'package:shoes_app/utils/constants/colors.dart';
import 'package:shoes_app/utils/constants/sizes.dart';
import 'package:shoes_app/utils/helpers/helper_functions.dart';
import 'package:shoes_app/utils/shared/CRoundedContainer.dart';

class CCouponCode extends StatelessWidget {
  const CCouponCode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = CHelperFunctions.isDarkMode(context);
    return CRoundedContainer(
      showborder: true,
      backgroundcolor: dark ? CColors.dark : CColors.white,
      padding: const EdgeInsets.only(
        right: CSizes.sm,
        top: CSizes.sm,
        bottom: CSizes.sm,
        left: CSizes.md,
      ),
      child: Row(
        children: [
          Flexible(
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Have a promo code? Enter here',
                hintStyle: TextStyle(fontSize: 13),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                foregroundColor: dark
                    ? CColors.white.withOpacity(0.5)
                    : CColors.black.withOpacity(0.5),
                backgroundColor: CColors.grey.withOpacity(0.2),
                side: BorderSide(
                  color: CColors.grey.withOpacity(0.1),
                )),
            child: const Text('Apply'),
          )
        ],
      ),
    );
  }
}
