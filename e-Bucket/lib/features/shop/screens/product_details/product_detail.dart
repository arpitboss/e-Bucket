import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/features/shop/screens/product_details/widgets/bottom_add_to_cart.dart';
import 'package:t_store/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:t_store/features/shop/screens/product_details/widgets/product_image_slider.dart';
import 'package:t_store/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:t_store/features/shop/screens/product_details/widgets/product_rating.dart';
import 'package:t_store/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';

import '../../models/product_model.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ProductImageSlider(),
            Padding(
              padding: const EdgeInsets.only(
                  left: TSizes.defaultSpace,
                  right: TSizes.defaultSpace,
                  bottom: TSizes.defaultSpace),
              child: Column(
                children: [
                  const RatingAndShare(),
                  const ProductMetaData(),
                  const ProductAttributes(),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('CheckOut'),
                    ),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  const SectionHeading(
                    headingText: 'Description',
                    showActionButton: false,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  ReadMoreText(
                    'datajfhsdjghsjfhslkfklsdhfklsdhflksghuggkggdhfldlghdfglhkksdhfklsdhfgkgggkjgj'
                    'gkjgkgkgjkgjkghguiguhohouighiuhhjfhfjvjguhuoighigkjhgigdhkhdfgjhsfdvhsdfklhsfdlhvsdlfkghsfd ',
                    trimLines: 2,
                    trimCollapsedText: 'show more',
                    trimExpandedText: 'show less',
                    trimMode: TrimMode.Line,
                    moreStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                        color: TColors.primary.withBlue(255)),
                    lessStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                        color: TColors.primary.withBlue(255)),
                  ),
                  const Divider(),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SectionHeading(
                        headingText: 'Reviews(363)',
                        showActionButton: false,
                      ),
                      IconButton(
                          onPressed: () {
                            Get.to(() => const ProductReviewsScreen());
                          },
                          icon: const Icon(
                            Iconsax.arrow_right_3,
                            size: 18,
                          )),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
