import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../utils/constants/sizes.dart';

class RatingAndShare extends StatelessWidget {
  const RatingAndShare({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
             const Icon(
              Iconsax.star5,
              color: Colors.orangeAccent,
            ),
            const SizedBox(
              width: TSizes.spaceBtwItems / 2,
            ),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                      text: '4.9 ',
                      style: Theme.of(context).textTheme.bodyLarge),
                  const TextSpan(text: '(259)')
                ],
              ),
            ),
          ],
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Iconsax.share,
            size: TSizes.iconMd,
          ),
        ),
      ],
    );
  }
}
