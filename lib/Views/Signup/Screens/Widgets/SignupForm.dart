// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shoes_app/Views/Signup/Controller/SignUpController.dart';
import 'package:shoes_app/utils/constants/sizes.dart';
import 'package:shoes_app/utils/constants/text_strings.dart';
import 'package:shoes_app/utils/validators/validation.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = SignUpController.instance;

    return Form(
      key: controller.signupformkey,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  autofocus: true,
                  controller: controller.firstname,
                  validator: (value) =>
                      CValidator.validateEmtyText('First name', value),
                  expands: false,
                  decoration: InputDecoration(
                    labelText: CTexts.firstName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
              SizedBox(
                width: CSizes.spaceBtwInputFields,
              ),
              Expanded(
                child: TextFormField(
                  controller: controller.lastname,
                  validator: (value) =>
                      CValidator.validateEmtyText('Last name', value),
                  expands: false,
                  decoration: InputDecoration(
                    labelText: CTexts.lastName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: CSizes.spaceBtwItems),
          TextFormField(
            controller: controller.username,
            validator: (value) =>
                CValidator.validateEmtyText('Username', value),
            expands: false,
            decoration: InputDecoration(
              labelText: CTexts.username,
              prefixIcon: Icon(Iconsax.user_edit),
            ),
          ),
          SizedBox(height: CSizes.spaceBtwItems),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            controller: controller.email,
            validator: (value) => CValidator.validateEmail(value),
            expands: false,
            decoration: InputDecoration(
              labelText: CTexts.email,
              prefixIcon: Icon(Iconsax.direct),
            ),
          ),
          SizedBox(height: CSizes.spaceBtwItems),
          TextFormField(
            controller: controller.phonenumber,
            validator: (value) => CValidator.validatePhoneNumber(value),
            expands: false,
            decoration: InputDecoration(
              labelText: CTexts.phoneNo,
              prefixIcon: Icon(Iconsax.call),
            ),
          ),
          SizedBox(height: CSizes.spaceBtwItems),
          Obx(
            () => TextFormField(
              controller: controller.password,
              validator: (value) => CValidator.validatePassword(value),
              expands: false,
              obscureText: controller.hidepassword.value,
              decoration: InputDecoration(
                labelText: CTexts.password,
                prefixIcon: Icon(Iconsax.password_check),
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
        ],
      ),
    );
  }
}
