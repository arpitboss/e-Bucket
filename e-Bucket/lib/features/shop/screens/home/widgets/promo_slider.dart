import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../common/widgets/custom_shapes/container/circular_container.dart';
import '../../../../../common/widgets/images/rounded_image.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../controllers/home_controller.dart';

class PromoSlider extends StatelessWidget {
  const PromoSlider({
    super.key,
    required this.banners,
  });

  final List<String> banners;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());

    return Column(
      children: [
        CarouselSlider(
          items: banners
              .map((url) => RoundedImage(
                    imageUrl: url,
                  ))
              .toList(),
          options: CarouselOptions(
            autoPlayAnimationDuration: const Duration(milliseconds: 300),
            onPageChanged: (index, _) {
              controller.updatePageIndicator(index);
            },
            viewportFraction: 1,
          ),
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),
        Center(
          child: Obx(
            () => Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (int i = 0; i < banners.length; i++)
                  CircularContainer(
                    margin: const EdgeInsets.only(right: 10),
                    width: 20,
                    height: 5,
                    backgroundColor: controller.carousalCurrentIndex.value == i
                        ? TColors.primary
                        : TColors.darkGrey,
                  ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
