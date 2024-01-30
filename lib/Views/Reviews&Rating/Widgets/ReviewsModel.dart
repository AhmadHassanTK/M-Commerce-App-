import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:shoes_app/utils/constants/colors.dart';
import 'package:shoes_app/utils/constants/image_strings.dart';
import 'package:shoes_app/utils/constants/sizes.dart';
import 'package:shoes_app/utils/helpers/helper_functions.dart';
import 'package:shoes_app/utils/shared/CRatingIndicator.dart';
import 'package:shoes_app/utils/shared/CRoundedContainer.dart';

class ReviewsModel extends StatelessWidget {
  const ReviewsModel({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = CHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage(CImages.userProfileImage1),
                ),
                const SizedBox(width: CSizes.spaceBtwItems),
                Text(
                  'username',
                  style: Theme.of(context).textTheme.titleLarge,
                )
              ],
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
          ],
        ),
        const SizedBox(height: CSizes.spaceBtwItems),
        Row(
          children: [
            const CRatingIndicator(rating: 3.5),
            const SizedBox(width: CSizes.spaceBtwItems),
            Text(
              '01 Nov, 2023',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        const SizedBox(height: CSizes.spaceBtwItems),
        const ReadMoreText(
          'Ratings and reviews allow customers to share their experience with a product or service, and give it an overall star rating. Shoppers rely on this content to make more informed purchase decisions.',
          trimLength: 2,
          trimMode: TrimMode.Line,
          trimCollapsedText: ' show more',
          trimExpandedText: ' show less',
          lessStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: CColors.primary,
          ),
          moreStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: CColors.primary,
          ),
        ),
        const SizedBox(height: CSizes.spaceBtwItems),
        CRoundedContainer(
          padding: const EdgeInsets.all(CSizes.md),
          backgroundcolor: dark ? CColors.darkGrey : CColors.grey,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "T's Store",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    '01 Nov, 2023',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
              const SizedBox(height: CSizes.spaceBtwItems),
              const ReadMoreText(
                'Ratings and reviews allow customers to share their experience with a product or service, and give it an overall star rating. Shoppers rely on this content to make more informed purchase decisions.',
                trimLength: 2,
                trimMode: TrimMode.Line,
                trimCollapsedText: ' show more',
                trimExpandedText: ' show less',
                lessStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: CColors.primary,
                ),
                moreStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: CColors.primary,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: CSizes.spaceBtwItems),
      ],
    );
  }
}
