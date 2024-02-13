import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shoes_app/Models/Controller/UserController.dart';
import 'package:shoes_app/Views/Profile/widgets/UserProfile.dart';
import 'package:shoes_app/utils/constants/colors.dart';
import 'package:shoes_app/utils/constants/image_strings.dart';
import 'package:shoes_app/utils/shared/CRoundedImage.dart';

class CUserTile extends StatelessWidget {
  const CUserTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return ListTile(
      leading: const CRoundedImage(
        imageurl: CImages.user,
        padding: EdgeInsets.zero,
        height: 50,
        width: 50,
        roundedborder: true,
        borderradius: 50,
      ),
      title: Obx(
        () => Text(
          controller.user.value.fullname,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .apply(color: CColors.white),
        ),
      ),
      subtitle: Text(
        controller.user.value.email,
        style: Theme.of(context)
            .textTheme
            .labelMedium!
            .apply(color: CColors.white),
      ),
      trailing: IconButton(
          onPressed: () {
            Get.to(() => const UserProfile());
          },
          icon: const Icon(
            Iconsax.edit,
            color: CColors.white,
          )),
    );
  }
}
