import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/images/circular_image.dart';
import 'package:t_store/common/widgets/texts/brand_title_text_with_verified_icon.dart';
import 'package:t_store/common/widgets/texts/product_price_text.dart';
import 'package:t_store/common/widgets/texts/product_title_text.dart';
import 'package:t_store/utils/constants/enums.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';
import '../../../../../common/widgets/custom_shapes/container/circular_container.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class ProductMetaData extends StatelessWidget {
  const ProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircularContainer(
              radius: TSizes.sm,
              backgroundColor: TColors.secondary.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(
                  horizontal: TSizes.sm, vertical: TSizes.xs),
              child: Text(
                '50%',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .apply(color: TColors.black),
              ),
            ),
            const SizedBox(
              width: TSizes.spaceBtwItems,
            ),
            const Text('MRP'),
            const SizedBox(
              width: TSizes.spaceBtwItems / 2,
            ),
            Text(
              '₹599',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .apply(decoration: TextDecoration.lineThrough),
            ),
            const SizedBox(
              width: TSizes.spaceBtwItems,
            ),
            const ProductPriceText(
              price: '299',
              isLarge: true,
            ),
          ],
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems / 1.5,
        ),
        const ProductTitleText(title: 'Navy Blue Roadster T-shirt'),
        const SizedBox(
          height: TSizes.spaceBtwItems / 1.5,
        ),
        Row(
          children: [
            const ProductTitleText(title: 'Status'),
            const SizedBox(
              width: TSizes.spaceBtwItems,
            ),
            Text(
              'In Stock',
              style: Theme.of(context).textTheme.titleLarge,
            )
          ],
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems / 1.5,
        ),
        Row(
          children: [
            CircularImage(
              image: TImages.productImage7,
              width: 32,
              height: 32,
              overlayColor: dark ? TColors.white : TColors.black,
            ),
            const BrandTitleTextWithVerifiedIcon(
              title: 'Roadster',
              brandTextSize: TextSizes.medium,
            ),
          ],
        )
      ],
    );
  }
}
