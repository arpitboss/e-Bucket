import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/brands/brand_card.dart';
import 'package:t_store/common/widgets/layouts/grid_layout.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/features/shop/controllers/brand_controller.dart';
import 'package:t_store/features/shop/screens/brands/brand_products.dart';
import 'package:t_store/utils/constants/sizes.dart';

import '../../../../common/widgets/shimmers/brand_shimmer.dart';

class AllBrands extends StatelessWidget {
  const AllBrands({super.key});

  @override
  Widget build(BuildContext context) {
    final brandController = BrandController.instance;
    return Scaffold(
      appBar: const ReusableAppBar(
        title: Text('All Brands'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              const SectionHeading(
                headingText: 'Brands',
                showActionButton: false,
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              Obx(() {
                if (brandController.isLoading.value) {
                  return const BrandShimmer();
                }
                if (brandController.allBrands.isEmpty) {
                  return Center(
                    child: Text(
                      'No Data Found!',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .apply(color: Colors.white),
                    ),
                  );
                }
                return GridLayout(
                    mainAxisExtent: 80,
                    itemCount: brandController.allBrands.length,
                    itemBuilder: (_, index) {
                      final brand = brandController.featuredBrands[index];
                      return BrandCard(
                        onTap: () {
                          Get.to(() => BrandProducts(
                                brand: brand,
                              ));
                        },
                        showBorder: true,
                        brand: brand,
                      );
                    });
              })
            ],
          ),
        ),
      ),
    );
  }
}
