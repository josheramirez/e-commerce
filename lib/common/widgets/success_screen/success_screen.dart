import 'package:e_commerce/common/style/spacing_styles.dart';
import 'package:e_commerce/utils/constants/texts.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import '../../../utils/constants/sizes.dart';

class SuccessScreen extends StatelessWidget {
  final String image, title, subtitle;
  final VoidCallback onPress;
  const SuccessScreen({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: SpacingStyle.paddingWithAppBarHeight * 2,
          child: Column(
            children: [
              /// Image
              Image(image: AssetImage(image),
                width: HelperFunctions.screenWidth() * 0.6,),
              const SizedBox(height: USizes.spaceBtwSections,),

              /// Title % Subtitle
              Text(title, style: Theme.of(context).textTheme.headlineMedium,textAlign: TextAlign.center,),
              const SizedBox(height: USizes.spaceBtwItems,),
              Text(subtitle, style: Theme.of(context).textTheme.labelMedium,textAlign: TextAlign.center,),
              const SizedBox(height: USizes.spaceBtwSections,),

              /// Buttons
              SizedBox(width: double.infinity,child: ElevatedButton(onPressed: onPress,
              child: const Text(UTexts.uContinue),),)
            ],
          ),
        ),
      ),
    );
  }
}