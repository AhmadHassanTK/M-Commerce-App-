// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:get/get.dart';
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

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                onPressed: () => Get.to(() => ViewAllProductsScreen()),
              ),
            ),
            CGridView(
              itemcount: 4,
              child: CProductItemV(),
            )
          ],
        ),
      ),
    );
  }
}
