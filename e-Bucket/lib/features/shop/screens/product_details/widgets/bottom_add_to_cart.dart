import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/icons/circular_icon.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class BottomAddToCart extends StatelessWidget {
  const BottomAddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
        padding: const EdgeInsets.symmetric(
            horizontal: TSizes.defaultSpace, vertical: TSizes.defaultSpace / 3),
        decoration: BoxDecoration(
            color: dark ? TColors.darkerGrey : TColors.light,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(TSizes.cardRadiusLg),
                topRight: Radius.circular(TSizes.cardRadiusLg))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircularIcon(
                  width: 40,
                  height: 40,
                  icon: Iconsax.minus,
                  color: TColors.white,
                  backgroundColor: TColors.darkGrey,
                ),
                const SizedBox(
                  width: TSizes.spaceBtwItems,
                ),
                Text(
                  '5',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(
                  width: TSizes.spaceBtwItems,
                ),
                const CircularIcon(
                  width: 40,
                  height: 40,
                  icon: Iconsax.add,
                  color: TColors.white,
                  backgroundColor: TColors.darkGrey,
                ),
              ],
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(TSizes.md),
                  backgroundColor: TColors.black,
                  side: const BorderSide(color: TColors.black),
                ),
                onPressed: () {},
                child: const Text('Add To Cart'))
          ],
        ));
  }
}
