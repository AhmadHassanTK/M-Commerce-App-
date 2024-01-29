// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shoes_app/Views/Home/Screens/Widgets/ProductItem.dart';
import 'package:shoes_app/utils/constants/colors.dart';
import 'package:shoes_app/utils/constants/image_strings.dart';
import 'package:shoes_app/utils/constants/sizes.dart';
import 'package:shoes_app/utils/helpers/helper_functions.dart';
import 'package:shoes_app/utils/shared/CAppBar.dart';
import 'package:shoes_app/utils/shared/CBrandShow.dart';
import 'package:shoes_app/utils/shared/CGridView.dart';
import 'package:shoes_app/utils/shared/CProductContainer.dart';
import 'package:shoes_app/utils/shared/CSearchBar.dart';
import 'package:shoes_app/utils/shared/CSectionTitle.dart';
import 'package:shoes_app/utils/shared/CShoppingBagIcon.dart';
import 'package:shoes_app/utils/shared/CTabBar.dart';

class StoreView extends StatelessWidget {
  const StoreView({super.key});

  @override
  Widget build(BuildContext context) {
    final isdark = CHelperFunctions.isDarkMode(context);
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: CAppBar(
          title: Text(
            'Store',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: [
            CShoppingCartIcon(
              onPressed: () {},
            )
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: isdark ? CColors.black : CColors.white,
                expandedHeight: 440,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(CSizes.defaultSpace),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: const [
                      SizedBox(height: CSizes.spaceBtwItems),
                      CSearchBar(
                        text: 'Search in Store',
                        showbackground: false,
                        showborder: true,
                        padding: EdgeInsets.zero,
                      ),
                      SizedBox(height: CSizes.spaceBtwItems),
                      CSectionTitle(
                        title: 'Featured Brands',
                        showactionbutton: true,
                      ),
                      SizedBox(height: CSizes.spaceBtwItems / 2),
                      CGridView(
                        itemcount: 4,
                        mainaxisextent: 80,
                        child: CProductContainer(),
                      ),
                    ],
                  ),
                ),
                bottom: const CTabBar(
                  tabs: [
                    Tab(child: Text('Sports')),
                    Tab(child: Text('Furniture')),
                    Tab(child: Text('Electronics')),
                    Tab(child: Text('Clothes')),
                    Tab(child: Text('Cosmetics')),
                  ],
                ),
              ),
            ];
          },
          body: TabBarView(children: [
            ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  Padding(
                    padding: EdgeInsets.all(CSizes.defaultSpace),
                    child: Column(
                      children: [
                        CBrandShow(images: [
                          CImages.productImage1,
                          CImages.productImage2,
                          CImages.productImage3
                        ]),
                        CBrandShow(images: [
                          CImages.productImage1,
                          CImages.productImage2,
                          CImages.productImage3
                        ]),
                        CSectionTitle(title: 'You might like'),
                        SizedBox(height: CSizes.spaceBtwItems),
                        CGridView(
                          child: CProductItem(),
                          itemcount: 4,
                        ),
                      ],
                    ),
                  ),
                ]),
            Padding(
              padding: EdgeInsets.all(CSizes.defaultSpace),
              child: Column(
                children: [
                  CBrandShow(images: [
                    CImages.productImage1,
                    CImages.productImage2,
                    CImages.productImage3
                  ]),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(CSizes.defaultSpace),
              child: Column(
                children: [
                  CBrandShow(images: [
                    CImages.productImage1,
                    CImages.productImage2,
                    CImages.productImage3
                  ]),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(CSizes.defaultSpace),
              child: Column(
                children: [
                  CBrandShow(images: [
                    CImages.productImage1,
                    CImages.productImage2,
                    CImages.productImage3
                  ]),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(CSizes.defaultSpace),
              child: Column(
                children: [
                  CBrandShow(images: [
                    CImages.productImage1,
                    CImages.productImage2,
                    CImages.productImage3
                  ]),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
