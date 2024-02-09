import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_app/Backend/AuthenticationRepository.dart';
import 'package:shoes_app/Views/VerifyEmail/Controller/VerifyEmailController.dart';
import 'package:shoes_app/utils/constants/image_strings.dart';
import 'package:shoes_app/utils/constants/sizes.dart';
import 'package:shoes_app/utils/constants/text_strings.dart';
import 'package:shoes_app/utils/device/device_utility.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key, this.email});

  final String? email;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              onPressed: () {
                AuthenticationRepository.instance.logout();
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
                const Image(
                  image: AssetImage(CImages.deliveredEmailIllustration),
                ),
                Text(
                  CTexts.confirmEmail,
                  style: Theme.of(context).textTheme.headlineSmall,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: CSizes.spaceBtwItems),
                Text(
                  email ?? '',
                  style: Theme.of(context).textTheme.labelLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: CSizes.spaceBtwItems),
                Text(
                  CTexts.confirmEmailSubTitle,
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: CSizes.spaceBtwSections),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      controller.checkEmailVerificationStatue();
                    },
                    child: const Text(CTexts.tContinue),
                  ),
                ),
                const SizedBox(height: CSizes.spaceBtwItems),
                TextButton(
                  onPressed: () => controller.sendEmailVerification(),
                  child: const Text(CTexts.resendEmail),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
