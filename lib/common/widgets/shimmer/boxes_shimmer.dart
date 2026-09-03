import 'package:e_commerce/common/widgets/shimmer/shimmer_effect.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class BoxesShimmer extends StatelessWidget {
  const BoxesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            Expanded(child: ShimmerEffect(width: 150,  height: 110)),
            SizedBox(width: USizes.spaceBtwItems),
            Expanded(child: ShimmerEffect(width: 150,  height: 110)),
            SizedBox(width: USizes.spaceBtwItems),
            Expanded(child: ShimmerEffect(width: 150,  height: 110)),
          ],
        )
      ],
    );
  }
}