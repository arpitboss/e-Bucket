import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/custom_shapes/container/circular_container.dart';
import 'package:t_store/common/widgets/icons/circular_icon.dart';
import 'package:t_store/common/widgets/images/rounded_image.dart';
import 'package:t_store/common/widgets/texts/brand_title_text_with_verified_icon.dart';
import 'package:t_store/common/widgets/texts/product_price_text.dart';
import 'package:t_store/common/widgets/texts/product_title_text.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';

class ProductCardHorizontal extends StatelessWidget {
  const ProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      width: 310,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(TSizes.productImageRadius),
        color: dark ? TColors.darkerGrey : TColors.softGrey,
      ),
      child: Row(
        children: [
          CircularContainer(
            height: 120,
            padding: const EdgeInsets.all(TSizes.sm),
            backgroundColor: dark ? TColors.dark : TColors.light,
            child: Stack(
              children: [
                const SizedBox(
                  height: 120,
                  width: 120,
                  child: RoundedImage(
                    imageUrl: TImages.productImage1,
                    applyImageRadius: true,
                  ),
                ),
                Positioned(
                  child: CircularContainer(
                    radius: TSizes.sm,
                    backgroundColor: TColors.secondary.withOpacity(0.8),
                    padding: const EdgeInsets.symmetric(
                        horizontal: TSizes.sm, vertical: TSizes.xs),
                    child: Text(
                      '25%',
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .apply(color: TColors.black),
                    ),
                  ),
                ),
                const Positioned(
                    top: 0,
                    right: 0,
                    child: CircularIcon(
                      icon: Iconsax.heart5,
                      color: Colors.red,
                    ))
              ],
            ),
          ),
          SizedBox(
            width: 172,
            child: Padding(
              padding: const EdgeInsets.only(left: TSizes.sm, top: TSizes.sm),
              child: Column(
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProductTitleText(
                        title: 'Green Nike Shoes',
                      ),
                      SizedBox(
                        height: TSizes.spaceBtwItems / 2,
                      ),
                      BrandTitleTextWithVerifiedIcon(title: 'Nike'),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Flexible(
                        child: ProductPriceText(price: '249.0'),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          color: TColors.dark,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(TSizes.cardRadiusMd),
                            bottomRight:
                                Radius.circular(TSizes.productImageRadius),
                          ), // BorderRadius.only
                        ), // BoxDecoration
                        child: const SizedBox(
                          width: TSizes.iconLg * 1.2,
                          height: TSizes.iconLg * 1.2,
                          child: Center(
                              child: Icon(Iconsax.add, color: TColors.white)),
                        ), // SizedBox
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
