import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_app/Models/Controller/CategoryController.dart';
import 'package:shoes_app/Views/Home/Screens/Widgets/CategoryShimmer.dart';
import 'package:shoes_app/Views/SubCategories/SubCategories.dart';
import 'package:shoes_app/utils/constants/sizes.dart';
import 'package:shoes_app/utils/constants/colors.dart';
import 'package:shoes_app/utils/helpers/helper_functions.dart';
import 'package:shoes_app/utils/shared/CRoundedImage.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final categorycontroller = Get.put(CategoryController());
    return Obx(() {
      if (categorycontroller.isloading.value) return const CCategoryShimmer();
      if (categorycontroller.featuredCategories.isEmpty) {
        return Center(
          child: Text(
            'No Data Found!',
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .apply(color: CColors.white),
          ),
        );
      }
      return SizedBox(
        height: 80,
        child: ListView.separated(
          shrinkWrap: true,
          itemCount: categorycontroller.featuredCategories.length,
          separatorBuilder: (context, index) =>
              const SizedBox(width: CSizes.spaceBtwItems),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final category = categorycontroller.featuredCategories[index];
            return Padding(
              padding: const EdgeInsets.only(
                right: CSizes.spaceBtwItems,
              ),
              child: GestureDetector(
                onTap: () =>
                    Get.to(() => SubCategoriesScreen(category: category)),
                child: Column(
                  children: [
                    CRoundedImage(
                      width: 55,
                      height: 55,
                      imageurl: category.image,
                      borderradius: 100,
                      boxFit: BoxFit.fitWidth,
                      padding: const EdgeInsets.all(CSizes.sm),
                      isNetworkImage: true,
                      overlaycolor: CHelperFunctions.isDarkMode(context)
                          ? CColors.light
                          : CColors.dark,
                    ),
                    const SizedBox(height: CSizes.spaceBtwItems / 2),
                    Text(
                      category.name,
                      style: Theme.of(context).textTheme.labelMedium!.apply(
                            color: CColors.white,
                          ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
              ),
            );
          },
        ),
      );
    });
  }
}
