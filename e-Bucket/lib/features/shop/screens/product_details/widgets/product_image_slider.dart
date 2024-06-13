import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/products/favorite_icon/favorite_icon.dart';
import 'package:t_store/features/shop/controllers/product/image_controller.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/custom_shapes/curved_edges/custom_edge_widget.dart';
import '../../../../../common/widgets/images/rounded_image.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../models/product_model.dart';

class ProductImageSlider extends StatelessWidget {
  final ProductModel product;
  const ProductImageSlider({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = Get.put(ImagesController());
    final images = controller.getAllProductsImage(product);
    return CustomEdgeWidget(
      child: Container(
        color: dark ? TColors.darkerGrey : TColors.light,
        child: Stack(
          children: [
            SizedBox(
              height: 400,
              child: Padding(
                  padding: const EdgeInsets.all(TSizes.productImageRadius * 2),
                  child: Center(child: Obx(
                    () {
                      final image = controller.selectedProductImage.value;
                      return GestureDetector(
                        onTap: () {
                          controller.showEnlargedImage(image);
                        },
                        child: CachedNetworkImage(
                          imageUrl: image,
                          progressIndicatorBuilder: (_, __, downloadProgress) =>
                              CircularProgressIndicator(
                            value: downloadProgress.progress,
                            color: TColors.primary,
                          ),
                        ),
                      );
                    },
                  ))),
            ),
            Positioned(
              bottom: 30,
              right: 0,
              left: TSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                    physics: const AlwaysScrollableScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, index) => Obx(() {
                          final imageSelected =
                              controller.selectedProductImage.value ==
                                  images[index];
                          return RoundedImage(
                              width: 80,
                              isNetworkImage: true,
                              border: Border.all(
                                  color: imageSelected
                                      ? TColors.primary
                                      : Colors.transparent),
                              padding: const EdgeInsets.all(TSizes.sm),
                              bgColor: dark ? TColors.dark : TColors.light,
                              onPressed: () {
                                controller.selectedProductImage.value =
                                    images[index];
                              },
                              imageUrl: images[index]);
                        }),
                    separatorBuilder: (_, __) => const SizedBox(
                          width: TSizes.spaceBtwItems,
                        ),
                    itemCount: images.length),
              ),
            ),
            ReusableAppBar(
              showBackArrow: true,
              actions: [
                FavoriteIcon(
                  productId: product.id,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
