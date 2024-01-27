// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:shoes_app/Views/Home/Screens/Widgets/CategoriesListView.dart';
import 'package:shoes_app/Views/Home/Screens/Widgets/HomeAppBar.dart';
import 'package:shoes_app/Views/Home/Screens/Widgets/HomeBase.dart';
import 'package:shoes_app/Views/Home/Screens/Widgets/HomePromoSlider.dart';
import 'package:shoes_app/Views/Home/Screens/Widgets/ProductItem.dart';
import 'package:shoes_app/utils/constants/colors.dart';
import 'package:shoes_app/utils/constants/sizes.dart';
import 'package:shoes_app/utils/helpers/helper_functions.dart';
import 'package:shoes_app/utils/shared/CSearchBar.dart';
import 'package:shoes_app/utils/shared/CSectionHeading.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HomeBase(
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
                        CSectionHeading(
                          title: 'Popular Categories',
                          showactionbutton: false,
                          textcolor: CColors.white,
                        ),
                        SizedBox(height: CSizes.spaceBtwItems),
                        CategoriesListView(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            HomePromoSlider(),
            SizedBox(height: CSizes.spaceBtwSections),
            GridView.builder(
              itemCount: 4,
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: CSizes.lg),
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: CSizes.gridViewSpacing,
                mainAxisSpacing: CSizes.gridViewSpacing,
                mainAxisExtent: 288,
              ),
              itemBuilder: (context, index) {
                return CProductItem();
              },
            )
          ],
        ),
      ),
    );
  }
}
