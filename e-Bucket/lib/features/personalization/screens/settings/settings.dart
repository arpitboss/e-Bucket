import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/custom_shapes/container/primary_header_container.dart';
import 'package:t_store/common/widgets/list_tiles/settings_menu_tile.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/features/personalization/screens/address/address.dart';
import 'package:t_store/features/personalization/screens/profile/profile.dart';
import 'package:t_store/features/personalization/screens/settings/upload_settings.dart';
import 'package:t_store/features/shop/screens/order/order.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';

import '../../../../common/widgets/list_tiles/user_profile_tile.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            PrimaryHeaderContainer(
              child: Column(
                children: [
                  ReusableAppBar(
                    title: Text(
                      'Account',
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .apply(color: TColors.white),
                    ),
                  ),
                  UserProfileTile(
                    onPressed: () => Get.to(() => const ProfileScreen()),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  const SectionHeading(
                    headingText: 'Account Settings',
                    showActionButton: false,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  SettingsMenu(
                      icon: Iconsax.safe_home,
                      title: 'My Addresses',
                      subtitle: 'Set shopping delivery address',
                      onTap: () => Get.to(() => const UserAddressScreen())),
                  const SettingsMenu(
                      icon: Iconsax.shopping_cart,
                      title: 'My Cart',
                      subtitle: 'Add, remove products and move to checkout'),
                  SettingsMenu(
                    icon: Iconsax.bag_tick,
                    title: 'My Orders',
                    subtitle: 'In-progress and Completed Orders',
                    onTap: () => Get.to(() => const OrderScreen()),
                  ),
                  const SettingsMenu(
                      icon: Iconsax.bank,
                      title: 'Bank Account',
                      subtitle: 'Withdraw balance to registered bank account'),
                  const SettingsMenu(
                      icon: Iconsax.discount_shape,
                      title: 'My Coupons',
                      subtitle: 'List of all the discounted coupons'),
                  const SettingsMenu(
                      icon: Iconsax.notification,
                      title: 'Notifications',
                      subtitle: 'Set any kind of notification message'),
                  const SettingsMenu(
                      icon: Iconsax.security_card,
                      title: 'Account Privacy',
                      subtitle: 'Manage data usage and connected accounts'),

                  /// App Settings
                  const SizedBox(height: TSizes.spaceBtwSections),
                  const SectionHeading(
                    showActionButton: false,
                    headingText: 'App Settings',
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  SettingsMenu(
                      onTap: () {
                        Get.to(() => const UploadSettings());
                      },
                      icon: Iconsax.document_upload,
                      title: 'Load Data',
                      subtitle: 'Upload Data to your Cloud Firebase'),
                  SettingsMenu(
                    icon: Iconsax.location,
                    title: 'Geolocation',
                    subtitle: 'Set recommendation based on location',
                    trailing: Switch(value: true, onChanged: (value) {}),
                  ), // TSettingsMenuTile
                  SettingsMenu(
                    icon: Iconsax.security_user,
                    title: 'Safe Mode',
                    subtitle: 'Search result is safe for all ages',
                    trailing: Switch(value: false, onChanged: (value) {}),
                  ), // TSettings MenuTile
                  SettingsMenu(
                    icon: Iconsax.image,
                    title: 'HD Image Quality',
                    subtitle: 'Set image quality to be seen',
                    trailing: Switch(value: false, onChanged: (value) {}),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () {},
                      child: const Text('Logout'),
                    ),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections * 2,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
