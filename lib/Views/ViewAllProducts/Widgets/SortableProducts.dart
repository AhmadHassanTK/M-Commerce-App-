import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shoes_app/Models/Controller/ProductController.dart';
import 'package:shoes_app/Views/Home/Screens/Widgets/ProductItemV.dart';
import 'package:shoes_app/utils/constants/sizes.dart';
import 'package:shoes_app/utils/shared/CGridView.dart';
import 'package:shoes_app/utils/shared/CVerticalShimmerEffect.dart';

class SortableProducts extends StatelessWidget {
  const SortableProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final productController = Get.put(ProductController());

    return Column(
      children: [
        DropdownButtonFormField(
          items: [
            'Name',
            'Higher Price',
            'Lower Price',
            'Sale',
            'Newest',
            'Popularity'
          ].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
          onChanged: (value) {},
          decoration: const InputDecoration(
            prefixIcon: Icon(Iconsax.sort),
          ),
        ),
        const SizedBox(height: CSizes.spaceBtwSections),
        Obx(() {
          if (productController.isloading.value) {
            return const CVerticalShimmerEffect();
          }
          if (productController.allProducts.isEmpty) {
            return Center(
              child: Text(
                'No Data Found!',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            );
          }
          return CGridView(
            itemcount: productController.allProducts.length,
            itembuilder: (context, index) {
              return CProductItemV(
                product: productController.allProducts[index],
              );
            },
          );
        })
      ],
    );
  }
}
