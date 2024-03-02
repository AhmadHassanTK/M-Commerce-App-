import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shoes_app/DataBase/BannerCloud.dart';
import 'package:shoes_app/DataBase/BrandCategoryCloud.dart';
import 'package:shoes_app/DataBase/BrandCloud.dart';
import 'package:shoes_app/DataBase/CategoryCloud.dart';
import 'package:shoes_app/DataBase/DummyData.dart';
import 'package:shoes_app/DataBase/ProductCategoryCloud.dart';
import 'package:shoes_app/DataBase/ProductsCloud.dart';
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
    final productcloud = Get.put(ProductsCloud());
    final brandcloud = Get.put(BrandCloud());
    final brandcategorycloud = Get.put(BrandCategoryCloud());
    final productcategorycloud = Get.put(ProductCategoryCloud());
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
                      await categorycloud.uploadDummyData(DummyData.categories);
                    },
                  ),
                  LoadDataTile(
                    leadingIcon: const Icon(
                      Iconsax.shop,
                      color: CColors.primary,
                    ),
                    title: 'Upload Brands',
                    onPressed: () async {
                      await brandcloud.uploadDummyData(DummyData.brands);
                    },
                  ),
                  LoadDataTile(
                    leadingIcon: const Icon(
                      Iconsax.shopping_cart,
                      color: CColors.primary,
                    ),
                    title: 'Upload Products',
                    onPressed: () async {
                      await productcloud.uploadDummyData(DummyData.products);
                    },
                  ),
                  LoadDataTile(
                    leadingIcon: const Icon(
                      Iconsax.tag,
                      color: CColors.primary,
                    ),
                    title: 'Upload Banners',
                    onPressed: () async {
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
              Column(
                children: [
                  LoadDataTile(
                    leadingIcon: const Icon(
                      Iconsax.tag,
                      color: CColors.primary,
                    ),
                    title: 'Upload Brands & Categories Relation Data',
                    onPressed: () => brandcategorycloud
                        .uploadDummyData(DummyData.brandcategory),
                  ),
                  LoadDataTile(
                    leadingIcon: const Icon(
                      Iconsax.tag,
                      color: CColors.primary,
                    ),
                    title: 'Upload Product Categories Relational Data',
                    onPressed: () => productcategorycloud
                        .uploadDummyData(DummyData.prodctcategory),
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
