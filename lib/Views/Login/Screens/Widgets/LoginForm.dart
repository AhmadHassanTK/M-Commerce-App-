// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shoes_app/Views/ForgetPassword/Screens/forgetPassword.dart';
import 'package:shoes_app/Views/NavigationMenu/Screens/NavigationMenu.dart';
import 'package:shoes_app/Views/Signup/Screens/Signup.dart';
import 'package:shoes_app/utils/constants/sizes.dart';
import 'package:shoes_app/utils/constants/text_strings.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: CSizes.spaceBtwSections),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: CTexts.email,
              ),
            ),
            SizedBox(height: CSizes.spaceBtwInputFields),
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Iconsax.password_check),
                labelText: CTexts.password,
                suffixIcon: Icon(Iconsax.eye_slash),
              ),
            ),
            SizedBox(height: CSizes.spaceBtwInputFields / 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(value: true, onChanged: (value) {}),
                    Text(CTexts.rememberMe),
                  ],
                ),
                TextButton(
                  onPressed: () {
                    Get.to(() => ForgetPasswordScreen());
                  },
                  child: Text(CTexts.forgetPassword),
                ),
              ],
            ),
            SizedBox(height: CSizes.spaceBtwSections),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Get.to(() => NavigationMenu());
                },
                child: Text(CTexts.signIn),
              ),
            ),
            SizedBox(height: CSizes.spaceBtwItems),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
                  Get.to(() => SignupScreen());
                },
                child: Text(CTexts.createAccount),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
