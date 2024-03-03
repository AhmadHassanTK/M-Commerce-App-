import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shoes_app/Models/Controller/AddressController.dart';
import 'package:shoes_app/Views/AddressPage/AddNewAddressScreen.dart';
import 'package:shoes_app/Views/AddressPage/Widgets/AddressContainer.dart';
import 'package:shoes_app/utils/constants/colors.dart';
import 'package:shoes_app/utils/helpers/cloud_helper_functions.dart';
import 'package:shoes_app/utils/shared/CAppBar.dart';

class AddressView extends StatelessWidget {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddressController());
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Obx(
          () => FutureBuilder(
              key: Key(controller.refreshData.value.toString()),
              future: controller.getAllUsersAddresses(),
              builder: (context, snapshot) {
                final widget = CCloudHelperFunctions.checkMultiRecordState(
                  snapshot: snapshot,
                );
                if (widget != null) return widget;
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => AddressContainer(
                    addressmodel: snapshot.data![index],
                    onTap: () =>
                        controller.selectAddress(snapshot.data![index]),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
