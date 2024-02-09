import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_app/Views/Signup/Controller/SignUpController.dart';
import 'package:shoes_app/Views/Signup/Screens/Widgets/SignupForm.dart';
import 'package:shoes_app/Views/Signup/Screens/Widgets/SignupTerms.dart';
import 'package:shoes_app/utils/constants/sizes.dart';
import 'package:shoes_app/utils/constants/text_strings.dart';
import 'package:shoes_app/utils/shared/CDivider.dart';
import 'package:shoes_app/utils/shared/CSocialButtons.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = SignUpController.instance;
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(CSizes.defaultSpace),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    CTexts.signupTitle,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: CSizes.spaceBtwSections),
                  const SignupForm(),
                  const SizedBox(height: CSizes.spaceBtwSections),
                  Row(
                    children: [
                      Obx(() => Checkbox(
                          value: controller.privacypolicy.value,
                          onChanged: (value) {
                            controller.privacypolicy.value =
                                !controller.privacypolicy.value;
                          })),
                      const SizedBox(width: CSizes.spaceBtwItems),
                      const Expanded(
                        child: SignupTerms(),
                      ),
                    ],
                  ),
                  const SizedBox(height: CSizes.spaceBtwSections),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // Get.to(() => const VerifyEmailScreen());
                        controller.signUp();
                      },
                      child: const Text(CTexts.createAccount),
                    ),
                  ),
                  const SizedBox(height: CSizes.spaceBtwSections),
                  CDivider(text: CTexts.orSignUpWith),
                  const SizedBox(height: CSizes.spaceBtwItems),
                  const CSocialButtons(),
                ],
              ),
            ),
          )),
    );
  }
}
