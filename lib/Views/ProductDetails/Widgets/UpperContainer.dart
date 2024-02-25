import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shoes_app/Models/Model/ProductModel.dart';
import 'package:shoes_app/Views/ProductDetails/Controller/ImageController.dart';
import 'package:shoes_app/utils/constants/colors.dart';
import 'package:shoes_app/utils/constants/sizes.dart';
import 'package:shoes_app/utils/helpers/helper_functions.dart';
import 'package:shoes_app/utils/shared/CAppBar.dart';
import 'package:shoes_app/utils/shared/CPrimaryHeaderContainer.dart';
import 'package:shoes_app/utils/shared/CRoundedImage.dart';

class UpperContainer extends StatelessWidget {
  const UpperContainer({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = CHelperFunctions.isDarkMode(context);
    final controller = Get.put(ImageController());
    final images = controller.getAllProductImages(product);
    return CPrimaryHeaderContainer(
      child: Container(
        color: dark ? CColors.dark : CColors.light,
        child: Stack(
          children: [
            SizedBox(
              height: 400,
              child: Padding(
                padding: const EdgeInsets.all(CSizes.defaultSpace),
                child: Center(
                  child: Obx(
                    () => GestureDetector(
                      onTap: () => controller
                          .showEnlargedImage(controller.selectedImage.value),
                      child: CachedNetworkImage(
                          imageUrl: controller.selectedImage.value),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 30,
              right: 0,
              left: CSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: images.length,
                  separatorBuilder: (context, index) => const SizedBox(
                    width: CSizes.defaultSpace,
                  ),
                  itemBuilder: (context, index) {
                    return Obx(() {
                      final selectedImage =
                          controller.selectedImage.value == images[index];
                      return CRoundedImage(
                        width: 80,
                        imageurl: images[index],
                        isNetworkImage: true,
                        padding: const EdgeInsets.all(CSizes.sm),
                        border: Border.all(
                          color: selectedImage
                              ? CColors.primary
                              : Colors.transparent,
                        ),
                        backgroundcolor: dark ? CColors.dark : CColors.light,
                        onPressed: () =>
                            controller.selectedImage.value = images[index],
                      );
                    });
                  },
                ),
              ),
            ),
            CAppBar(
              showbackarrow: true,
              actions: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: dark ? CColors.dark : CColors.light,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Iconsax.heart5,
                        color: Colors.red,
                      )),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
