import 'package:flutter/material.dart';
import 'package:shoes_app/Views/Reviews&Rating/Widgets/ProductRating.dart';
import 'package:shoes_app/Views/Reviews&Rating/Widgets/ReviewsModel.dart';
import 'package:shoes_app/utils/constants/sizes.dart';
import 'package:shoes_app/utils/shared/CAppBar.dart';
import 'package:shoes_app/utils/shared/CRatingIndicator.dart';

class ReviewsRating extends StatelessWidget {
  const ReviewsRating({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CAppBar(
        title: Text('Reviews & Rating'),
        showbackarrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Ratings and reviews allow customers to share their experience with a product or service, and give it an overall star rating.',
              ),
              const SizedBox(height: CSizes.spaceBtwItems),
              const ProductRating(),
              const CRatingIndicator(rating: 2.5),
              Text(
                '12.600',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: CSizes.spaceBtwSections),
              const ReviewsModel(),
              const ReviewsModel(),
              const ReviewsModel(),
            ],
          ),
        ),
      ),
    );
  }
}
