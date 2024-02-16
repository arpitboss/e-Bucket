import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/images/circular_image.dart';
import 'package:t_store/common/widgets/loaders/shimmer.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/features/personalization/controllers/user_controller.dart';
import 'package:t_store/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';

import 'widgets/change_name.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: const ReusableAppBar(
        title: Text('Profile'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  Obx(() {
                    final networkImage = controller.user.value.profilePicture;
                    final image =
                        networkImage.isNotEmpty ? networkImage : TImages.user;
                    return controller.imageUploading.value
                        ? const ShimmerEffect(width: 80, height: 80)
                        : CircularImage(
                            image: image,
                            width: 80,
                            height: 80,
                            isNetworkImage: networkImage.isNotEmpty,
                          );
                  }),
                  TextButton(
                    onPressed: () => controller.uploadUserProfilePicture(),
                    child: const Text('Change Profile Icon'),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems / 2,
            ),
            const Divider(),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            const SectionHeading(
              headingText: 'Profile Info.',
              showActionButton: false,
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            ProfileMenu(
              icon: Iconsax.arrow_right_34,
              onPressed: () => Get.to(() => const ChangeName()),
              title: 'Name',
              value: controller.user.value.fullName,
            ),
            ProfileMenu(
                icon: Iconsax.arrow_right_34,
                onPressed: () {},
                title: 'Username',
                value: controller.user.value.username),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            const Divider(),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            const SectionHeading(
              headingText: 'Personal Info.',
              showActionButton: false,
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            ProfileMenu(
                icon: Iconsax.copy,
                onPressed: () {},
                title: 'User ID',
                value: controller.user.value.id),
            ProfileMenu(
                icon: Iconsax.arrow_right_34,
                onPressed: () {},
                title: 'E-mail',
                value: controller.user.value.email),
            ProfileMenu(
                icon: Iconsax.arrow_right_34,
                onPressed: () {},
                title: 'Pho. Number',
                value: controller.user.value.phoneNumber),
            ProfileMenu(
                icon: Iconsax.arrow_right_34,
                onPressed: () {},
                title: 'Gender',
                value: 'Male'),
            ProfileMenu(
                icon: Iconsax.arrow_right_34,
                onPressed: () {},
                title: 'DOB',
                value: '12/06/2004'),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            const Divider(),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            Center(
              child: TextButton(
                onPressed: () => controller.deleteAccountWarningPopup(),
                child: const Text('Close Account',
                    style: TextStyle(color: Colors.red)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
