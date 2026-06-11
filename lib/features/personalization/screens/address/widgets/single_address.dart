import 'package:e_commerce/common/widgets/commmo_shapes/containers/rounded_container.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class SingleAddress extends StatelessWidget {
  const SingleAddress({super.key, required this.selectedAddress});

  final bool selectedAddress;
  @override
  Widget build(BuildContext context) {
    return URoundedContainer(
      padding: EdgeInsets.all(USizes.md),
      width: double.infinity,
      showBorder: true,
      backgroundColor: selectedAddress ? Colors.blue.withValues(alpha: 0.5) : Colors.transparent,
      borderColor: selectedAddress ? Colors.transparent 
      // : dark
        // ? UColors.darkGrey
        : UColors.grey,
      margin: EdgeInsets.only(bottom: USizes.spaceBtwItems),
      child: Stack(
        children: [
          Positioned(
            right: 5,
            top: 0,
            child: Icon(
              selectedAddress ? Iconsax.tick_circle_copy : null,
              color: 
              // selectedAddress ?r
                // ? dark
                  // ? UColors.light
                  // : UColors.dark
                // :
                null,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Jhon Doe',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(height: USizes.sm/2),
              Text('+12343332112', maxLines: 1, overflow: TextOverflow.ellipsis),
              SizedBox(height: USizes.sm/2),
              Text('1231231 Avenida siempre viva, Region Atacama, Chilem', softWrap: true,)

            ],
          )
        ],
      ),
    );
  }
}