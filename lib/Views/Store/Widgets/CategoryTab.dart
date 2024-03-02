import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shoes_app/Models/Controller/CategoryController.dart';
import 'package:shoes_app/Models/Model/CategoryModel.dart';
import 'package:shoes_app/Views/Home/Screens/Widgets/ProductItemV.dart';
import 'package:shoes_app/Views/Store/Widgets/CategoryBrand.dart';
import 'package:shoes_app/Views/ViewAllProducts/ViewAllProducts.dart';
import 'package:shoes_app/utils/constants/sizes.dart';
import 'package:shoes_app/utils/helpers/cloud_helper_functions.dart';
import 'package:shoes_app/utils/shared/CGridView.dart';
import 'package:shoes_app/utils/shared/CSectionTitle.dart';
import 'package:shoes_app/utils/shared/Shimmers/CVerticalShimmerEffect.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab({
    super.key,
    required this.category,
  });

  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryController());

    return ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.all(CSizes.defaultSpace),
            child: Column(
              children: [
                CategoryBrands(category: category),
                FutureBuilder(
                    future: controller.getCategoryProducts(category.id),
                    builder: (context, snapshot) {
                      print(snapshot.data);
                      final response =
                          CCloudHelperFunctions.checkMultiRecordState(
                              snapshot: snapshot,
                              loader: const CVerticalShimmerEffect());

                      if (response != null) return response;
                      return Column(
                        children: [
                          CSectionTitle(
                            title: 'You might like',
                            onPressed: () {
                              Get.to(() => ViewAllProductsScreen(
                                    title: category.name,
                                    futuremethod: controller
                                        .getCategoryProducts(category.id),
                                  ));
                            },
                          ),
                          const SizedBox(height: CSizes.spaceBtwItems),
                          CGridView(
                            itemcount: snapshot.data!.length,
                            itembuilder: (context, index) {
                              return CProductItemV(
                                product: snapshot.data![index],
                              );
                            },
                          ),
                        ],
                      );
                    }),
              ],
            ),
          ),
        ]);
  }
}
