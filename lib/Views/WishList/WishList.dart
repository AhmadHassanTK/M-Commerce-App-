import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shoes_app/Models/Controller/ProductController.dart';
import 'package:shoes_app/Views/Home/Screens/Home.dart';
import 'package:shoes_app/Views/Home/Screens/Widgets/ProductItemV.dart';
import 'package:shoes_app/utils/constants/sizes.dart';
import 'package:shoes_app/utils/shared/CAppBar.dart';
import 'package:shoes_app/utils/shared/CGridView.dart';
import 'package:shoes_app/utils/shared/CVerticalShimmerEffect.dart';

class WishListView extends StatelessWidget {
  const WishListView({super.key});

  @override
  Widget build(BuildContext context) {
    final productController = Get.put(ProductController());

    return SafeArea(
      child: Scaffold(
        appBar: CAppBar(
          title: Text(
            'Wishlist',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: [
            IconButton(
              onPressed: () => Get.to(() => const HomeScreen()),
              icon: const Icon(Iconsax.add),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(CSizes.defaultSpace),
              child: Obx(() {
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
              })),
        ),
      ),
    );
  }
}
