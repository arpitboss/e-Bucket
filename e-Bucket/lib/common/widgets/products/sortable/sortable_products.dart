import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/features/shop/controllers/all_products_controller.dart';

import '../../../../features/shop/models/product_model.dart';
import '../../../../utils/constants/sizes.dart';
import '../../layouts/grid_layout.dart';
import '../product_cards/product_card_vertical.dart';

class SortableProducts extends StatelessWidget {
  const SortableProducts({
    super.key,
    required this.products,
  });

  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductsController());
    controller.assignProducts(products);
    return Column(
      children: [
        DropdownButtonFormField(
          value: controller.selectedSortOption.value,
          decoration: const InputDecoration(
            prefixIcon: Icon(Iconsax.sort),
          ),
          items: [
            'Name',
            'Newest',
            'Sale',
            'Higher Price',
            'Lower Price',
            'Popularity'
          ]
              .map(
                (option) => DropdownMenuItem(
                  value: option,
                  child: Text(option),
                ),
              )
              .toList(),
          onChanged: (value) {
            controller.sortProducts(value!);
          },
        ),
        const SizedBox(
          height: TSizes.spaceBtwSections,
        ),
        Obx(
          () => GridLayout(
              itemCount: controller.products.length,
              itemBuilder: (_, index) => ProductCardVertical(
                    product: controller.products[index],
                  )),
        ),
      ],
    );
  }
}
