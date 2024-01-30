import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shoes_app/utils/constants/colors.dart';
import 'package:shoes_app/utils/constants/image_strings.dart';
import 'package:shoes_app/utils/constants/sizes.dart';
import 'package:shoes_app/utils/helpers/helper_functions.dart';
import 'package:shoes_app/utils/shared/CAppBar.dart';
import 'package:shoes_app/utils/shared/CPrimaryHeaderContainer.dart';
import 'package:shoes_app/utils/shared/CRoundedImage.dart';

class UpperContainer extends StatelessWidget {
  const UpperContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = CHelperFunctions.isDarkMode(context);

    return CPrimaryHeaderContainer(
      child: Container(
        color: dark ? CColors.dark : CColors.light,
        child: Stack(
          children: [
            const SizedBox(
              height: 400,
              child: Padding(
                padding: EdgeInsets.all(CSizes.defaultSpace),
                child: Center(
                  child: Image(image: AssetImage(CImages.productImage1)),
                ),
              ),
            ),
            Positioned(
              bottom: 30,
              right: 0,
              left: CSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: 8,
                  separatorBuilder: (context, index) => const SizedBox(
                    width: CSizes.defaultSpace,
                  ),
                  itemBuilder: (context, index) {
                    return CRoundedImage(
                      width: 80,
                      imageurl: CImages.productImage5,
                      padding: const EdgeInsets.all(CSizes.sm),
                      border: Border.all(color: CColors.primary),
                      backgroundcolor: dark ? CColors.dark : CColors.light,
                    );
                  },
                ),
              ),
            ),
            CAppBar(
              showbackarrow: true,
              actions: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: dark ? CColors.dark : CColors.light,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Iconsax.heart5,
                        color: Colors.red,
                      )),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
