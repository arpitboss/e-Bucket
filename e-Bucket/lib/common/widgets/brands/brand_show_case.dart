import 'package:flutter/material.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../custom_shapes/container/circular_container.dart';
import 'brand_card.dart';

class BrandShowCase extends StatelessWidget {
  const BrandShowCase({
    super.key,
    required this.images,
  });

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return CircularContainer(
      padding: const EdgeInsets.all(TSizes.md),
      showBorder: true,
      borderColor: TColors.darkGrey,
      margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
      backgroundColor: Colors.transparent,
      child: Column(
        children: [
          const BrandCard(
            showBorder: false,
          ),
          const SizedBox(
            height: TSizes.spaceBtwItems,
          ),
          Row(
            children: images
                .map((image) => brandTopProductImageWidget(image, context))
                .toList(),
          )
        ],
      ),
    );
  }

  Widget brandTopProductImageWidget(String image, context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Expanded(
      child: CircularContainer(
        height: 100,
        padding: const EdgeInsets.all(TSizes.md),
        margin: const EdgeInsets.only(right: TSizes.sm),
        backgroundColor: dark ? TColors.darkerGrey : TColors.light,
        child: Image(fit: BoxFit.contain, image: AssetImage(image)),
      ), // TRoundedContainer
    ); // Expanded
  }
}
