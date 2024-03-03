import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shoes_app/Models/Controller/CategoryController.dart';
import 'package:shoes_app/Models/Model/CategoryModel.dart';
import 'package:shoes_app/Views/SubCategories/Widgets/ProductItemH.dart';
import 'package:shoes_app/Views/ViewAllProducts/ViewAllProducts.dart';
import 'package:shoes_app/utils/constants/image_strings.dart';
import 'package:shoes_app/utils/constants/sizes.dart';
import 'package:shoes_app/utils/helpers/cloud_helper_functions.dart';
import 'package:shoes_app/utils/shared/CAppBar.dart';
import 'package:shoes_app/utils/shared/CRoundedImage.dart';
import 'package:shoes_app/utils/shared/CSectionTitle.dart';
import 'package:shoes_app/utils/shared/Shimmers/CHorizontalShimmerEffecr.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;

    return Scaffold(
      appBar: CAppBar(
        title: Text(category.name),
        showbackarrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CSizes.defaultSpace),
          child: Column(
            children: [
              const CRoundedImage(
                imageurl: CImages.promoBanner3,
                width: double.infinity,
                roundedborder: true,
              ),
              const SizedBox(height: CSizes.spaceBtwSections),
              FutureBuilder(
                  future: controller.getSubCategories(category.id),
                  builder: (context, snapshot) {
                    final widget = CCloudHelperFunctions.checkMultiRecordState(
                        snapshot: snapshot,
                        loader: const CHorizaontalShimmerEffect());

                    if (widget != null) return widget;
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) => Column(
                              children: [
                                CSectionTitle(
                                  title: snapshot.data![index].name,
                                  onPressed: () => Get.to(
                                    () => ViewAllProductsScreen(
                                      title: snapshot.data![index].name,
                                      futuremethod:
                                          controller.getCategoryProducts(
                                              snapshot.data![index].id),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                    height: CSizes.spaceBtwItems / 2),
                                FutureBuilder(
                                    future: controller.getCategoryProducts(
                                        snapshot.data![index].id),
                                    builder: (context, snapshot) {
                                      final widget = CCloudHelperFunctions
                                          .checkMultiRecordState(
                                        snapshot: snapshot,
                                        loader:
                                            const CHorizaontalShimmerEffect(),
                                      );

                                      if (widget != null) return widget;
                                      return SizedBox(
                                        height: 120,
                                        child: ListView.separated(
                                          scrollDirection: Axis.horizontal,
                                          shrinkWrap: true,
                                          itemBuilder: (context, index) =>
                                              ProductItemH(
                                            product: snapshot.data![index],
                                          ),
                                          separatorBuilder: (context, index) =>
                                              const SizedBox(
                                                  width: CSizes.spaceBtwItems),
                                          itemCount: snapshot.data!.length,
                                        ),
                                      );
                                    }),
                              ],
                            ));
                  })
            ],
          ),
        ),
      ),
    );
  }
}
