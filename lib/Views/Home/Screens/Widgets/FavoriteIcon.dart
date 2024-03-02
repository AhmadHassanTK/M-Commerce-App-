import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shoes_app/Views/Home/Controller/FavoriteController.dart';
import 'package:shoes_app/utils/constants/colors.dart';
import 'package:shoes_app/utils/constants/sizes.dart';
import 'package:shoes_app/utils/helpers/helper_functions.dart';

class FavoriteIcon extends StatelessWidget {
  const FavoriteIcon({
    super.key,
    required this.productId,
  });

  final String productId;
  @override
  Widget build(BuildContext context) {
    final dark = CHelperFunctions.isDarkMode(context);
    final controller = Get.put(FavoriteController());
    return Obx(
      () => Container(
        decoration: BoxDecoration(
          color: dark
              ? CColors.black.withOpacity(0.9)
              : CColors.white.withOpacity(0.9),
          borderRadius: BorderRadius.circular(100),
        ),
        child: IconButton(
            onPressed: () => controller.toogleFavoriteProduct(productId),
            icon: Icon(
              controller.isFavorite(productId) ? Iconsax.heart5 : Iconsax.heart,
              color: controller.isFavorite(productId) ? CColors.error : null,
              size: CSizes.lg,
            )),
      ),
    );
  }
}
