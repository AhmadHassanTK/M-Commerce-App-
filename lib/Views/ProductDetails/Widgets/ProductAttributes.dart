import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_app/Models/Model/ProductModel.dart';
import 'package:shoes_app/Views/ProductDetails/Controller/VariationController.dart';
import 'package:shoes_app/utils/constants/colors.dart';
import 'package:shoes_app/utils/constants/sizes.dart';
import 'package:shoes_app/utils/helpers/helper_functions.dart';
import 'package:shoes_app/utils/shared/CChoiceChip.dart';
import 'package:shoes_app/utils/shared/CProductPriceText.dart';
import 'package:shoes_app/utils/shared/CProductTitleText.dart';
import 'package:shoes_app/utils/shared/CRoundedContainer.dart';
import 'package:shoes_app/utils/shared/CSectionTitle.dart';

class ProductAttributes extends StatelessWidget {
  const ProductAttributes({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = CHelperFunctions.isDarkMode(context);
    final controller = Get.put(VariationController());
    return Obx(
      () => Column(
        children: [
          if (controller.selectedVariationG.value.id.isNotEmpty)
            CRoundedContainer(
              backgroundcolor: dark ? CColors.darkGrey : CColors.grey,
              padding: const EdgeInsets.all(CSizes.md),
              margin: const EdgeInsets.all(CSizes.md),
              radius: 20,
              child: Column(
                children: [
                  Row(
                    children: [
                      const CSectionTitle(
                        title: 'Variation',
                        showactionbutton: false,
                      ),
                      const SizedBox(width: CSizes.md),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const CProductTitleText(
                                  title: 'price :', smallsize: true),
                              const SizedBox(width: CSizes.sm),
                              if (controller
                                      .selectedVariationG.value.salePrice >
                                  0)
                                Text(
                                  '\$${controller.selectedVariationG.value.price}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .apply(
                                        decoration: TextDecoration.lineThrough,
                                      ),
                                ),
                              const SizedBox(width: CSizes.spaceBtwItems),
                              CProductPriceText(
                                price: controller.getVariationPrice(),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              const CProductTitleText(
                                  title: 'Stock :', smallsize: true),
                              const SizedBox(width: CSizes.sm),
                              Text(
                                controller.variationstockstatue.value,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: CSizes.spaceBtwItems / 2),
                  CProductTitleText(
                    title:
                        controller.selectedVariationG.value.description ?? '',
                    maxlines: 4,
                    smallsize: true,
                  )
                ],
              ),
            ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: CSizes.defaultSpace),
            child: Column(
                children: product.productAttributes!
                    .map(
                      (attribute) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CSectionTitle(
                              title: attribute.name ?? '',
                              showactionbutton: false),
                          const SizedBox(height: CSizes.spaceBtwItems / 2),
                          Obx(
                            () => Wrap(
                              spacing: 8,
                              children: attribute.values!.map((attributeValue) {
                                final isSelected = controller
                                        .selectedAttriutesM[attribute.name] ==
                                    attributeValue;
                                final avaliable = controller
                                    .getAttributesAvailabilityInVariation(
                                        product.productVariation!,
                                        attribute.name!)
                                    .contains(attributeValue);
                                return CChoiceChip(
                                  text: attributeValue,
                                  selected: isSelected,
                                  onselected: avaliable
                                      ? (selected) {
                                          if (selected && avaliable) {
                                            controller.onAttributeSelection(
                                              product,
                                              attribute.name ?? '',
                                              attributeValue,
                                            );
                                          }
                                        }
                                      : null,
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                    )
                    .toList()),
          )
        ],
      ),
    );
  }
}
