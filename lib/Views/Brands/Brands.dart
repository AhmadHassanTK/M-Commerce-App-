import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_app/Models/Controller/BrandController.dart';
import 'package:shoes_app/Views/Brands/Widgets/BrandProduct.dart';
import 'package:shoes_app/utils/constants/sizes.dart';
import 'package:shoes_app/utils/shared/CAppBar.dart';
import 'package:shoes_app/utils/shared/CBrandShimmer.dart';
import 'package:shoes_app/utils/shared/CGridView.dart';
import 'package:shoes_app/utils/shared/CProductContainer.dart';
import 'package:shoes_app/utils/shared/CSectionTitle.dart';

class BrandsScreen extends StatelessWidget {
  const BrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final brandcontroller = BrandController.instance;
    return Scaffold(
      appBar: const CAppBar(
        title: Text('Brands'),
        showbackarrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CSizes.defaultSpace),
          child: Column(
            children: [
              const CSectionTitle(
                title: 'Brands',
                showactionbutton: false,
              ),
              const SizedBox(height: CSizes.spaceBtwItems),
              Obx(() {
                if (brandcontroller.isloading.value) {
                  return const CBrandShimmer();
                }

                if (brandcontroller.allBrands.isEmpty) {
                  return Center(
                    child: Text(
                      'No Data Found',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .apply(color: Colors.white),
                    ),
                  );
                }

                return CGridView(
                  itemcount: brandcontroller.allBrands.length,
                  mainaxisextent: 80,
                  itembuilder: (context, index) {
                    final brand = brandcontroller.allBrands[index];
                    return CProductContainer(
                      showBorder: true,
                      brand: brand,
                      onPressed: () =>
                          Get.to(() => BrandProducts(brand: brand)),
                    );
                  },
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
