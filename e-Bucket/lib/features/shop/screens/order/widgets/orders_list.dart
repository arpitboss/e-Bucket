import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/custom_shapes/container/circular_container.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class OrderListItems extends StatelessWidget {
  const OrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 2,
      separatorBuilder: (_, __) => const SizedBox(
        height: TSizes.spaceBtwItems,
      ),
      itemBuilder: (_, index) => CircularContainer(
        padding: const EdgeInsets.all(TSizes.md),
        showBorder: true,
        backgroundColor: dark ? TColors.dark : TColors.light,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                const Icon(Iconsax.ship),
                const SizedBox(
                  width: TSizes.spaceBtwItems / 2,
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Processing',
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .apply(color: TColors.primary, fontWeightDelta: 1),
                      ),
                      Text(
                        '14 Dec, 2023',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Iconsax.arrow_right_34,
                    size: TSizes.iconSm,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      const Icon(Iconsax.tag),
                      const SizedBox(
                        width: TSizes.spaceBtwItems / 2,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Order',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .apply(
                                      color: TColors.primary,
                                      fontWeightDelta: 1),
                            ),
                            Text(
                              '[#456734]',
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      const Icon(Iconsax.calendar),
                      const SizedBox(
                        width: TSizes.spaceBtwItems / 2,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Shipping Date',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .apply(
                                      color: TColors.primary,
                                      fontWeightDelta: 1),
                            ),
                            Text(
                              '14 Dec, 2023',
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
