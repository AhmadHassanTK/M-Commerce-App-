import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_app/Models/Controller/UserController.dart';
import 'package:shoes_app/Views/Cart/Cart.dart';
import 'package:shoes_app/utils/shared/Shimmers/CShimmerEffect.dart';
import 'package:shoes_app/utils/shared/CShoppingBagIcon.dart';
import 'package:shoes_app/utils/constants/colors.dart';
import 'package:shoes_app/utils/constants/text_strings.dart';
import 'package:shoes_app/utils/shared/CAppBar.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return CAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(CTexts.homeAppbarTitle,
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .apply(color: CColors.grey)),
          Obx(() {
            if (controller.profileLoading.value) {
              return const CShimmerEffect(width: 80, height: 15);
            } else {
              return Text(controller.user.value.fullname,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .apply(color: CColors.white));
            }
          }),
        ],
      ),
      actions: [
        CShoppingCartIcon(
          iconcolor: CColors.white,
          onPressed: () {
            Get.to(() => const CartView());
          },
        )
      ],
    );
  }
}
