import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_app/Models/Controller/CategoryController.dart';
import 'package:shoes_app/Views/Brands/Brands.dart';
import 'package:shoes_app/Views/Store/Widgets/CategoryTab.dart';
import 'package:shoes_app/utils/constants/colors.dart';
import 'package:shoes_app/utils/constants/sizes.dart';
import 'package:shoes_app/utils/helpers/helper_functions.dart';
import 'package:shoes_app/utils/shared/CAppBar.dart';
import 'package:shoes_app/utils/shared/CGridView.dart';
import 'package:shoes_app/utils/shared/CProductContainer.dart';
import 'package:shoes_app/utils/shared/CSearchBar.dart';
import 'package:shoes_app/utils/shared/CSectionTitle.dart';
import 'package:shoes_app/utils/shared/CShoppingBagIcon.dart';
import 'package:shoes_app/utils/shared/CTabBar.dart';

class StoreView extends StatelessWidget {
  const StoreView({super.key});

  @override
  Widget build(BuildContext context) {
    final isdark = CHelperFunctions.isDarkMode(context);
    final categories = CategoryController.instance.featuredCategories;
    return DefaultTabController(
      length: categories.length,
      child: SafeArea(
        child: Scaffold(
          appBar: CAppBar(
            title: Text(
              'Store',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            actions: [
              CShoppingCartIcon(
                onPressed: () {},
              )
            ],
          ),
          body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  pinned: true,
                  floating: true,
                  backgroundColor: isdark ? CColors.black : CColors.white,
                  expandedHeight: 440,
                  flexibleSpace: Padding(
                    padding: const EdgeInsets.all(CSizes.defaultSpace),
                    child: ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        const SizedBox(height: CSizes.spaceBtwItems),
                        const CSearchBar(
                          text: 'Search in Store',
                          showbackground: false,
                          showborder: true,
                          padding: EdgeInsets.zero,
                        ),
                        const SizedBox(height: CSizes.spaceBtwItems),
                        CSectionTitle(
                          title: 'Featured Brands',
                          showactionbutton: true,
                          onPressed: () => Get.to(() => const BrandsScreen()),
                        ),
                        const SizedBox(height: CSizes.spaceBtwItems / 2),
                        CGridView(
                          itemcount: 4,
                          mainaxisextent: 80,
                          itembuilder: (context, index) {
                            return const CProductContainer();
                          },
                        ),
                      ],
                    ),
                  ),
                  bottom: CTabBar(
                      tabs: categories
                          .map((category) => Tab(
                                child: Text(category.name),
                              ))
                          .toList()),
                ),
              ];
            },
            body: TabBarView(
                children: categories
                    .map((category) => CategoryTab(category: category))
                    .toList()),
          ),
        ),
      ),
    );
  }
}
