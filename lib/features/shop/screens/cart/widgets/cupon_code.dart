import 'package:e_commerce/common/widgets/commmo_shapes/containers/rounded_container.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class CuponCode extends StatelessWidget {
  const CuponCode({super.key,this.dark = false});

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return URoundedContainer(
      showBorder: true,
      backgroundColor: dark ? UColors.dark : UColors.white,
      padding: EdgeInsets.only(top: USizes.sm, bottom: USizes.sm, right: USizes.sm, left: USizes.md),
      child: Row(
        children: [
          // TextField
          Flexible(
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'Have a promo code? Enter here',
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none
              ),
            ),
          ),
    
          // Button
          SizedBox(
            width: 90,
            
            child: ElevatedButton(
              onPressed: (){}, 
              style: ElevatedButton.styleFrom(
                foregroundColor: dark? UColors.white.withValues(alpha: 0.5) : UColors.dark,
                backgroundColor: UColors.lightGrey.withValues(alpha: 0.5),
                side: BorderSide(color: Colors.grey.withValues(alpha: 0.1)),
                 minimumSize: Size(150, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0), // Adjust the radius value here
                ),
                                    
              ),
              child: Text('Apply')
            )
          )
        ],
      ),
    );
  }
}