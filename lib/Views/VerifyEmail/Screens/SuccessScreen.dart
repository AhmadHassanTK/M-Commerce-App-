// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_app/Views/Login/Screens/Login.dart';
import 'package:shoes_app/utils/constants/image_strings.dart';
import 'package:shoes_app/utils/constants/sizes.dart';
import 'package:shoes_app/utils/constants/text_strings.dart';
import 'package:shoes_app/utils/device/device_utility.dart';

class EmailVerifySuccessScreen extends StatelessWidget {
  const EmailVerifySuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: CDeviceUtils.getAppBarHeight(),
            right: CSizes.defaultSpace,
            left: CSizes.defaultSpace,
            bottom: CSizes.defaultSpace,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(
                image: AssetImage(CImages.staticSuccessIllustration),
              ),
              const SizedBox(height: CSizes.spaceBtwSections),
              Text(
                CTexts.yourAccountCreatedTitle,
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: CSizes.spaceBtwItems),
              Text(
                CTexts.yourAccountCreatedSubTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: CSizes.spaceBtwSections),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(() => LoginScreen());
                  },
                  child: Text(CTexts.tContinue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
