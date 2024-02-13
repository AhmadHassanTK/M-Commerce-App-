import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shoes_app/DataBase/BannerCloud.dart';
import 'package:shoes_app/DataBase/CategoryCloud.dart';
import 'package:shoes_app/DataBase/DummyData.dart';
import 'package:shoes_app/Views/Profile/widgets/LoadDataTile.dart';
import 'package:shoes_app/utils/constants/colors.dart';
import 'package:shoes_app/utils/constants/sizes.dart';
import 'package:shoes_app/utils/shared/CAppBar.dart';
import 'package:shoes_app/utils/shared/CSectionTitle.dart';

class LoadDataScreen extends StatelessWidget {
  const LoadDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categorycloud = CategoryCloud.instance;
    final bannercloud = BannerCloud.instance;
    return Scaffold(
      appBar: const CAppBar(
        title: Text('Upload Data'),
        showbackarrow: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(CSizes.defaultSpace),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const CSectionTitle(
                title: 'Main Record',
                showactionbutton: false,
              ),
              const SizedBox(height: CSizes.spaceBtwItems),
              Column(
                children: [
                  LoadDataTile(
                    leadingIcon: const Icon(
                      Iconsax.category,
                      color: CColors.primary,
                    ),
                    title: 'Upload Categories',
                    onPressed: () async {
                      print('pressed');

                      await categorycloud.uploadDummyData(DummyData.categories);
                    },
                  ),
                  const LoadDataTile(
                    leadingIcon: Icon(
                      Iconsax.shop,
                      color: CColors.primary,
                    ),
                    title: 'Upload Brands',
                  ),
                  const LoadDataTile(
                    leadingIcon: Icon(
                      Iconsax.shopping_cart,
                      color: CColors.primary,
                    ),
                    title: 'Upload Products',
                  ),
                  LoadDataTile(
                    leadingIcon: const Icon(
                      Iconsax.tag,
                      color: CColors.primary,
                    ),
                    title: 'Upload Banners',
                    onPressed: () async {
                      print('pressed');

                      await bannercloud.uploadDummyData(DummyData.banners);
                    },
                  ),
                ],
              ),
              const SizedBox(height: CSizes.spaceBtwSections),
              const CSectionTitle(
                title: 'Relationships',
                showactionbutton: false,
              ),
              Text(
                'Make sure you have already uploaded all the content above.',
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const Column(
                children: [
                  LoadDataTile(
                    leadingIcon: Icon(
                      Iconsax.tag,
                      color: CColors.primary,
                    ),
                    title: 'Upload Brands & Categories Relation Data',
                  ),
                  LoadDataTile(
                    leadingIcon: Icon(
                      Iconsax.tag,
                      color: CColors.primary,
                    ),
                    title: 'Upload Product Categories Relational Data',
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
