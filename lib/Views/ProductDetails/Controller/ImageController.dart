import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_app/Models/Model/ProductModel.dart';
import 'package:shoes_app/utils/constants/sizes.dart';

class ImageController extends GetxController {
  static ImageController get instance => Get.find();

  RxString selectedImage = ''.obs;

  List<String> getAllProductImages(ProductModel product) {
    Set<String> productImages = {};

    productImages.add(product.thumbnail);

    selectedImage.value = product.thumbnail;

    if (product.images != null) {
      productImages.addAll(product.images!);
    }

    if (product.productVariation != null &&
        product.productVariation!.isNotEmpty) {
      productImages.addAll(
          product.productVariation!.map((variation) => variation.image));
    }

    return productImages.toList();
  }

  void showEnlargedImage(String image) {
    Get.to(
      fullscreenDialog: true,
      () => Dialog.fullscreen(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: CSizes.defaultSpace,
                  vertical: CSizes.defaultSpace * 2),
              child: CachedNetworkImage(imageUrl: image),
            ),
            const SizedBox(height: CSizes.spaceBtwSections),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: 150,
                child: OutlinedButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text('Close'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
