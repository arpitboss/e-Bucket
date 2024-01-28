import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/features/authentication/controllers/signup/signup_controller.dart';
import 'package:t_store/features/authentication/screens/signup/widgets/terms_and_conditions.dart';
import 'package:t_store/utils/validators/validation.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    return Form(
      key: controller.signupFormKey,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  validator: (value) =>
                      TValidator.validateEmptyText('First Name', value),
                  controller: controller.firstName,
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
                  validator: (value) =>
                      TValidator.validateEmptyText('Last Name', value),
                  controller: controller.lastName,
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
            validator: (value) =>
                TValidator.validateEmptyText('Username', value),
            controller: controller.username,
            decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.user_edit),
              labelText: TTexts.username,
            ),
          ),
          const SizedBox(
            height: TSizes.spaceBtwInputFields,
          ),
          TextFormField(
            validator: (value) => TValidator.validateEmail(value),
            controller: controller.email,
            decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct), labelText: TTexts.email),
          ),
          const SizedBox(
            height: TSizes.spaceBtwInputFields,
          ),
          TextFormField(
            validator: (value) => TValidator.validatePhoneNumber(value),
            controller: controller.phoneNumber,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.call), labelText: TTexts.phoneNo),
          ),
          const SizedBox(
            height: TSizes.spaceBtwInputFields,
          ),
          Obx(
            () => TextFormField(
              validator: (value) => TValidator.validatePassword(value),
              controller: controller.password,
              obscureText: controller.hideThePassword.value,
              decoration: InputDecoration(
                  prefixIcon: const Icon(Iconsax.password_check),
                  suffixIcon: IconButton(
                      onPressed: () => controller.hideThePassword.value =
                          !controller.hideThePassword.value,
                      icon: Icon(controller.hideThePassword.value
                          ? Iconsax.eye_slash
                          : Iconsax.eye)),
                  labelText: TTexts.password),
            ),
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
              onPressed: () => controller.signup(),
              child: const Text(TTexts.createAccount),
            ),
          ),
        ],
      ),
    );
  }
}
