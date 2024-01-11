import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:t_store/features/authentication/screens/signup/signup.dart';
import 'package:t_store/navigation_bar.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Iconsax.direct_right,
                  ),
                  labelText: TTexts.email),
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputFields,
            ),
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(
                prefixIcon: Icon(
                  Iconsax.password_check,
                ),
                labelText: TTexts.password,
                suffixIcon: Icon(Iconsax.eye_slash),
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputFields / 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(value: true, onChanged: (value) {}),
                    const Text(TTexts.rememberMe),
                  ],
                ),
                TextButton(
                    onPressed: () {
                      Get.to(() => const ForgetPasswordScreen());
                    },
                    child: const Text(TTexts.forgetPassword)),
              ],
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputFields,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Get.to(() => const NavigationMenu());
                },
                child: const Text(TTexts.signIn),
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
                  //Navigator.push(context, MaterialPageRoute(builder: (context)=> const SignUpScreen()));
                  Get.to(() => const SignUpScreen());
                },
                child: const Text(TTexts.createAccount),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
