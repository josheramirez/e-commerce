import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/device_helpers.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class SeachContainer extends StatelessWidget {
  const SeachContainer({
    super.key, 
    required this.text, 
    this.icon = Iconsax.search_normal_1_copy, 
    this.showBackground=true, 
    this.showBorder=true,
    this.onTap, this.padding = const EdgeInsets.symmetric(horizontal: USizes.defaultSpace),
  });

  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry padding;
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector( 
      onTap: onTap,
      child: Padding(
        padding: padding,
        child: Container(
          width: UDeviceHelper.getScreenWidth(context),
          padding: const EdgeInsets.all(USizes.md),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(USizes.cardRadiusLg),
            border: showBorder? Border.all(color: UColors.grey) : null
          ),
          child: Row(
            children: [
              Icon(icon, color: UColors.darkerGrey),
              const SizedBox(width: USizes.spaceBtwItems),
              Text(text, style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
        ),
      ),
    );
  }
}
