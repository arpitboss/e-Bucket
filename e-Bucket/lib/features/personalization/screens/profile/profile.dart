import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/images/circular_image.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                  const CircularImage(
                    image: TImages.user,
                    width: 80,
                    height: 80,
                  ),
                  TextButton(
                    onPressed: () {},
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
              onPressed: () {},
              title: 'Name',
              value: 'Arpit Verma',
            ),
            ProfileMenu(
                icon: Iconsax.arrow_right_34,
                onPressed: () {},
                title: 'Username',
                value: 'arpitboss'),
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
                value: '592247'),
            ProfileMenu(
                icon: Iconsax.arrow_right_34,
                onPressed: () {},
                title: 'E-mail',
                value: 'arpit123boss@gmail.com'),
            ProfileMenu(
                icon: Iconsax.arrow_right_34,
                onPressed: () {},
                title: 'Pho. Number',
                value: '+91 7678607016'),
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
                onPressed: () {},
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
