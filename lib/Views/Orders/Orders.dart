import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shoes_app/Models/Controller/OrderController.dart';
import 'package:shoes_app/Views/NavigationMenu/Screens/NavigationMenu.dart';
import 'package:shoes_app/utils/animantion/animationLoader.dart';
import 'package:shoes_app/utils/constants/colors.dart';
import 'package:shoes_app/utils/constants/image_strings.dart';
import 'package:shoes_app/utils/constants/sizes.dart';
import 'package:shoes_app/utils/helpers/cloud_helper_functions.dart';
import 'package:shoes_app/utils/helpers/helper_functions.dart';
import 'package:shoes_app/utils/shared/CAppBar.dart';
import 'package:shoes_app/utils/shared/CRoundedContainer.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OrderController());
    return Scaffold(
      appBar: CAppBar(
        title: Text(
          'My Orders',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        showbackarrow: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(CSizes.defaultSpace),
        child: FutureBuilder(
            future: controller.fetchUserOrders(),
            builder: (context, snapshot) {
              final loader = CAnimationLoader(
                text: 'Whoops! No Orders yet',
                animation: CImages.ordercompletedanimation,
                showAction: true,
                actiontext: 'Let\'s fill it',
                onActionPressed: () => Get.off(() => const NavigationMenu()),
              );

              final widget = CCloudHelperFunctions.checkMultiRecordState(
                  snapshot: snapshot, loader: loader);

              if (widget != null) return widget;
              final orders = snapshot.data!;

              return ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(
                        height: CSizes.spaceBtwItems,
                      ),
                  itemCount: snapshot.data!.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final order = orders[index];
                    return CRoundedContainer(
                      showborder: true,
                      padding: const EdgeInsets.all(CSizes.md),
                      backgroundcolor: CHelperFunctions.isDarkMode(context)
                          ? CColors.dark
                          : CColors.light,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            children: [
                              const Icon(Iconsax.ship),
                              const SizedBox(width: CSizes.spaceBtwItems / 2),
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      order.orderStatusText,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .apply(
                                              color: CColors.primary,
                                              fontWeightDelta: 1),
                                    ),
                                    Text(
                                      order.formattedOrderDate,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall,
                                    )
                                  ],
                                ),
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Iconsax.arrow_right_34,
                                    size: CSizes.iconSm,
                                  ))
                            ],
                          ),
                          const SizedBox(height: CSizes.spaceBtwItems),
                          Row(
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    const Icon(Iconsax.tag),
                                    const SizedBox(
                                        width: CSizes.spaceBtwItems / 2),
                                    Expanded(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('Order',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelMedium),
                                          Text(
                                            order.id,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium,
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  children: [
                                    const Icon(Iconsax.calendar),
                                    const SizedBox(
                                        width: CSizes.spaceBtwItems / 2),
                                    Expanded(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('Shipping Date',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelMedium),
                                          Text(
                                            order.formattedDeliveryDate,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium,
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  });
            }),
      ),
    );
  }
}
