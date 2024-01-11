import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/features/authentication/screens/signup/verify_email.dart';
import 'package:t_store/features/authentication/screens/signup/widgets/terms_and_conditions.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  expands: false,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.user),
                    labelText: TTexts.firstName,
                  ),
                ),
              ),
              const SizedBox(
                width: TSizes.spaceBtwInputFields,
              ),
              Expanded(
                child: TextFormField(
                  expands: false,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.user),
                    labelText: TTexts.lastName,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: TSizes.spaceBtwInputFields,
          ),
          TextFormField(
            decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.user_edit),
              labelText: TTexts.username,
            ),
          ),
          const SizedBox(
            height: TSizes.spaceBtwInputFields,
          ),
          TextFormField(
            decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct), labelText: TTexts.email),
          ),
          const SizedBox(
            height: TSizes.spaceBtwInputFields,
          ),
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.call), labelText: TTexts.phoneNo),
          ),
          const SizedBox(
            height: TSizes.spaceBtwInputFields,
          ),
          TextFormField(
            obscureText: true,
            decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.password_check),
                suffixIcon: Icon(Iconsax.eye_slash),
                labelText: TTexts.password),
          ),
          const SizedBox(
            height: TSizes.spaceBtwItems,
          ),
          const TermsAndConditions(),
          const SizedBox(
            height: TSizes.spaceBtwSections,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Get.to(()=> const VerifyEmailScreen());
              },
              child: const Text(TTexts.createAccount),
            ),
          ),
        ],
      ),
    );
  }
}
