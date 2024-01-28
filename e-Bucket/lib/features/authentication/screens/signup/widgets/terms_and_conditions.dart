import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/features/authentication/controllers/signup/signup_controller.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = SignUpController.instance;
    final dark = THelperFunctions.isDarkMode(context);
    return Row(
      children: [
        SizedBox(
          width: 15,
          height: 24,
          child: Obx(
            () => Checkbox(
                value: controller.privacyPolicy.value,
                onChanged: (value) => controller.privacyPolicy.value =
                    !controller.privacyPolicy.value),
          ),
        ),
        const SizedBox(
          width: TSizes.spaceBtwItems / 1.5,
        ),
        Text.rich(
          TextSpan(children: [
            TextSpan(
              text: TTexts.iAgreeTo,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            TextSpan(
              text: ' ${TTexts.privacyPolicy} ',
              style: Theme.of(context).textTheme.bodyMedium!.apply(
                    fontSizeFactor: 0.9,
                    color: dark ? TColors.white : TColors.primary,
                    decoration: TextDecoration.underline,
                    decorationColor: dark ? TColors.white : TColors.primary,
                  ),
            ),
            TextSpan(
              text: '${TTexts.and} ',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            TextSpan(
              text: TTexts.termsOfUse,
              style: Theme.of(context).textTheme.bodyMedium!.apply(
                  fontSizeFactor: 0.9,
                  color: dark ? TColors.white : TColors.primary,
                  decoration: TextDecoration.underline,
                  decorationColor: dark ? TColors.white : TColors.primary),
            )
          ]),
        ),
      ],
    );
  }
}
