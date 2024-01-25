// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:shoes_app/Views/Home/Screens/Widgets/HomeAppBar.dart';
import 'package:shoes_app/Views/Home/Screens/Widgets/HomeBase.dart';
import 'package:shoes_app/utils/constants/colors.dart';
import 'package:shoes_app/utils/constants/image_strings.dart';
import 'package:shoes_app/utils/constants/sizes.dart';
import 'package:shoes_app/utils/shared/CSearchBar.dart';
import 'package:shoes_app/utils/shared/CSectionHeading.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HomeBase(
              child: Column(
                children: [
                  HomeAppBar(),
                  SizedBox(height: CSizes.spaceBtwSections),
                  CSearchBar(
                    text: 'Search in Store',
                    showbackground: true,
                    showborder: true,
                  ),
                  SizedBox(height: CSizes.spaceBtwSections),
                  Padding(
                    padding: const EdgeInsets.only(left: CSizes.defaultSpace),
                    child: Column(
                      children: [
                        CSectionHeading(
                          title: 'Popular Categories',
                          showactionbutton: false,
                          textcolor: CColors.white,
                        ),
                        SizedBox(height: CSizes.spaceBtwItems),
                        SizedBox(
                          height: 80,
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: 6,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(
                                  right: CSizes.spaceBtwItems,
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      height: 55,
                                      width: 55,
                                      padding: EdgeInsets.all(CSizes.sm),
                                      decoration: BoxDecoration(
                                        color: CColors.white,
                                        borderRadius:
                                            BorderRadius.circular(100),
                                      ),
                                      child: Image(
                                        image: AssetImage(CImages.shoeIcon),
                                        fit: BoxFit.cover,
                                        color: CColors.dark,
                                      ),
                                    ),
                                    SizedBox(height: CSizes.spaceBtwItems / 2),
                                    Text(
                                      'Shoes',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium!
                                          .apply(
                                            color: CColors.white,
                                          ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    )
                                  ],
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
