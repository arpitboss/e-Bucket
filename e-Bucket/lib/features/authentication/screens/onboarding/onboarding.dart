import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:t_store/features/authentication/screens/onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:t_store/features/authentication/screens/onboarding/widgets/onboarding_next_button.dart';
import 'package:t_store/features/authentication/screens/onboarding/widgets/onboarding_page.dart';
import 'package:t_store/features/authentication/screens/onboarding/widgets/onboarding_skip.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/text_strings.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingPage(
                title: TTexts.onBoardingTitle1,
                image: TImages.onBoardingImage1,
                subtitle: TTexts.onBoardingSubTitle1,
              ),
              OnBoardingPage(
                title: TTexts.onBoardingTitle2,
                image: TImages.onBoardingImage2,
                subtitle: TTexts.onBoardingSubTitle2,
              ),
              OnBoardingPage(
                title: TTexts.onBoardingTitle3,
                image: TImages.onBoardingImage3,
                subtitle: TTexts.onBoardingSubTitle3,
              ),
            ],
          ),
          const OnBoardingSkip(),
          const OnBoardingNavigation(),
          const OnBoardingNextButton(),
        ],
      ),
    );
  }
}
