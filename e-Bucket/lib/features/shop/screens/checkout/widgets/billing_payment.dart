import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/custom_shapes/container/circular_container.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';

import '../../../../../utils/helpers/helper_functions.dart';

class BillingPayment extends StatelessWidget {
  const BillingPayment({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        SectionHeading(
          onPressed: () {},
          headingText: 'Payment',
          buttonText: 'change',
        ),
        Row(
          children: [
            CircularContainer(
              width: 60,
              height: 35,
              backgroundColor: dark ? TColors.light : TColors.white,
              padding: const EdgeInsets.all(TSizes.sm),
              child: const Image(
                image: AssetImage(
                  TImages.paytm,
                ),
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(
              width: TSizes.spaceBtwItems / 2,
            ),
            Text(
              'Paytm',
              style: Theme.of(context).textTheme.bodyLarge,
            )
          ],
        )
      ],
    );
  }
}
