import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shoes_app/Models/Controller/BrandController.dart';
import 'package:shoes_app/Models/Model/BrandModel.dart';
import 'package:shoes_app/Views/ViewAllProducts/Widgets/SortableProducts.dart';
import 'package:shoes_app/utils/constants/sizes.dart';
import 'package:shoes_app/utils/helpers/cloud_helper_functions.dart';
import 'package:shoes_app/utils/shared/CAppBar.dart';
import 'package:shoes_app/utils/shared/CProductContainer.dart';
import 'package:shoes_app/utils/shared/CVerticalShimmerEffect.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({
    super.key,
    required this.brand,
  });

  final BrandModel brand;

  @override
  Widget build(BuildContext context) {
    final brandcontroller = BrandController.instance;

    return Scaffold(
      appBar: CAppBar(
        title: Text(brand.name),
        showbackarrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CSizes.defaultSpace),
          child: Column(
            children: [
              CProductContainer(showBorder: true, brand: brand),
              const SizedBox(height: CSizes.spaceBtwSections),
              FutureBuilder(
                  future: brandcontroller.getBrandProducts(brand.id),
                  builder: (context, snapshot) {
                    final widget = CCloudHelperFunctions.checkMultiRecordState(
                      snapshot: snapshot,
                      loader: const CVerticalShimmerEffect(),
                    );
                    if (widget != null) return widget;
                    return SortableProducts(products: snapshot.data!);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
