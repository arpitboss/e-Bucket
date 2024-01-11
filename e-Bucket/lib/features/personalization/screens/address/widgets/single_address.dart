import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/custom_shapes/container/circular_container.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class SingleAddress extends StatelessWidget {
  const SingleAddress({super.key, required this.selectedAddress});

  final bool selectedAddress;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return CircularContainer(
      padding: const EdgeInsets.all(TSizes.md),
      width: double.infinity,
      showBorder: true,
      backgroundColor: selectedAddress
          ? TColors.primary.withOpacity(0.6)
          : Colors.transparent,
      borderColor: selectedAddress
          ? Colors.transparent
          : dark
              ? TColors.darkerGrey
              : TColors.grey,
      margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
      child: Stack(
        children: [
          Positioned(
            right: 5,
            top: 0,
            child: Icon(
              selectedAddress ? Iconsax.tick_circle5 : null,
              color: selectedAddress
                  ? dark
                      ? TColors.light
                      : TColors.dark.withOpacity(0.9)
                  : null,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Arpit Verma', style: Theme.of(context).textTheme.titleLarge, maxLines: 1, overflow: TextOverflow.ellipsis,),
              const SizedBox(height: TSizes.sm/2),
              const Text('+91 7678607016', maxLines: 1, overflow: TextOverflow.ellipsis,),
              const SizedBox(height: TSizes.sm/2),
              const Text('Ajay Kumar Garg Engineering College, Ghaziabad',
                softWrap: true,
              ),
              const SizedBox(height: TSizes.sm/2,)
            ],
          ),
        ],
      ),
    );
  }
}
