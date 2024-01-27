import 'package:flutter/material.dart';
import 'package:shoes_app/utils/constants/image_strings.dart';
import 'package:shoes_app/utils/constants/sizes.dart';
import 'package:shoes_app/utils/constants/colors.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 6,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(
              right: CSizes.spaceBtwItems,
            ),
            child: Column(
              children: [
                Container(
                  height: 55,
                  width: 55,
                  padding: const EdgeInsets.all(CSizes.sm),
                  decoration: BoxDecoration(
                    color: CColors.white,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: const Image(
                    image: AssetImage(CImages.shoeIcon),
                    fit: BoxFit.cover,
                    color: CColors.dark,
                  ),
                ),
                const SizedBox(height: CSizes.spaceBtwItems / 2),
                Text(
                  'Shoes',
                  style: Theme.of(context).textTheme.labelMedium!.apply(
                        color: CColors.white,
                      ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
