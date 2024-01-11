import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../images/rounded_image.dart';
import '../../texts/brand_title_text_with_verified_icon.dart';
import '../../texts/product_title_text.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RoundedImage(
          imageUrl: TImages.productImage8,
          width: 60,
          height: 60,
          bgColor: THelperFunctions.isDarkMode(context)
              ? TColors.darkerGrey
              : TColors.light,
          padding: const EdgeInsets.all(TSizes.sm),
        ),
        const SizedBox(
          width: TSizes.spaceBtwItems,
        ),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BrandTitleTextWithVerifiedIcon(title: 'Nike'),
              const Flexible(
                child: ProductTitleText(
                  title: 'Sports Shoes White',
                  maxLines: 1,
                ),
              ),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                        text: 'Color ',
                        style: Theme.of(context).textTheme.bodySmall),
                    TextSpan(
                        text: 'Pink ',
                        style: Theme.of(context).textTheme.bodyLarge),
                    TextSpan(
                        text: 'Size ',
                        style: Theme.of(context).textTheme.bodySmall),
                    TextSpan(
                        text: 'UK 47 ',
                        style: Theme.of(context).textTheme.bodyLarge),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
