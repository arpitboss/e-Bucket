import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/features/personalization/screens/address/add_new_address.dart';
import 'package:t_store/features/personalization/screens/address/widgets/single_address.dart';
import 'package:t_store/utils/constants/colors.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: TColors.primary,
          onPressed: () {
            Get.to(() => const AddNewAddressScreen());
          },
          child: const Icon(
            Iconsax.add,
            color: TColors.white,
          )),
      appBar: ReusableAppBar(
        title: Text(
          'Addresses',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        showBackArrow: true,
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              SingleAddress(selectedAddress: true),
              SingleAddress(selectedAddress: false),
            ],
          ),
        ),
      ),
    );
  }
}
