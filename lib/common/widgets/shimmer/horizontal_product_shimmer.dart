import 'package:e_commerce/common/widgets/shimmer/shimmer_effect.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class HorizontalProductShimmer extends StatelessWidget {
  const HorizontalProductShimmer({super.key, this.itemCount = 4});

  final int itemCount;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: USizes.spaceBtwSections),
      height: 120,
      child: ListView.separated(
        itemCount: itemCount,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => const SizedBox(width: USizes.spaceBtwItems), 
        itemBuilder: (_, index) => const Row(
          mainAxisSize: MainAxisSize.min,
          children: [

            // Image
            ShimmerEffect(width: 120, height: 120),
            SizedBox(width: USizes.spaceBtwItems),

            // Text
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: USizes.spaceBtwItems / 2),
                ShimmerEffect(width: 160, height: 15),
                SizedBox(height: USizes.spaceBtwItems / 2),
                ShimmerEffect(width: 110, height: 15),
                SizedBox(height: USizes.spaceBtwItems / 2),
                ShimmerEffect(width: 80, height: 15),
                Spacer(),
              ],
            )
          ],
        ),
      ),
    );
  }
}