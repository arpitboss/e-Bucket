import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/images/rounded_image.dart';
import 'package:t_store/common/widgets/products/product_cards/product_card_horizontal.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ReusableAppBar(
        title: Text('Sports'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              const RoundedImage(
                imageUrl: TImages.productImage4,
                width: double.infinity,
                applyImageRadius: true,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              Column(
                children: [
                  SectionHeading(
                    headingText: 'Sports',
                    onPressed: () {},
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems / 2,
                  ),
                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      itemBuilder: (context, index) =>
                          const ProductCardHorizontal(),
                      separatorBuilder: (_, __) => const SizedBox(
                        width: TSizes.spaceBtwItems,
                      ),
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
