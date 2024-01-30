// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:shoes_app/Views/Profile/widgets/UserProfileTile.dart';
import 'package:shoes_app/utils/constants/image_strings.dart';
import 'package:shoes_app/utils/constants/sizes.dart';
import 'package:shoes_app/utils/shared/CAppBar.dart';
import 'package:shoes_app/utils/shared/CRoundedImage.dart';
import 'package:shoes_app/utils/shared/CSectionTitle.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CAppBar(
        title: Text('Profile'),
        showbackarrow: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  CRoundedImage(
                    imageurl: CImages.user,
                    roundedborder: true,
                    borderradius: 50,
                  ),
                  TextButton(
                      onPressed: () {}, child: Text('Change profile picture'))
                ],
              ),
            ),
            SizedBox(height: CSizes.spaceBtwItems / 1.5),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(CSizes.defaultSpace),
              child: Column(
                children: [
                  CSectionTitle(
                    title: 'Profile Information',
                    showactionbutton: false,
                  ),
                  SizedBox(height: CSizes.spaceBtwItems),
                  UserProfileTile(title: 'Name', midtitle: 'Coding with T'),
                  SizedBox(height: CSizes.spaceBtwItems / 2),
                  UserProfileTile(title: 'Username', midtitle: 'Coding with T'),
                  SizedBox(height: CSizes.spaceBtwItems),
                  Divider(),
                  SizedBox(height: CSizes.spaceBtwItems),
                  CSectionTitle(
                    title: 'Personal Information',
                    showactionbutton: false,
                  ),
                  SizedBox(height: CSizes.spaceBtwItems),
                  UserProfileTile(title: 'User ID', midtitle: '123456'),
                  SizedBox(height: CSizes.spaceBtwItems),
                  UserProfileTile(
                      title: 'E-mail', midtitle: 'ahmadhassantk@gmail.com'),
                  SizedBox(height: CSizes.spaceBtwItems),
                  UserProfileTile(
                      title: 'Phone Number', midtitle: '01145615820'),
                  SizedBox(height: CSizes.spaceBtwItems),
                  UserProfileTile(title: 'Gender', midtitle: 'male'),
                  SizedBox(height: CSizes.spaceBtwItems),
                  UserProfileTile(
                      title: 'Date of Birth', midtitle: '1 oct,2000'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
