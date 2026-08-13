import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

// A widget for displaying an animated loading indicator with optional text and action button
class AnimationLoaderWidget extends StatelessWidget {

  // Default contructor fot the AnimationLoaderWidget

  const AnimationLoaderWidget({
    super.key,
    required this.text,
    required this.animation,
    this.showAction = false,
    this.actionText,
    this.onActionPressed,
  });

  final String text;
  final String animation;
  final bool showAction;
  final String? actionText;
  final VoidCallback? onActionPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(animation, width: MediaQuery.of(context).size.width * 0.8),
          SizedBox(height: USizes.defaultSpace),
          Text(text, style: Theme.of(context).textTheme.bodyMedium, textAlign: TextAlign.center),
          SizedBox(height: USizes.defaultSpace),
          
          showAction
            ? SizedBox(
              width: 250, 
              child: OutlinedButton(
                  onPressed: onActionPressed,
                  style: OutlinedButton.styleFrom(backgroundColor: UColors.dark),
                  child: Text(
                    actionText!,
                    style: Theme.of(context).textTheme.bodyMedium!.apply(color: UColors.light),
                  ),
                ),
              )
            : SizedBox(),
        ],
      ),
    );
  }
}
