import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_app/Models/Controller/UserController.dart';
import 'package:shoes_app/Views/Profile/widgets/ChangeName.dart';
import 'package:shoes_app/Views/Profile/widgets/ChangeUsername.dart';
import 'package:shoes_app/Views/Profile/widgets/UserProfileTile.dart';
import 'package:shoes_app/utils/constants/image_strings.dart';
import 'package:shoes_app/utils/constants/sizes.dart';
import 'package:shoes_app/utils/shared/CAppBar.dart';
import 'package:shoes_app/utils/shared/CRoundedImage.dart';
import 'package:shoes_app/utils/shared/CSectionTitle.dart';
import 'package:shoes_app/utils/shared/CShimmerEffect.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;

    return Scaffold(
      appBar: const CAppBar(
        title: Text('Profile'),
        showbackarrow: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  Obx(() {
                    final networkimage = controller.user.value.profilePicture;
                    final image =
                        networkimage.isNotEmpty ? networkimage : CImages.user;

                    if (controller.imageuploading.value) {
                      return const CShimmerEffect(
                          width: 80, height: 80, radius: 80);
                    } else {
                      return CRoundedImage(
                        imageurl: image,
                        roundedborder: true,
                        borderradius: 50,
                        isNetworkImage: networkimage.isNotEmpty,
                        width: 150,
                        height: 150,
                        boxFit: BoxFit.cover,
                      );
                    }
                  }),
                  TextButton(
                    onPressed: () => controller.uploadUserProfilePicture(),
                    child: const Text('Change profile picture'),
                  )
                ],
              ),
            ),
            const SizedBox(height: CSizes.spaceBtwItems / 1.5),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(CSizes.defaultSpace),
              child: Column(
                children: [
                  const CSectionTitle(
                    title: 'Profile Information',
                    showactionbutton: false,
                  ),
                  const SizedBox(height: CSizes.spaceBtwItems),
                  UserProfileTile(
                    title: 'Name',
                    midtitle: controller.user.value.fullname,
                    onPressed: () => Get.to(() => const ChangeNameScreen()),
                  ),
                  const SizedBox(height: CSizes.spaceBtwItems / 2),
                  UserProfileTile(
                    title: 'Username',
                    midtitle: controller.user.value.username,
                    onPressed: () => Get.to(() => const ChangeUserNameScreen()),
                  ),
                  const SizedBox(height: CSizes.spaceBtwItems),
                  const Divider(),
                  const SizedBox(height: CSizes.spaceBtwItems),
                  const CSectionTitle(
                    title: 'Personal Information',
                    showactionbutton: false,
                  ),
                  const SizedBox(height: CSizes.spaceBtwItems),
                  UserProfileTile(
                    title: 'User ID',
                    midtitle: controller.user.value.id,
                  ),
                  const SizedBox(height: CSizes.spaceBtwItems),
                  UserProfileTile(
                    title: 'E-mail',
                    midtitle: controller.user.value.email,
                  ),
                  const SizedBox(height: CSizes.spaceBtwItems),
                  UserProfileTile(
                    title: 'Phone Number',
                    midtitle: controller.user.value.phoneNumber,
                  ),
                  const SizedBox(height: CSizes.spaceBtwItems),
                  const UserProfileTile(title: 'Gender', midtitle: 'male'),
                  const SizedBox(height: CSizes.spaceBtwItems),
                  const UserProfileTile(
                      title: 'Date of Birth', midtitle: '1 oct,2000'),
                  const SizedBox(height: CSizes.spaceBtwItems / 2),
                  const Divider(),
                  TextButton(
                      onPressed: () => controller.deleteAccountWarningPopup(),
                      child: const Text(
                        'Close account',
                        style: TextStyle(color: Colors.red),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
