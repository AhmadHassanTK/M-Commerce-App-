import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shoes_app/Views/ForgetPassword/Screens/forgetPassword.dart';
import 'package:shoes_app/Views/Login/Controller/LoginController.dart';
import 'package:shoes_app/Views/Signup/Screens/Signup.dart';
import 'package:shoes_app/utils/constants/sizes.dart';
import 'package:shoes_app/utils/constants/text_strings.dart';
import 'package:shoes_app/utils/validators/validation.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = LoginController.instance;
    return Form(
      key: controller.loginformkey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: CSizes.spaceBtwSections),
        child: Column(
          children: [
            TextFormField(
              controller: controller.email,
              validator: (value) => CValidator.validateEmail(value),
              autocorrect: false,
              autofocus: true,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: CTexts.email,
              ),
            ),
            const SizedBox(height: CSizes.spaceBtwInputFields),
            Obx(
              () => TextFormField(
                controller: controller.password,
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
            const SizedBox(height: CSizes.spaceBtwInputFields / 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Obx(
                      () => Checkbox(
                        value: controller.rememberme.value,
                        onChanged: (value) async {
                          controller.rememberme.value =
                              !controller.rememberme.value;
                        },
                      ),
                    ),
                    const Text(CTexts.rememberMe),
                  ],
                ),
                TextButton(
                  onPressed: () {
                    Get.to(() => const ForgetPasswordScreen());
                  },
                  child: const Text(CTexts.forgetPassword),
                ),
              ],
            ),
            const SizedBox(height: CSizes.spaceBtwSections),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  controller.emailandPasswordSignIn();
                },
                child: const Text(CTexts.signIn),
              ),
            ),
            const SizedBox(height: CSizes.spaceBtwItems),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
                  Get.to(() => const SignupScreen());
                },
                child: const Text(CTexts.createAccount),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
