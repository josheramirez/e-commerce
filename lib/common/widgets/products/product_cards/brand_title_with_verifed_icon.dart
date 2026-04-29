import 'package:e_commerce/common/widgets/products/product_cards/brand_title_text.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/enums.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class BrandTitleWithVerifedIcon extends StatelessWidget {
  const BrandTitleWithVerifedIcon({
    super.key,
    required this.title,
    this.maxLines = 1,
    this.textColor,
    this.iconColor = UColors.primary,
    this.textAlign = TextAlign.center,
    this.brandTextSize = TextSizes.small,
  });

  final String title;
  final int maxLines;
  final Color? textColor, iconColor;
  final TextAlign? textAlign;
  final TextSizes brandTextSize;
  

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [

        BrandTitleText(title: "pokemon"),
        SizedBox(width: USizes.spaceBtwItems / 2,),
        Icon(Iconsax.verify, color: UColors.primary, size: USizes.iconXs),

      ],
    );
  }
}