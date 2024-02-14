// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';
import 'package:shoes_app/Models/Model/ProductModel.dart';
import 'package:shoes_app/Views/ProductDetails/Widgets/ProductAttributes.dart';
import 'package:shoes_app/Views/ProductDetails/Widgets/ProductBottomBar.dart';

import 'package:shoes_app/Views/ProductDetails/Widgets/ProductMetaData.dart';
import 'package:shoes_app/Views/ProductDetails/Widgets/UpperContainer.dart';
import 'package:shoes_app/Views/Reviews&Rating/Reviews&Rating.dart';
import 'package:shoes_app/utils/constants/sizes.dart';

import 'package:shoes_app/utils/shared/CSectionTitle.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({
    required this.product,
    super.key,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: ProductBottomBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              UpperContainer(),
              ProductMetaData(),
              ProductAttributes(),
              SizedBox(height: CSizes.spaceBtwItems),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: CSizes.defaultSpace),
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text('Checkout'),
                      ),
                    ),
                    SizedBox(height: CSizes.spaceBtwSections),
                    CSectionTitle(
                      title: 'Description',
                      showactionbutton: false,
                    ),
                    SizedBox(height: CSizes.spaceBtwItems),
                    ReadMoreText(
                      'Amazon went public in May 1997. It began selling music and videos in 1998, and began international operations by acquiring online sellers of books in the United Kingdom and Germany. In the subsequent year, it initiated the sale of a diverse range of products, including music, video games, consumer electronics, home improvement items, software, games, and toys',
                      trimLines: 2,
                      trimMode: TrimMode.Line,
                      trimCollapsedText: ' Show more',
                      trimExpandedText: '  Less',
                      moreStyle:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                      lessStyle:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    ),
                    Divider(),
                    SizedBox(height: CSizes.spaceBtwItems),
                    CSectionTitle(
                      title: 'Reviews(199)',
                      onPressed: () {
                        Get.to(() => ReviewsRating());
                      },
                    ),
                    SizedBox(height: CSizes.spaceBtwSections),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
