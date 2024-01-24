// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_app/Views/Login/Screens/Login.dart';
import 'package:shoes_app/utils/constants/image_strings.dart';
import 'package:shoes_app/utils/constants/sizes.dart';
import 'package:shoes_app/utils/constants/text_strings.dart';
import 'package:shoes_app/utils/device/device_utility.dart';

class ForgetPasswordSuccessScreen extends StatelessWidget {
  const ForgetPasswordSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(CupertinoIcons.clear),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: CDeviceUtils.getAppBarHeight() / 2,
            right: CSizes.defaultSpace,
            left: CSizes.defaultSpace,
            bottom: CSizes.defaultSpace,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(
                image: AssetImage(CImages.deliveredEmailIllustration),
              ),
              Text(
                CTexts.changeYourPasswordTitle,
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: CSizes.spaceBtwItems),
              Text(
                'Your Email',
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: CSizes.spaceBtwItems),
              Text(
                CTexts.changeYourPasswordSubTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: CSizes.spaceBtwSections),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Get.offAll(() => LoginScreen());
                  },
                  child: Text(CTexts.done),
                ),
              ),
              const SizedBox(height: CSizes.spaceBtwItems),
              TextButton(
                onPressed: () {},
                child: Text(CTexts.resendEmail),
              )
            ],
          ),
        ),
      ),
    );
  }
}
