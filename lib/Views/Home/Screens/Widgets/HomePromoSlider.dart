import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_app/Models/Controller/BannerController.dart';
import 'package:shoes_app/utils/constants/colors.dart';
import 'package:shoes_app/utils/constants/sizes.dart';
import 'package:shoes_app/utils/shared/CRoundedContainer.dart';
import 'package:shoes_app/utils/shared/CRoundedImage.dart';
import 'package:shoes_app/utils/shared/CShimmerEffect.dart';

class HomePromoSlider extends StatelessWidget {
  const HomePromoSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bannercontroller = Get.put(BannnerController());

    return Padding(
      padding: const EdgeInsets.all(CSizes.defaultSpace),
      child: Obx(() {
        if (bannercontroller.isloading.value) {
          return const CShimmerEffect(width: double.infinity, height: 190);
        }

        if (bannercontroller.allBanners.isEmpty) {
          return const Center(child: Text('No Data Found'));
        } else {
          return Column(
            children: [
              CarouselSlider(
                items: bannercontroller.allBanners
                    .map((banner) => CRoundedImage(
                          imageurl: banner.imageUrl,
                          isNetworkImage: true,
                          onPressed: () => Get.toNamed(banner.targetscreen),
                        ))
                    .toList(),
                options: CarouselOptions(
                  viewportFraction: 1,
                  onPageChanged: (index, reason) =>
                      bannercontroller.updatepageindex(index),
                ),
              ),
              const SizedBox(height: CSizes.spaceBtwItems),
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 0; i < bannercontroller.allBanners.length; i++)
                      CRoundedContainer(
                        height: 4,
                        width: 20,
                        backgroundcolor:
                            bannercontroller.currentpageIndex.value == i
                                ? CColors.primary
                                : CColors.grey,
                        radius: 20,
                        margin: const EdgeInsets.only(right: 10),
                      ),
                  ],
                ),
              )
            ],
          );
        }
      }),
    );
  }
}
