// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_app/Views/Signup/Screens/Widgets/SignupForm.dart';
import 'package:shoes_app/Views/Signup/Screens/Widgets/SignupTerms.dart';
import 'package:shoes_app/Views/VerifyEmail/Screens/VerifyEmail.dart';
import 'package:shoes_app/utils/constants/sizes.dart';
import 'package:shoes_app/utils/constants/text_strings.dart';
import 'package:shoes_app/utils/shared/CDivider.dart';
import 'package:shoes_app/utils/shared/CSocialButtons.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                  SizedBox(height: CSizes.spaceBtwSections),
                  SignupForm(),
                  SizedBox(height: CSizes.spaceBtwSections),
                  Row(
                    children: [
                      Checkbox(value: true, onChanged: (value) {}),
                      SizedBox(width: CSizes.spaceBtwItems),
                      Expanded(
                        child: SignupTerms(),
                      ),
                    ],
                  ),
                  SizedBox(height: CSizes.spaceBtwSections),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(() => VerifyEmailScreen());
                      },
                      child: Text(CTexts.createAccount),
                    ),
                  ),
                  SizedBox(height: CSizes.spaceBtwSections),
                  CDivider(text: CTexts.orSignUpWith),
                  SizedBox(height: CSizes.spaceBtwItems),
                  CSocialButtons(),
                ],
              ),
            ),
          )),
    );
  }
}
