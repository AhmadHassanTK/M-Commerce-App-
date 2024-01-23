import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shoes_app/Views/OnBoarding/Controller/OnBoardingController.dart';
import 'package:shoes_app/Views/OnBoarding/Screen/Widgets/OnBoardingPageView.dart';
import 'package:shoes_app/utils/constants/colors.dart';
import 'package:shoes_app/utils/constants/image_strings.dart';
import 'package:shoes_app/utils/constants/sizes.dart';
import 'package:shoes_app/utils/constants/text_strings.dart';
import 'package:shoes_app/utils/device/device_utility.dart';
import 'package:shoes_app/utils/helpers/helper_functions.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller.pagecontroller,
            onPageChanged: controller.updatePageIndicator,
            children: [
              OnBoardingPageView(
                image: CImages.onBoardingImage1,
                title: CTexts.onBoardingTitle1,
                subtitle: CTexts.onBoardingSubTitle1,
              ),
              OnBoardingPageView(
                image: CImages.onBoardingImage2,
                title: CTexts.onBoardingTitle2,
                subtitle: CTexts.onBoardingSubTitle2,
              ),
              OnBoardingPageView(
                image: CImages.onBoardingImage3,
                title: CTexts.onBoardingTitle3,
                subtitle: CTexts.onBoardingSubTitle3,
              ),
            ],
          ),
          Positioned(
            top: CDeviceUtils.getAppBarHeight(),
            right: CSizes.defaultSpace,
            child: TextButton(
              onPressed: () {
                controller.skipPage();
              },
              child: const Text('Skip'),
            ),
          ),
          Positioned(
            bottom: CDeviceUtils.getBottomNavigationBarHeight(),
            left: CSizes.defaultSpace,
            child: SmoothPageIndicator(
              controller: controller.pagecontroller,
              //onDotClicked: controller.dotNavigationClick,
              count: 3,
              effect: ExpandingDotsEffect(
                activeDotColor: !CHelperFunctions.isDarkMode(context)
                    ? CColors.dark
                    : CColors.light,
                dotHeight: 6,
              ),
            ),
          ),
          Positioned(
            bottom: CDeviceUtils.getBottomNavigationBarHeight(),
            right: CSizes.defaultSpace,
            child: ElevatedButton(
              style: const ButtonStyle(
                shape: MaterialStatePropertyAll(CircleBorder()),
                backgroundColor: MaterialStatePropertyAll(CColors.black),
              ),
              onPressed: () {
                controller.nextPge();
              },
              child: const Icon(
                Iconsax.arrow_right_3,
                color: CColors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
