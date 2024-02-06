import 'package:flutter/material.dart';
import 'package:shoes_app/Views/SubCategories/Widgets/ProductItemH.dart';
import 'package:shoes_app/utils/constants/image_strings.dart';
import 'package:shoes_app/utils/constants/sizes.dart';
import 'package:shoes_app/utils/shared/CAppBar.dart';
import 'package:shoes_app/utils/shared/CRoundedImage.dart';
import 'package:shoes_app/utils/shared/CSectionTitle.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CAppBar(
        title: Text('Sports'),
        showbackarrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CSizes.defaultSpace),
          child: Column(
            children: [
              const CRoundedImage(
                imageurl: CImages.promoBanner3,
                width: double.infinity,
                roundedborder: true,
              ),
              const SizedBox(height: CSizes.spaceBtwSections),
              Column(
                children: [
                  CSectionTitle(
                    title: 'Sports shirts',
                    onPressed: () {},
                  ),
                  const SizedBox(height: CSizes.spaceBtwItems / 2),
                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context, index) => const ProductItemH(),
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: CSizes.spaceBtwItems),
                      itemCount: 6,
                    ),
                  ),
                  const SizedBox(height: CSizes.spaceBtwItems / 2),
                  CSectionTitle(
                    title: 'Sports Equipments',
                    onPressed: () {},
                  ),
                  const SizedBox(height: CSizes.spaceBtwItems / 2),
                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context, index) => const ProductItemH(),
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: CSizes.spaceBtwItems),
                      itemCount: 6,
                    ),
                  ),
                  const SizedBox(height: CSizes.spaceBtwItems / 2),
                  CSectionTitle(
                    title: 'Track Suits',
                    onPressed: () {},
                  ),
                  const SizedBox(height: CSizes.spaceBtwItems / 2),
                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context, index) => const ProductItemH(),
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: CSizes.spaceBtwItems),
                      itemCount: 6,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
