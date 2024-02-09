import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_app/utils/animantion/animationLoader.dart';
import 'package:shoes_app/utils/constants/colors.dart';
import 'package:shoes_app/utils/helpers/helper_functions.dart';

class CFullScreenLoader {
  static void openLoadingDialog(String text, String animation) {
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      builder: (context) => PopScope(
        canPop: false,
        child: Container(
          color: CHelperFunctions.isDarkMode(Get.context!)
              ? CColors.dark
              : CColors.white,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              const SizedBox(height: 250),
              CAnimationLoader(text: text, animation: animation)
            ],
          ),
        ),
      ),
    );
  }

  static stoploading() {
    Navigator.of(Get.overlayContext!).pop();
  }
}
