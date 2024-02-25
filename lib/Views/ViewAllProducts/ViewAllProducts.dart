import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_app/Models/Model/ProductModel.dart';
import 'package:shoes_app/Views/ViewAllProducts/Controller/AllProductsController.dart';
import 'package:shoes_app/Views/ViewAllProducts/Widgets/SortableProducts.dart';
import 'package:shoes_app/utils/constants/sizes.dart';
import 'package:shoes_app/utils/shared/CAppBar.dart';
import 'package:shoes_app/utils/shared/CVerticalShimmerEffect.dart';

class ViewAllProductsScreen extends StatelessWidget {
  const ViewAllProductsScreen({
    super.key,
    required this.title,
    this.query,
    this.futuremethod,
  });

  final String title;
  final Query? query;
  final Future<List<ProductModel>>? futuremethod;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductsController());
    return Scaffold(
      appBar: CAppBar(
        title: Text(title),
        showbackarrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CSizes.defaultSpace),
          child: FutureBuilder(
              future: futuremethod ?? controller.fetchProductsByQuery(query),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CVerticalShimmerEffect();
                }

                if (snapshot.hasData ||
                    snapshot.data == null ||
                    snapshot.data!.isEmpty) {
                  return const Center(child: Text('No Data Found!'));
                }

                if (snapshot.hasError) {
                  return const Center(child: Text('Something went wrong!'));
                }

                final products = snapshot.data;

                return SortableProducts(products: products!);
              }),
        ),
      ),
    );
  }
}
