import 'package:e_commerce/common/widgets/shimmer/shimmer_effect.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class ListTitleShimmer extends StatelessWidget {
  const ListTitleShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            ShimmerEffect(width: 50,  height: 50, radius: 50),
            SizedBox(width: USizes.spaceBtwItems / 2),
            ShimmerEffect(width: 80, height: 12)
          ],
        )
      ],
    );
  }
}