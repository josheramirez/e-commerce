import 'package:e_commerce/common/widgets/icons/circular_icons.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class BottomAddToCard extends StatelessWidget {
  const BottomAddToCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal:  USizes.defaultSpace, vertical: USizes.defaultSpace / 2),
      decoration: BoxDecoration(
        color : UColors.grey,
        borderRadius: BorderRadius.only(
          topLeft:  Radius.circular(USizes.cardRadiusLg),
          topRight: Radius.circular(USizes.cardRadiusLg)
        )
      ),
      child: Row(
        mainAxisAlignment:  MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              UCircularIcon(
                icon: Iconsax.minus_copy,
                backgroundColor: UColors.darkGrey,
                width: 40,
                height: 40,
                color: Colors.white,
              ),
              
              SizedBox(width: USizes.spaceBtwItems),
              Text('2', style: Theme.of(context).textTheme.titleSmall),

              SizedBox(width: USizes.spaceBtwItems),
              UCircularIcon(
                icon: Iconsax.add_copy,
                backgroundColor: UColors.black,
                width: 40,
                height: 40,
                color: UColors.white,
              )
            ],
          ),

          ElevatedButton(
            onPressed: (){},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,     // Button background color
              foregroundColor: Colors.white,    // Text and icon color
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0), // Adjust radius here
              ),
              fixedSize: const Size.fromHeight(50),
            ), 
            child: Text('Add to Cart'),
          )
        ],
      ),
    );
  }
}