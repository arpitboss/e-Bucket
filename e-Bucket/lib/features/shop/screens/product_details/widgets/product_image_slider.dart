import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/custom_shapes/curved_edges/custom_edge_widget.dart';
import '../../../../../common/widgets/icons/circular_icon.dart';
import '../../../../../common/widgets/images/rounded_image.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class ProductImageSlider extends StatelessWidget {
  const ProductImageSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return CustomEdgeWidget(
      child: Container(
        color: dark ? TColors.darkerGrey : TColors.light,
        child: Stack(
          children: [
            const SizedBox(
              height: 400,
              child: Padding(
                padding: EdgeInsets.all(TSizes.productImageRadius * 2),
                child: Center(
                    child: Image(
                        image: AssetImage(TImages.productImage5))),
              ),
            ),
            Positioned(
              bottom: 30,
              right: 0,
              left: TSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                    physics: const AlwaysScrollableScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, index) => RoundedImage(
                        width: 80,
                        border: Border.all(color: TColors.primary),
                        padding: const EdgeInsets.all(TSizes.sm),
                        bgColor: dark ? TColors.dark : TColors.light,
                        imageUrl: TImages.productImage3),
                    separatorBuilder: (_,__) => const SizedBox(width: TSizes.spaceBtwItems,),
                    itemCount: 10),
              ),
            ),
            const ReusableAppBar(
              showBackArrow: true,
              actions: [CircularIcon(icon: Iconsax.heart5, color: Colors.red,)],
            ),
          ],
        ),
      ),
    );
  }
}
