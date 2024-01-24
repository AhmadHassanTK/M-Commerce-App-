// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:shoes_app/Views/Login/Screens/Widgets/LoginForm.dart';
import 'package:shoes_app/Views/Login/Screens/Widgets/LoginHeader.dart';
import 'package:shoes_app/utils/constants/sizes.dart';
import 'package:shoes_app/utils/constants/text_strings.dart';
import 'package:shoes_app/utils/device/device_utility.dart';
import 'package:shoes_app/utils/shared/CDivider.dart';
import 'package:shoes_app/utils/shared/CSocialButtons.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LoginHeader(),
              LoginForm(),
              CDivider(text: CTexts.orSignInWith),
              SizedBox(height: CSizes.spaceBtwSections),
              CSocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
