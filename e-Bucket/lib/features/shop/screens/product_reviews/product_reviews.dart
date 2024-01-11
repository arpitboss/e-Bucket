import 'package:flutter/material.dart';
import 'package:t_store/features/shop/screens/product_reviews/widgets/overall_product_rating.dart';
import 'package:t_store/features/shop/screens/product_reviews/widgets/user_review_card.dart';
import 'package:t_store/utils/constants/sizes.dart';
import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/products/ratings/rating_indicator.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ReusableAppBar(
        title: Text('Reviews & Ratings'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                  'The Reviews are very helpful to determine the authenticity of the product and customer will believe more in the product'),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              const OverallProductRating(),
              const ReusableRatingIndicator(
                rating: 4.5,
              ),
              Text(
                '11,650',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),
            ],
          ),
        ),
      ),
    );
  }
}
