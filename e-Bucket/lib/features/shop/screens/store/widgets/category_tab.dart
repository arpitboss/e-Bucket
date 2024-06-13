import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/layouts/grid_layout.dart';
import 'package:t_store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/features/shop/controllers/category_controller.dart';
import 'package:t_store/features/shop/models/category_model.dart';
import 'package:t_store/features/shop/screens/all_products/all_products.dart';
import 'package:t_store/features/shop/screens/store/widgets/category_brands.dart';

import '../../../../../common/widgets/shimmers/vertical_product_shimmer.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/cloud_helper_functions.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    return ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                CategoryBrands(category: category),
                const SizedBox(
                  height: TSizes.spaceBtwItems,
                ),
                FutureBuilder(
                    future:
                        controller.getCategoryProducts(categoryId: category.id),
                    builder: (context, snapshot) {
                      const loader = TVerticalProductShimmer();
                      final widget =
                          TCloudHelperFunctions.checkMultiRecordState(
                              snapshot: snapshot, loader: loader);
                      if (widget != null) return widget;
                      final products = snapshot.data!;

                      return Column(
                        children: [
                          SectionHeading(
                            headingText: 'You Might Like',
                            onPressed: () {
                              Get.to(() => AllProducts(
                                    title: category.name,
                                    futureMethod:
                                        controller.getCategoryProducts(
                                            categoryId: category.id, limit: -1),
                                  ));
                            },
                          ),
                          const SizedBox(
                            height: TSizes.spaceBtwItems,
                          ),
                          GridLayout(
                              itemCount: products.length,
                              itemBuilder: (_, index) => ProductCardVertical(
                                    product: products[index],
                                  )),
                        ],
                      );
                    })
              ],
            ),
          ),
        ]);
  }
}
