import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/features/shop/controllers/product/favorites_controller.dart';
import 'package:t_store/utils/constants/colors.dart';

import '../../icons/circular_icon.dart';

class FavoriteIcon extends StatelessWidget {
  const FavoriteIcon({super.key, required this.productId});

  final String productId;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavoritesController());
    return Obx(
      () => CircularIcon(
        color: controller.isFavorite(productId) ? TColors.error : null,
        icon: controller.isFavorite(productId) ? Iconsax.heart5 : Iconsax.heart,
        onPressed: () {
          controller.toggleFavorite(productId);
        },
      ),
    );
  }
}
