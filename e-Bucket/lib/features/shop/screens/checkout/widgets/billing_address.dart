import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/utils/constants/sizes.dart';

class BillingAddress extends StatelessWidget {
  const BillingAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeading(
          headingText: 'Shipping Address',
          buttonText: 'change',
          onPressed: () {},
        ),
        Text(
          'Arpit Verma',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems / 2,
        ),
        Row(
          children: [
            const Icon(
              CupertinoIcons.phone,
              size: 16,
              color: Colors.grey,
            ),
            const SizedBox(
              width: TSizes.spaceBtwItems,
            ),
            Text(
              '+91 7678607016',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems / 2,
        ),
        Row(
          children: [
            const Icon(
              Icons.location_history_rounded,
              size: 16,
              color: Colors.grey,
            ),
            const SizedBox(
              width: TSizes.spaceBtwItems,
            ),
            Expanded(
              child: Text(
                'Ajay Kumar Garg Engineering College, Ghaziabad',
                style: Theme.of(context).textTheme.bodyMedium,
                softWrap: true,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
