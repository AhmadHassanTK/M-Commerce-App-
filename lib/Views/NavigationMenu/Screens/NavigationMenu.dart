// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shoes_app/Views/NavigationMenu/Controller/NavigatorController.dart';
import 'package:shoes_app/utils/constants/colors.dart';
import 'package:shoes_app/utils/helpers/helper_functions.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final navigatorcontroller = Get.put(NavigatorController());
    bool dark = CHelperFunctions.isDarkMode(context);
    return Obx(
      () => Scaffold(
        bottomNavigationBar: NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: navigatorcontroller.selectedindex.value,
          onDestinationSelected: (index) =>
              navigatorcontroller.selectedindex.value = index,
          backgroundColor: dark ? CColors.black : CColors.white,
          indicatorColor: dark
              ? CColors.white.withOpacity(0.1)
              : CColors.black.withOpacity(0.1),
          destinations: [
            NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
            NavigationDestination(icon: Icon(Iconsax.shop), label: 'Store'),
            NavigationDestination(icon: Icon(Iconsax.heart), label: 'Wishlist'),
            NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile'),
          ],
        ),
        body:
            navigatorcontroller.pages[navigatorcontroller.selectedindex.value],
      ),
    );
  }
}
