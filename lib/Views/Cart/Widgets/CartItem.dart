import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shoes_app/Models/Model/CartItemModel.dart';
import 'package:shoes_app/utils/constants/colors.dart';
import 'package:shoes_app/utils/constants/sizes.dart';
import 'package:shoes_app/utils/helpers/helper_functions.dart';
import 'package:shoes_app/utils/shared/CProductTitleText.dart';
import 'package:shoes_app/utils/shared/CRoundedImage.dart';
import 'package:shoes_app/utils/shared/CVerfiedIconWithText.dart';

class CCartItem extends StatelessWidget {
  const CCartItem({
    super.key,
    required this.item,
  });

  final CartItemModel item;

  @override
  Widget build(BuildContext context) {
    final dark = CHelperFunctions.isDarkMode(context);

    return Row(
      children: [
        CRoundedImage(
          imageurl: item.image ?? '',
          isNetworkImage: true,
          height: 60,
          width: 60,
          padding: const EdgeInsets.all(CSizes.sm),
          backgroundcolor: dark ? CColors.darkGrey : CColors.grey,
        ),
        const SizedBox(width: CSizes.spaceBtwItems),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CVerifiedIconWithText(text: item.brandName ?? ''),
              CProductTitleText(
                title: item.title,
                maxlines: 1,
              ),
              Text.rich(
                TextSpan(
                  children: (item.selectedVariations ?? {})
                      .entries
                      .map(
                        (e) => TextSpan(children: [
                          TextSpan(
                              text: e.key + ' ',
                              style: Theme.of(context).textTheme.bodySmall),
                          TextSpan(
                              text: e.value + ' ',
                              style: Theme.of(context).textTheme.bodyLarge),
                        ]),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
