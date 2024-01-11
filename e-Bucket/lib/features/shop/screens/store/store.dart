import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/appbar/tabbar.dart';
import 'package:t_store/common/widgets/custom_shapes/container/search_container.dart';
import 'package:t_store/common/widgets/layouts/grid_layout.dart';
import 'package:t_store/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/features/shop/screens/store/widgets/category_tab.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';
import '../../../../common/widgets/brands/brand_card.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: ReusableAppBar(
          title: Text(
            'Store',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: [CartCounterIcon(onPressed: () {})],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                floating: true,
                backgroundColor: dark ? TColors.black : TColors.white,
                pinned: true,
                expandedHeight: 420,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(TSizes.defaultSpace),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      const SearchContainer(
                        text: 'Search in Store',
                        showBackground: false,
                        padding: EdgeInsets.zero,
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwSections,
                      ),
                      SectionHeading(
                        headingText: 'Featured Brands',
                        onPressed: () {},
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwItems / 1.5,
                      ),
                      GridLayout(
                        mainAxisExtent: 80,
                        itemCount: 4,
                        itemBuilder: (_, index) => const BrandCard(
                          showBorder: true,
                        ),
                      ),
                    ],
                  ),
                ),
                bottom: const ReusableTabBar(
                  tabs: [
                    Tab(
                      child: Text('Sports'),
                    ),
                    Tab(
                      child: Text('Furnitures'),
                    ),
                    Tab(
                      child: Text('Electronics'),
                    ),
                    Tab(
                      child: Text('Clothes'),
                    ),
                    Tab(
                      child: Text('Cosmetics'),
                    ),
                  ],
                ),
              ),
            ];
          },
          body: const TabBarView(
            children: [
              CategoryTab(),
              CategoryTab(),
              CategoryTab(),
              CategoryTab(),
              CategoryTab(),
            ],
          ),
        ),
      ),
    );
  }
}
