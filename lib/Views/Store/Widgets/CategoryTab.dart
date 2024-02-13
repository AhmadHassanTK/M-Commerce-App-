import 'package:flutter/material.dart';
import 'package:shoes_app/Models/Model/CategoryModel.dart';
import 'package:shoes_app/Views/Home/Screens/Widgets/ProductItemV.dart';
import 'package:shoes_app/utils/constants/image_strings.dart';
import 'package:shoes_app/utils/constants/sizes.dart';
import 'package:shoes_app/utils/shared/CBrandShow.dart';
import 'package:shoes_app/utils/shared/CGridView.dart';
import 'package:shoes_app/utils/shared/CSectionTitle.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab({
    super.key,
    required this.category,
  });

  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    return ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
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
                  itemcount: 4,
                  child: CProductItemV(),
                ),
              ],
            ),
          ),
        ]);
  }
}
