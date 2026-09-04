import 'package:e_commerce/common/widgets/icons/circular_icons.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class ProductQuantityWithAddRemoveButton extends StatelessWidget {
  const ProductQuantityWithAddRemoveButton({
    super.key, required this.quantity, this.add, this.remove,
  });

  final int quantity;
  final VoidCallback? add, remove;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        
        // Remove Button
        UCircularIcon(
          icon: Iconsax.minus_copy,
          width: 32,
          height: 32,
          size: USizes.md,
          color: UColors.black,
          backgroundColor: HelperFunctions.isDarkMode(context) ? UColors.white : UColors.grey,
          onPressed: remove,
        ),
        SizedBox(width: USizes.spaceBtwItems),

        // Total Item Quantity
        Text(quantity.toString(), style: Theme.of(context).textTheme.titleSmall),
        SizedBox(width: USizes.spaceBtwItems),
        
        // Add Button
        UCircularIcon(
          icon: Iconsax.add_copy,
          width: 32,
          height: 32,
          size: USizes.md,
          color: UColors.white,
          backgroundColor: UColors.primary,
          onPressed: add,
        ),
      ],
    );
  }
}

