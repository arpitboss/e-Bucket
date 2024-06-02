import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/icons/circular_icon.dart';
import 'package:t_store/common/widgets/layouts/grid_layout.dart';
import 'package:t_store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:t_store/features/shop/controllers/product_controller.dart';
import 'package:t_store/features/shop/screens/home/home.dart';
import 'package:t_store/utils/constants/sizes.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReusableAppBar(
          title: Text(
            'Wishlist',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: [
            CircularIcon(
              icon: Iconsax.add,
              onPressed: () {
                Get.to(const HomeScreen());
              },
            ),
          ]),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: GridLayout(
            itemCount: 4,
            itemBuilder: (_, index) {
              return ProductCardVertical(
                  product: ProductController.instance.featuredProducts[index]);
            },
          ),
        ),
      ),
    );
  }
}
