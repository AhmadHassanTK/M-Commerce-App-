import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shoes_app/Models/Controller/UserController.dart';
import 'package:shoes_app/utils/constants/sizes.dart';
import 'package:shoes_app/utils/constants/text_strings.dart';
import 'package:shoes_app/utils/shared/CAppBar.dart';
import 'package:shoes_app/utils/validators/validation.dart';

class ReAuthLoginScreen extends StatelessWidget {
  const ReAuthLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: const CAppBar(
        title: Text(
          'Re-Authenticate User',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(CSizes.defaultSpace),
        child: SingleChildScrollView(
          child: Form(
            key: controller.reAuthFormKey,
            child: Column(
              children: [
                TextFormField(
                  controller: controller.reAuthemail,
                  validator: CValidator.validateEmail,
                  expands: false,
                  decoration: const InputDecoration(
                    labelText: CTexts.email,
                    prefixIcon: Icon(Iconsax.direct_right),
                  ),
                ),
                const SizedBox(height: CSizes.spaceBtwInputFields),
                Obx(
                  () => TextFormField(
                    controller: controller.reAuthpassword,
                    validator: (value) => CValidator.validateEmtyText(
                      'Password',
                      value,
                    ),
                    obscureText: controller.hidepassword.value,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Iconsax.password_check),
                      labelText: CTexts.password,
                      suffixIcon: IconButton(
                        onPressed: () => controller.hidepassword.value =
                            !controller.hidepassword.value,
                        icon: Icon(
                          controller.hidepassword.value
                              ? Iconsax.eye_slash
                              : Iconsax.eye,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: CSizes.spaceBtwSections),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        controller.reAuthEmailandPassword();
                      },
                      child: const Text('Verify')),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
