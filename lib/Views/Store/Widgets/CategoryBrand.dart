import 'package:flutter/material.dart';
import 'package:shoes_app/Models/Controller/BrandController.dart';
import 'package:shoes_app/Models/Model/CategoryModel.dart';
import 'package:shoes_app/utils/constants/sizes.dart';
import 'package:shoes_app/utils/helpers/cloud_helper_functions.dart';
import 'package:shoes_app/utils/shared/CBoxesShimmer.dart';
import 'package:shoes_app/utils/shared/CBrandShow.dart';
import 'package:shoes_app/utils/shared/CListTileShimmer.dart';

class CategoryBrands extends StatelessWidget {
  const CategoryBrands({
    super.key,
    required this.category,
  });

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return FutureBuilder(
        future: controller.getBrandForCategory(category.id),
        builder: (context, firstsnapshot) {
          const loader = Column(
            children: [
              CListTileShimmer(),
              SizedBox(height: CSizes.spaceBtwItems),
              CBoxesShimmer(),
              SizedBox(height: CSizes.spaceBtwItems),
            ],
          );

          final widget = CCloudHelperFunctions.checkMultiRecordState(
              snapshot: firstsnapshot, loader: loader);

          if (widget != null) return widget;

          print('snapshot.data!.length is ${firstsnapshot.data!.length}');

          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: firstsnapshot.data!.length,
            itemBuilder: (context, index) {
              final brand = firstsnapshot.data![index];
              print(brand.toJson());
              return FutureBuilder(
                  future: controller.getBrandProducts(brand.id),
                  builder: (context, snapshot) {
                    final widget = CCloudHelperFunctions.checkMultiRecordState(
                        snapshot: snapshot, loader: loader);

                    if (widget != null) return widget;
                    return CBrandShow(
                      brand: brand,
                      images: snapshot.data!.map((e) => e.thumbnail).toList(),
                    );
                  });
            },
          );
        });
  }
}
