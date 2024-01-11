import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/custom_shapes/container/circular_container.dart';
import 'package:t_store/common/widgets/success_screens/success_screen.dart';
import 'package:t_store/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:t_store/features/shop/screens/checkout/widgets/billing_address.dart';
import 'package:t_store/features/shop/screens/checkout/widgets/billing_amount.dart';
import 'package:t_store/features/shop/screens/checkout/widgets/billing_payment.dart';
import 'package:t_store/navigation_bar.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';

import '../../../../common/widgets/products/cart/coupon_code.dart';
import '../../../../utils/helpers/helper_functions.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: ReusableAppBar(
        title: Text(
          'Order Review',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              const CartItems(
                showAddRemoveButton: false,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections / 2,
              ),
              const CouponCode(),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              CircularContainer(
                padding: const EdgeInsets.all(TSizes.md),
                showBorder: true,
                backgroundColor: dark ? TColors.black : TColors.white,
                child: const Column(
                  children: [
                    BillingAmount(),
                    SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),
                    Divider(),
                    SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),
                    BillingPayment(),
                    SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),
                    BillingAddress(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () {
            Get.to(() => SuccessScreen(
                image: TImages.successfulPaymentIcon,
                title: 'Payment Successful',
                subtitle: 'Your Item will be shipped soon...',
                onPressed: () {
                  Get.offAll(() => const NavigationMenu());
                }));
          },
          child: const Text('Checkout ₹998.0'),
        ),
      ),
    );
  }
}
