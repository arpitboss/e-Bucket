import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/texts/product_price_text.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';
import '../../../../../common/widgets/chips/choice_chip.dart';
import '../../../../../common/widgets/custom_shapes/container/circular_container.dart';
import '../../../../../common/widgets/texts/product_title_text.dart';
import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../utils/constants/sizes.dart';

class ProductAttributes extends StatelessWidget {
  const ProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        CircularContainer(
          padding: const EdgeInsets.all(TSizes.md),
          backgroundColor: dark ? TColors.darkerGrey : TColors.grey,
          child: Column(
            children: [
              Row(
                children: [
                  const SectionHeading(
                    headingText: 'Variations',
                    showActionButton: false,
                  ),
                  const SizedBox(
                    width: TSizes.spaceBtwItems,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const ProductTitleText(
                            title: 'Price : ',
                            smallSize: true,
                          ),
                          Text(
                            '₹ 389',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .apply(decoration: TextDecoration.lineThrough),
                          ),
                          const SizedBox(
                            width: TSizes.spaceBtwItems,
                          ),
                          const ProductPriceText(price: '250'),
                        ],
                      ),
                      Row(
                        children: [
                          const ProductTitleText(
                            title: 'Stock : ',
                            smallSize: true,
                          ),
                          Text('In Stock',
                              style: Theme.of(context).textTheme.titleMedium)
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const ProductTitleText(
                title:
                    'Product Description and Details of the Product which is based on Make in India.',
                smallSize: true,
                maxLines: 4,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionHeading(headingText: 'Colors', showActionButton: false,),
            const SizedBox(
              height: TSizes.spaceBtwItems/2,
            ),
            Wrap(
              spacing: 8,
              children: [
                ReusableChoiceChip(
                  text: 'Blue',
                  selected: false,
                    onSelected: (value) {},
                ),
                ReusableChoiceChip(
                  text: 'Green',
                  selected: false,
                  onSelected: (value) {},
                ),
                ReusableChoiceChip(
                  text: 'Indigo',
                  selected: true,
                    onSelected: (value) {},
                ),
                ReusableChoiceChip(
                  text: 'Pink',
                  selected: false,
                  onSelected: (value) {},
                ),
                ReusableChoiceChip(
                  text: 'Purple',
                  selected: false,
                  onSelected: (value) {},
                ),
                ReusableChoiceChip(
                  text: 'Grey',
                  selected: false,
                  onSelected: (value) {},
                ),
                ReusableChoiceChip(
                  text: 'Brown',
                  selected: false,
                  onSelected: (value) {},
                )
              ],
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionHeading(headingText: 'Sizes', showActionButton: false,),
            const SizedBox(
              height: TSizes.spaceBtwItems/2,
            ),
            Wrap(
              spacing: 8,
              children: [
                ReusableChoiceChip(
                  text: 'UK 47',
                  selected: false,
                    onSelected: (value) {},
                ),
                ReusableChoiceChip(
                  text: 'EU 37',
                  selected: false,
                  onSelected: (value) {},
                ),
                ReusableChoiceChip(
                  text: 'IND 38',
                  selected: true,
                    onSelected: (value) {},
                ),
              ],
            ),
          ],
        ),

      ],
    );
  }
}
