import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../images/circular_image.dart';

class UserProfileTile extends StatelessWidget {
  const UserProfileTile({
    super.key, this.onPressed,
  });

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircularImage(
        image: TImages.user,
        width: 50,
        height: 50,
        padding: 0,
      ),
      title: Text('Arpit Verma',
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .apply(color: TColors.white)),
      subtitle: Text(
        'Flutter Developer',
        style:
            Theme.of(context).textTheme.bodyMedium!.apply(color: TColors.white),
      ),
      trailing: IconButton(
        icon: const Icon(Iconsax.edit),
        color: TColors.white,
        onPressed: onPressed,
      ),
    );
  }
}
