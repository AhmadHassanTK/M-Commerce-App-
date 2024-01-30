// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shoes_app/Views/Profile/widgets/Profiletiles.dart';
import 'package:shoes_app/utils/constants/colors.dart';
import 'package:shoes_app/utils/constants/sizes.dart';
import 'package:shoes_app/utils/shared/CAppBar.dart';
import 'package:shoes_app/utils/shared/CPrimaryHeaderContainer.dart';
import 'package:shoes_app/utils/shared/CSectionTitle.dart';
import 'package:shoes_app/utils/shared/CUserTile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CPrimaryHeaderContainer(
              child: Column(
                children: [
                  CAppBar(
                    title: Text(
                      'Account',
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .apply(color: CColors.white),
                    ),
                  ),
                  CUserTile(),
                  SizedBox(height: CSizes.defaultSpace)
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(CSizes.defaultSpace),
              child: Column(
                children: [
                  CSectionTitle(
                    title: 'Account Settings',
                    showactionbutton: false,
                  ),
                  ProfileTile(
                      leading: Icon(
                        Iconsax.safe_home,
                        color: CColors.primary,
                      ),
                      title: 'My Addresses',
                      subtitle: 'Set Shopping delivery address'),
                  ProfileTile(
                      leading: Icon(
                        Iconsax.shopping_cart,
                        color: CColors.primary,
                      ),
                      title: 'My Cart',
                      subtitle: 'Add, reomve products and move to checkout'),
                  ProfileTile(
                      leading: Icon(
                        Iconsax.bag_tick,
                        color: CColors.primary,
                      ),
                      title: 'My Orders',
                      subtitle: 'In-progress and Completed order'),
                  ProfileTile(
                      leading: Icon(
                        Iconsax.bank,
                        color: CColors.primary,
                      ),
                      title: 'Bank Account',
                      subtitle:
                          'Withdraw balance with registered bank account'),
                  ProfileTile(
                      leading: Icon(
                        Iconsax.discount_shape,
                        color: CColors.primary,
                      ),
                      title: 'My Coupons',
                      subtitle: 'List of all discount coupons'),
                  ProfileTile(
                      leading: Icon(
                        Iconsax.notification,
                        color: CColors.primary,
                      ),
                      title: 'Notifications',
                      subtitle: 'Set any kind of notification message'),
                  ProfileTile(
                      leading: Icon(
                        Iconsax.security_card,
                        color: CColors.primary,
                      ),
                      title: 'Account Privacy',
                      subtitle: 'Manage data usage and connected accounts'),
                  SizedBox(height: CSizes.spaceBtwItems),
                  CSectionTitle(
                    title: 'App Settings',
                    showactionbutton: false,
                  ),
                  ProfileTile(
                    leading: Icon(
                      Iconsax.document_upload,
                      color: CColors.primary,
                    ),
                    title: 'Load data',
                    subtitle: 'Upload data to your Cloud Firebase',
                  ),
                  ProfileTile(
                    leading: Icon(
                      Iconsax.location,
                      color: CColors.primary,
                    ),
                    title: 'Geolocation',
                    subtitle: 'Set recommendation based on location',
                    trailing: Switch(value: true, onChanged: (value) {}),
                  ),
                  ProfileTile(
                    leading: Icon(
                      Iconsax.security_user,
                      color: CColors.primary,
                    ),
                    title: 'Safe Mode',
                    subtitle: 'Search results is safe for all ages',
                    trailing: Switch(value: false, onChanged: (value) {}),
                  ),
                  ProfileTile(
                    leading: Icon(
                      Iconsax.image,
                      color: CColors.primary,
                    ),
                    title: 'HD Image Quality',
                    subtitle: 'Set image quality to be seen',
                    trailing: Switch(value: false, onChanged: (value) {}),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
