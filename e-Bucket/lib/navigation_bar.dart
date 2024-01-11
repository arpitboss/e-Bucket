import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/features/personalization/screens/settings/settings.dart';
import 'package:t_store/features/shop/screens/home/home.dart';
import 'package:t_store/features/shop/screens/store/store.dart';
import 'package:t_store/features/shop/screens/wishlist/wishlist.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final darkMode = THelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          height: 65,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) {
            controller.selectedIndex.value = index;
          },
          backgroundColor: darkMode ? TColors.black : TColors.white,
          indicatorColor: darkMode
              ? TColors.white.withOpacity(0.1)
              : TColors.black.withOpacity(0.1),
          destinations: const [
            NavigationDestination(
                selectedIcon: Icon(Iconsax.house),
                icon: Icon(Iconsax.home),
                label: 'Home'),
            NavigationDestination(
                selectedIcon: Icon(Iconsax.shopping_cart),
                icon: Icon(Iconsax.shop),
                label: 'Store'),
            NavigationDestination(
                selectedIcon: Icon(Iconsax.bookmark),
                icon: Icon(Iconsax.heart),
                label: 'Wishlist'),
            NavigationDestination(
                selectedIcon: Icon(Iconsax.profile_2user),
                icon: Icon(Iconsax.user),
                label: 'Profile'),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final screens = [
    const HomeScreen(),
    const StoreScreen(),
    const WishlistScreen(),
    const SettingsScreen(),
  ];
}
