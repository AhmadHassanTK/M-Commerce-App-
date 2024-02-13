import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shoes_app/Views/ForgetPassword/controller/ForgetPasswordController.dart';
import 'package:shoes_app/utils/constants/sizes.dart';
import 'package:shoes_app/utils/constants/text_strings.dart';
import 'package:shoes_app/utils/device/device_utility.dart';
import 'package:shoes_app/utils/validators/validation.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = ForgetPasswordController.instance;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              top: CDeviceUtils.getAppBarHeight() / 2,
              right: CSizes.defaultSpace,
              left: CSizes.defaultSpace,
              bottom: CSizes.defaultSpace,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  CTexts.forgetPasswordTitle,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: CSizes.spaceBtwItems),
                Text(
                  CTexts.forgetPasswordSubTitle,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                const SizedBox(height: CSizes.spaceBtwSections),
                Form(
                  key: controller.forgetpasswordkey,
                  child: TextFormField(
                    controller: controller.email,
                    validator: CValidator.validateEmail,
                    decoration: const InputDecoration(
                      labelText: CTexts.email,
                      prefixIcon: Icon(Iconsax.direct_right),
                    ),
                  ),
                ),
                const SizedBox(height: CSizes.spaceBtwSections),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        controller.sendResetPasswordEmail();
                      },
                      child: const Text(
                        CTexts.submit,
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
