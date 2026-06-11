import 'package:e_commerce/common/widgets/icons/circular_icons.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class ProductQuantityWithAddRemoveButton extends StatelessWidget {
  const ProductQuantityWithAddRemoveButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        UCircularIcon(
          icon: Iconsax.minus_copy,
          width: 32,
          height: 32,
          size: USizes.md,
          color: UColors.black,
          backgroundColor: UColors.light,
        ),
        SizedBox(width: USizes.spaceBtwItems),
        Text('2', style: Theme.of(context).textTheme.titleSmall),
        SizedBox(width: USizes.spaceBtwItems),
        
        UCircularIcon(
          icon: Iconsax.add_copy,
          width: 32,
          height: 32,
          size: USizes.md,
          color: UColors.white,
          backgroundColor: UColors.primary,
        ),
      ],
    );
  }
}

