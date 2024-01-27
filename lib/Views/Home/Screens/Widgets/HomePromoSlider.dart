import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_app/Views/Home/Controller/HomeController.dart';
import 'package:shoes_app/utils/constants/colors.dart';
import 'package:shoes_app/utils/constants/image_strings.dart';
import 'package:shoes_app/utils/constants/sizes.dart';
import 'package:shoes_app/utils/shared/CRoundedContainer.dart';
import 'package:shoes_app/utils/shared/CRoundedImage.dart';

class HomePromoSlider extends StatelessWidget {
  const HomePromoSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final homecontroller = Get.put(HomeController());

    return Padding(
      padding: const EdgeInsets.all(CSizes.defaultSpace),
      child: Column(
        children: [
          CarouselSlider(
            items: const [
              CRoundedImage(imageurl: CImages.banner1),
              CRoundedImage(imageurl: CImages.banner2),
              CRoundedImage(imageurl: CImages.banner3),
            ],
            options: CarouselOptions(
              viewportFraction: 1,
              onPageChanged: (index, reason) =>
                  homecontroller.updatepageindex(index),
            ),
          ),
          const SizedBox(height: CSizes.spaceBtwItems),
          Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < 3; i++)
                  CRoundedContainer(
                    height: 4,
                    width: 20,
                    backgroundcolor: homecontroller.currentpageIndex.value == i
                        ? CColors.primary
                        : CColors.grey,
                    radius: 20,
                    margin: const EdgeInsets.only(right: 10),
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
