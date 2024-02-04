import 'package:flutter/material.dart';
import 'package:shoes_app/Views/Orders/Widgets/OrderContainer.dart';
import 'package:shoes_app/utils/constants/sizes.dart';
import 'package:shoes_app/utils/shared/CAppBar.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
        child: ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(
            height: CSizes.spaceBtwItems,
          ),
          itemCount: 5,
          itemBuilder: (context, index) => const OrderContainer(),
        ),
      ),
    );
  }
}
