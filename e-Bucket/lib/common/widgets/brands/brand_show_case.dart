import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/shimmers/shimmer.dart';
import 'package:t_store/features/shop/screens/brands/brand_products.dart';
import '../../../features/shop/models/brand_model.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../custom_shapes/container/circular_container.dart';
import 'brand_card.dart';

class BrandShowCase extends StatelessWidget {
  const BrandShowCase({
    super.key,
    required this.images,
    required this.brand,
  });

  final List<String> images;
  final BrandModel brand;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => BrandProducts(brand: brand));
      },
      child: CircularContainer(
        padding: const EdgeInsets.all(TSizes.md),
        showBorder: true,
        borderColor: TColors.darkGrey,
        margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
        backgroundColor: Colors.transparent,
        child: Column(
          children: [
            BrandCard(
              showBorder: false,
              brand: brand,
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
        child: CachedNetworkImage(
          fit: BoxFit.contain,
          imageUrl: image,
          progressIndicatorBuilder: (context, url, downloadProgress) =>
              const ShimmerEffect(width: 100, height: 100),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ), // TRoundedContainer
    ); // Expanded
  }
}
