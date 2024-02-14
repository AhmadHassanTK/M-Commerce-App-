import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_app/Views/Brands/Widgets/BrandProduct.dart';
import 'package:shoes_app/utils/constants/sizes.dart';
import 'package:shoes_app/utils/shared/CAppBar.dart';
import 'package:shoes_app/utils/shared/CGridView.dart';
import 'package:shoes_app/utils/shared/CProductContainer.dart';
import 'package:shoes_app/utils/shared/CSectionTitle.dart';

class BrandsScreen extends StatelessWidget {
  const BrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              CGridView(
                itemcount: 12,
                mainaxisextent: 80,
                itembuilder: (context, index) {
                  return CProductContainer(
                    onPressed: () => Get.to(() => const BrandProducts()),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
