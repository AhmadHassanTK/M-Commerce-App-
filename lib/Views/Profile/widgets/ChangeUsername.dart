import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shoes_app/Views/Profile/Controller/UpdateNameController.dart';
import 'package:shoes_app/utils/constants/sizes.dart';
import 'package:shoes_app/utils/constants/text_strings.dart';
import 'package:shoes_app/utils/shared/CAppBar.dart';
import 'package:shoes_app/utils/validators/validation.dart';

class ChangeUserNameScreen extends StatelessWidget {
  const ChangeUserNameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateNameController());
    return Scaffold(
      appBar: CAppBar(
        showbackarrow: true,
        title: Text(
          'Change Username',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(CSizes.defaultSpace),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'Make your unique username',
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const SizedBox(height: CSizes.spaceBtwItems),
              Form(
                key: controller.updateUsernamekey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: controller.username,
                      validator: (value) =>
                          CValidator.validateEmtyText('Username', value),
                      expands: false,
                      decoration: const InputDecoration(
                        labelText: CTexts.username,
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
                    await controller.updateUserusername();
                  },
                  child: const Text('Save'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
