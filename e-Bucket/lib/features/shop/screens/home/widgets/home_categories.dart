import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/features/shop/screens/sub_category/sub_categories.dart';

import '../../../../../common/widgets/image_text_widgets/image_text.dart';
import '../../../../../utils/constants/image_strings.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: 8,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            return ImageText(
              image: TImages.shoeIcon,
              title: 'Shoes',
              onTap: () {
                Get.to(() => const SubCategoriesScreen());
              },
            );
          }),
    );
  }
}
