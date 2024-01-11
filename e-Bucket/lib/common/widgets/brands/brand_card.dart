import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/enums.dart';
import '../../../../utils/constants/sizes.dart';
import '../custom_shapes/container/circular_container.dart';
import '../images/circular_image.dart';
import '../texts/brand_title_text_with_verified_icon.dart';


class BrandCard extends StatelessWidget {
  const BrandCard({
    super.key,
    this.showBorder = true,
    this.padding = const EdgeInsets.all(TSizes.sm),
    this.bgColor = Colors.transparent,
    this.image=TImages.creditCard,
    this.title='Nike',
    this.subTitle='256 products',
    this.brandTextSize = TextSizes.large, this.onTap,
  });

  final bool showBorder;
  final void Function()? onTap;
  final EdgeInsetsGeometry padding;
  final Color bgColor;
  final String image, title, subTitle;
  final TextSizes brandTextSize;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: CircularContainer(
        backgroundColor: bgColor,
        showBorder: showBorder,
        padding: const EdgeInsets.all(TSizes.sm),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: CircularImage(
                isNetworkImage: false,
                backgroundColor: Colors.transparent,
                overlayColor: dark ? TColors.white : TColors.black,
                image: image,
              ),
            ),
            const SizedBox(
              width: TSizes.spaceBtwItems / 4,
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BrandTitleTextWithVerifiedIcon(
                    title: title,
                    brandTextSize: brandTextSize,
                  ),
                  Text(
                    subTitle,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
