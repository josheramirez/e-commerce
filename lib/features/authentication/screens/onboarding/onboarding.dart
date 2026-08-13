import 'package:e_commerce/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/constants/texts.dart';
import 'package:e_commerce/utils/helpers/device_helpers.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());

    return Scaffold(
      body: Stack(
        children: [
          // Horizontal Scrollable Pages
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,

            children: [
              OnBoardingPage(
                image: Images.onboardingAnimationGif,
                title: UTexts.onBoardingTitle1,
                subTitle: UTexts.onBoardingSubTitle1,
              ),
              OnBoardingPage(
                image: Images.onboardingAnimationGif,
                title: UTexts.onBoardingTitle2,
                subTitle: UTexts.onBoardingSubTitle2,
              ),
              OnBoardingPage(
                image: Images.onboardingAnimationGif,
                title: UTexts.onBoardingTitle3,
                subTitle: UTexts.onBoardingSubTitle3,
              ),
            ],
          ),

          // Skip Buttom
          Positioned(
            top: UDeviceHelper.getAppBarHeight(),
            right: USizes.defaultSpace,
            child: TextButton(
              onPressed: () => OnBoardingController.instance.skipPage(),
              child: Text('Skip'),
            ),
          ),

          // Dot Navigation SmoothPageIndicator
          OnboardingDotNavigation(),

          // Circular Button
          OnboardingNextButton(),
        ],
      ),
    );
  }
}

class OnboardingNextButton extends StatelessWidget {
  const OnboardingNextButton({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return Positioned(
      right: USizes.defaultSpace,

      bottom: UDeviceHelper.getBottomNavigationBarHeight() + 20,
      child: ElevatedButton(
        onPressed: OnBoardingController.instance.nextPage,
        style: ElevatedButton.styleFrom(
          shape: CircleBorder(),
          backgroundColor: dark ? UColors.primary : Colors.black,
        ),
        child: Icon(Iconsax.arrow_right_3_copy),
      ),
    );
  }
}

class OnboardingDotNavigation extends StatelessWidget {
  const OnboardingDotNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;
    final dark = HelperFunctions.isDarkMode(context);
    return Positioned(
      bottom: UDeviceHelper.getBottomNavigationBarHeight() + 25,
      left: USizes.defaultSpace,
      child: SmoothPageIndicator(
        controller: controller.pageController,
        onDotClicked: controller.dotNavigationClick,
        count: 3,
        effect: ExpandingDotsEffect(
          activeDotColor: dark ? UColors.light : UColors.dark,
          dotHeight: 6,
        ),
      ),
    );
  }
}

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
  });

  final String image, title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(USizes.defaultSpace),
      child: Column(
        children: [
          Image(
            image: AssetImage(image),
            height: HelperFunctions.screenHeight() * 0.7,
            width: HelperFunctions.screenWidth() * 0.7,
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: USizes.spaceBtwItems),
          Text(
            subTitle,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
