import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/layouts/grid_layout.dart';
import 'package:t_store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import '../../../../../common/widgets/brands/brand_show_case.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                const BrandShowCase(
                  images: [
                    TImages.productImage3,
                    TImages.productImage2,
                    TImages.productImage1,
                  ],
                ),
                const BrandShowCase(
                  images: [
                    TImages.productImage3,
                    TImages.productImage2,
                    TImages.productImage1,
                  ],
                ),
                const SizedBox(
                  height: TSizes.spaceBtwItems,
                ),
                SectionHeading(
                  headingText: 'You Might Like',
                  onPressed: () {},
                ),
                const SizedBox(
                  height: TSizes.spaceBtwItems,
                ),
                GridLayout(
                    itemCount: 4,
                    itemBuilder: (_, index) => const ProductCardVertical()),
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),
              ],
            ),
          ),
        ]);
  }
}