import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shoes_app/Views/Profile/Controller/UpdateNameController.dart';
import 'package:shoes_app/utils/constants/sizes.dart';
import 'package:shoes_app/utils/constants/text_strings.dart';
import 'package:shoes_app/utils/shared/CAppBar.dart';
import 'package:shoes_app/utils/validators/validation.dart';

class ChangeNameScreen extends StatelessWidget {
  const ChangeNameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateNameController());
    return Scaffold(
      appBar: CAppBar(
        showbackarrow: true,
        title: Text(
          'Change Name',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(CSizes.defaultSpace),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'Use real name for easy verification. This name will appear on several pages',
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const SizedBox(height: CSizes.spaceBtwItems),
              Form(
                key: controller.updatenamekey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: controller.firstname,
                      validator: (value) =>
                          CValidator.validateEmtyText('First name', value),
                      expands: false,
                      decoration: const InputDecoration(
                        labelText: CTexts.firstName,
                        prefixIcon: Icon(Iconsax.user),
                      ),
                    ),
                    const SizedBox(height: CSizes.spaceBtwInputFields),
                    TextFormField(
                      controller: controller.lastname,
                      validator: (value) =>
                          CValidator.validateEmtyText('Last name', value),
                      expands: false,
                      decoration: const InputDecoration(
                        labelText: CTexts.lastName,
                        prefixIcon: Icon(Iconsax.user),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: CSizes.spaceBtwSections),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () async {
                      await controller.updateUserName();
                    },
                    child: const Text('Save')),
              )
            ],
          ),
        ),
      ),
    );
  }
}
