// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_app/Models/Controller/ProductController.dart';
import 'package:shoes_app/Views/Home/Screens/Widgets/CategoriesListView.dart';
import 'package:shoes_app/Views/Home/Screens/Widgets/HomeAppBar.dart';
import 'package:shoes_app/Views/Home/Screens/Widgets/HomePromoSlider.dart';
import 'package:shoes_app/Views/Home/Screens/Widgets/ProductItemV.dart';
import 'package:shoes_app/Views/ViewAllProducts/ViewAllProducts.dart';
import 'package:shoes_app/utils/constants/colors.dart';
import 'package:shoes_app/utils/constants/sizes.dart';
import 'package:shoes_app/utils/shared/CGridView.dart';
import 'package:shoes_app/utils/shared/CPrimaryHeaderContainer.dart';
import 'package:shoes_app/utils/shared/CSearchBar.dart';
import 'package:shoes_app/utils/shared/CSectionTitle.dart';
import 'package:shoes_app/utils/shared/CVerticalShimmerEffect.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productController = Get.put(ProductController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CPrimaryHeaderContainer(
              child: Column(
                children: [
                  HomeAppBar(),
                  SizedBox(height: CSizes.spaceBtwSections),
                  CSearchBar(
                    text: 'Search in Store',
                    showbackground: true,
                    showborder: true,
                  ),
                  SizedBox(height: CSizes.spaceBtwSections),
                  Padding(
                    padding: const EdgeInsets.only(left: CSizes.defaultSpace),
                    child: Column(
                      children: [
                        CSectionTitle(
                          title: 'Popular Categories',
                          showactionbutton: false,
                          textcolor: CColors.white,
                        ),
                        SizedBox(height: CSizes.spaceBtwItems),
                        CategoriesListView(),
                      ],
                    ),
                  ),
                  SizedBox(height: CSizes.spaceBtwItems / 0.3),
                ],
              ),
            ),
            HomePromoSlider(),
            SizedBox(height: CSizes.spaceBtwSections),
            Padding(
              padding: const EdgeInsets.only(left: CSizes.defaultSpace),
              child: CSectionTitle(
                title: 'Popular Products',
                showactionbutton: true,
                onPressed: () => Get.to(() => ViewAllProductsScreen(
                      title: 'Popular Products',
                      query: FirebaseFirestore.instance
                          .collection('Products')
                          .where('isFeatured', isEqualTo: true)
                          .limit(6),
                      futuremethod:
                          productController.fetchAllFeaturedProducts(),
                    )),
              ),
            ),
            Padding(
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
              }),
            )
          ],
        ),
      ),
    );
  }
}
