import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_app/Models/Controller/ProductController.dart';
import 'package:shoes_app/Models/Model/CategoryModel.dart';
import 'package:shoes_app/Views/Home/Screens/Widgets/ProductItemV.dart';
import 'package:shoes_app/Views/ViewAllProducts/ViewAllProducts.dart';
import 'package:shoes_app/utils/constants/image_strings.dart';
import 'package:shoes_app/utils/constants/sizes.dart';
import 'package:shoes_app/utils/shared/CBrandShow.dart';
import 'package:shoes_app/utils/shared/CGridView.dart';
import 'package:shoes_app/utils/shared/CSectionTitle.dart';
import 'package:shoes_app/utils/shared/CVerticalShimmerEffect.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab({
    super.key,
    required this.category,
  });

  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    final productController = Get.put(ProductController());

    return ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.all(CSizes.defaultSpace),
            child: Column(
              children: [
                const CBrandShow(
                  images: [
                    CImages.productImage1,
                    CImages.productImage2,
                    CImages.productImage3
                  ],
                ),
                const CBrandShow(images: [
                  CImages.productImage1,
                  CImages.productImage2,
                  CImages.productImage3
                ]),
                CSectionTitle(
                  title: 'You might like',
                  onPressed: () => Get.to(ViewAllProductsScreen(
                    title: 'Popular Products',
                    query: FirebaseFirestore.instance
                        .collection('Products')
                        .where('isFeatured', isEqualTo: true)
                        .limit(6),
                    futuremethod: productController.fetchAllFeaturedProducts(),
                  )),
                ),
                const SizedBox(height: CSizes.spaceBtwItems),
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
            ),
          ),
        ]);
  }
}
