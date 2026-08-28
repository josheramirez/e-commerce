import 'package:e_commerce/common/layout/grid_layout.dart';
import 'package:e_commerce/common/widgets/shimmer/shimmer_effect.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class VerticalProductShimmer extends StatelessWidget {
  const VerticalProductShimmer({super.key, this.itemCount = 4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return GridLayout(
      itemCount: itemCount, 
      itemBuilder: (_, __) => SizedBox(
        width: 180,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            ShimmerEffect(width: 180, height: 180),
            SizedBox(height: USizes.spaceBtwItems),

            // Text
            ShimmerEffect(width: 160, height: 15),
            SizedBox(height: USizes.spaceBtwItems/2),
            ShimmerEffect(width: 110, height: 15),
          ],
        ),
      )
    
    );
  }
}