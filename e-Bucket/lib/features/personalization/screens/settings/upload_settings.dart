import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/data/repositories/banners/banners_repository.dart';
import 'package:t_store/data/repositories/brands/brand_repository.dart';
import 'package:t_store/data/repositories/products/product_repository.dart';
import 'package:t_store/utils/constants/sizes.dart';

import '../../../../common/widgets/list_tiles/settings_menu_tile.dart';
import '../../../../data/dummy/dummy_data.dart';
import '../../../../data/repositories/categories/categories_repository.dart';

class UploadSettings extends StatelessWidget {
  const UploadSettings({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryRepo = CategoryRepository();
    final bannerRepo = BannerRepository();
    final productRepo = ProductRepository();
    final brandRepo = BrandRepository();
    return Scaffold(
      appBar: const ReusableAppBar(
        title: Text('Upload Data'),
        showBackArrow: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            SettingsMenu(
              icon: Iconsax.category,
              title: 'Load Categories',
              subtitle: '',
              trailing: IconButton(
                icon: const Icon(
                  Iconsax.arrow_up_1,
                ),
                onPressed: () {
                  categoryRepo.uploadDummyCategories(DummyData.categories);
                },
              ),
            ),
            SettingsMenu(
              icon: Iconsax.shop,
              title: 'Load Brands',
              trailing: IconButton(
                icon: const Icon(
                  Iconsax.arrow_up_1,
                ),
                onPressed: () {
                  brandRepo.uploadDummyBrands(DummyData.brands);
                },
              ),
              subtitle: '',
            ), // TSettingsMenuTile
            SettingsMenu(
              icon: Iconsax.shopping_cart,
              title: 'Load Products',
              subtitle: '',
              trailing: IconButton(
                icon: const Icon(
                  Iconsax.arrow_up_1,
                ),
                onPressed: () {
                  productRepo.uploadDummyProducts(DummyData.products);
                },
              ),
            ), // TSettings MenuTile
            SettingsMenu(
              icon: Iconsax.image,
              title: 'Load Banners',
              subtitle: '',
              trailing: IconButton(
                icon: const Icon(
                  Iconsax.arrow_up_1,
                ),
                onPressed: () {
                  bannerRepo.uploadDummyBanners(DummyData.banners);
                },
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),
          ],
        ),
      ),
    );
  }
}
