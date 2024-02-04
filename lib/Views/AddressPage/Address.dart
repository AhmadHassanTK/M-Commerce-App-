import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shoes_app/Views/AddressPage/AddNewAddressScreen.dart';
import 'package:shoes_app/Views/AddressPage/Widgets/AddressContainer.dart';
import 'package:shoes_app/utils/constants/colors.dart';
import 'package:shoes_app/utils/shared/CAppBar.dart';

class AddressView extends StatelessWidget {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => const AddNewAddressScreen()),
        backgroundColor: CColors.primary,
        child: const Icon(Iconsax.add, color: CColors.white),
      ),
      appBar: CAppBar(
        title: Text(
          'Addresses',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        showbackarrow: true,
      ),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              AddressContainer(selectedaddress: true),
              AddressContainer(selectedaddress: false),
            ],
          ),
        ),
      ),
    );
  }
}
