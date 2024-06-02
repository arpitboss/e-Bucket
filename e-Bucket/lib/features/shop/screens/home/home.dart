import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/custom_shapes/container/primary_header_container.dart';
import 'package:t_store/common/widgets/custom_shapes/container/search_container.dart';
import 'package:t_store/features/shop/screens/all_products/all_products.dart';
import 'package:t_store/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:t_store/features/shop/screens/home/widgets/home_categories.dart';
import 'package:t_store/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:t_store/utils/constants/sizes.dart';

import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/products/product_cards/product_card_vertical.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const PrimaryHeaderContainer(
              child: Column(children: [
                HomeAppBar(),
                SizedBox(
                  height: TSizes.spaceBtwSections,
                ),
                SearchContainer(text: 'Search in Shop'),
                SizedBox(
                  height: TSizes.spaceBtwSections,
                ),
                Padding(
                  padding: EdgeInsets.only(left: TSizes.defaultSpace),
                  child: Column(children: [
                    SectionHeading(
                      headingText: 'Product Categories',
                      showActionButton: false,
                      textColor: TColors.white,
                    ),
                    SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),
                    HomeCategories(),
                  ]),
                ),
                SizedBox(
                  height: TSizes.spaceBtwSections,
                ),
              ]),
            ),
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  const PromoSlider(),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  SectionHeading(
                    headingText: 'Popular Products',
                    onPressed: () {
                      Get.to(() => const AllProducts());
                    },
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  GridLayout(
                    itemCount: 4,
                    itemBuilder: (_, index) => const ProductCardVertical(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
