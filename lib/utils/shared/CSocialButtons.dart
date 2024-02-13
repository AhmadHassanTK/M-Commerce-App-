// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shoes_app/Views/Login/Controller/LoginController.dart';
import 'package:shoes_app/utils/constants/colors.dart';
import 'package:shoes_app/utils/constants/image_strings.dart';
import 'package:shoes_app/utils/constants/sizes.dart';

class CSocialButtons extends StatelessWidget {
  const CSocialButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = LoginController.instance;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: CColors.grey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            onPressed: () async {
              await controller.GoogleSignIn();
            },
            icon: Image(
              width: CSizes.iconLg,
              height: CSizes.iconLg,
              image: AssetImage(CImages.google),
            ),
          ),
        ),
        SizedBox(width: CSizes.spaceBtwItems),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: CColors.grey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
              onPressed: () {},
              icon: Image(
                width: CSizes.iconLg,
                height: CSizes.iconLg,
                image: AssetImage(CImages.facebook),
              )),
        )
      ],
    );
  }
}
