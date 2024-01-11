import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/brands/brand_card.dart';
import 'package:t_store/common/widgets/layouts/grid_layout.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/features/shop/screens/brands/brand_products.dart';
import 'package:t_store/utils/constants/sizes.dart';

class AllBrands extends StatelessWidget {
  const AllBrands({super.key});

  @override
  Widget build(BuildContext context) {
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
              GridLayout(
                  mainAxisExtent: 80,
                  itemCount: 10,
                  itemBuilder: (_, index) => BrandCard(
                        showBorder: true,
                        onTap: () => Get.to(() => const BrandProducts()),
                      )),
            ],
          ),
        ),
      ),
    );
  }
}
