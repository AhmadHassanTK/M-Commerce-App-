import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shoes_app/Views/Home/Controller/FavoriteController.dart';
import 'package:shoes_app/Views/Home/Screens/Home.dart';
import 'package:shoes_app/Views/Home/Screens/Widgets/ProductItemV.dart';
import 'package:shoes_app/Views/NavigationMenu/Screens/NavigationMenu.dart';
import 'package:shoes_app/utils/animantion/animationLoader.dart';
import 'package:shoes_app/utils/constants/image_strings.dart';
import 'package:shoes_app/utils/constants/sizes.dart';
import 'package:shoes_app/utils/helpers/cloud_helper_functions.dart';
import 'package:shoes_app/utils/shared/CAppBar.dart';
import 'package:shoes_app/utils/shared/CGridView.dart';
import 'package:shoes_app/utils/shared/Shimmers/CVerticalShimmerEffect.dart';

class WishListView extends StatelessWidget {
  const WishListView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavoriteController());

    return SafeArea(
        child: Scaffold(
      appBar: CAppBar(
        title: Text(
          'Wishlist',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          IconButton(
            onPressed: () => Get.to(() => const HomeScreen()),
            icon: const Icon(Iconsax.add),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CSizes.defaultSpace),
          child: Obx(
            () => FutureBuilder(
                future: controller.getFavoritedProducts(),
                builder: (context, snapshot) {
                  final emptywidget = CAnimationLoader(
                    text: 'Whoops! Wishlist is Empty...',
                    animation: CImages.pensilanimation,
                    showAction: true,
                    actiontext: 'Let\'s add some',
                    onActionPressed: () =>
                        Get.off(() => const NavigationMenu()),
                  );

                  final widget = CCloudHelperFunctions.checkMultiRecordState(
                    snapshot: snapshot,
                    loader: const CVerticalShimmerEffect(itemCount: 6),
                    nothingFound: emptywidget,
                  );

                  if (widget != null) return widget;

                  return CGridView(
                    itemcount: snapshot.data!.length,
                    itembuilder: (context, index) {
                      return CProductItemV(
                        product: snapshot.data![index],
                      );
                    },
                  );
                }),
          ),
        ),
      ),
    ));
  }
}
