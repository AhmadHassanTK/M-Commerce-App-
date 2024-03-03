import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shoes_app/Models/Controller/AddressController.dart';
import 'package:shoes_app/utils/constants/sizes.dart';
import 'package:shoes_app/utils/shared/CAppBar.dart';
import 'package:shoes_app/utils/validators/validation.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = AddressController.instance;
    return Scaffold(
      appBar: const CAppBar(
        showbackarrow: true,
        title: Text("Add new Address"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: controller.addressFormkey,
          child: Padding(
            padding: const EdgeInsets.all(CSizes.defaultSpace),
            child: Column(
              children: [
                TextFormField(
                  controller: controller.name,
                  validator: (value) =>
                      CValidator.validateEmtyText('Name', value),
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.user),
                    label: Text('Name'),
                  ),
                ),
                const SizedBox(height: CSizes.spaceBtwInputFields),
                TextFormField(
                  controller: controller.phoneNumber,
                  validator: (value) => CValidator.validatePhoneNumber(value),
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.mobile),
                    label: Text('Phone Number'),
                  ),
                ),
                const SizedBox(height: CSizes.spaceBtwInputFields),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: controller.street,
                        validator: (value) =>
                            CValidator.validateEmtyText('Street', value),
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.building_31),
                          label: Text('Street'),
                        ),
                      ),
                    ),
                    const SizedBox(width: CSizes.spaceBtwInputFields),
                    Expanded(
                      child: TextFormField(
                        controller: controller.postalCode,
                        validator: (value) =>
                            CValidator.validateEmtyText('PostalCode', value),
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.code),
                          label: Text('Postal Code'),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: CSizes.spaceBtwItems),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: controller.city,
                        validator: (value) =>
                            CValidator.validateEmtyText('City', value),
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.building),
                          label: Text('City'),
                        ),
                      ),
                    ),
                    const SizedBox(width: CSizes.spaceBtwInputFields),
                    Expanded(
                      child: TextFormField(
                        controller: controller.state,
                        validator: (value) =>
                            CValidator.validateEmtyText('State', value),
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.activity),
                          label: Text('State'),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: CSizes.spaceBtwInputFields),
                TextFormField(
                  controller: controller.country,
                  validator: (value) =>
                      CValidator.validateEmtyText('Country', value),
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.global),
                    label: Text('Country'),
                  ),
                ),
                const SizedBox(height: CSizes.defaultSpace),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => controller.addNewAddress(),
                    child: const Text('Save'),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
