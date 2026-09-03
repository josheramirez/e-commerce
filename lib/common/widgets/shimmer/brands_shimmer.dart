import 'package:e_commerce/common/layout/grid_layout.dart';
import 'package:e_commerce/common/widgets/shimmer/shimmer_effect.dart';
import 'package:flutter/material.dart';

class BrandShimmer extends StatelessWidget {
  const BrandShimmer({super.key, this.itemCount = 4});

  final int itemCount;
  
  @override
  Widget build(BuildContext context) {
    return GridLayout(
      mainAxisExtent: 80,
      itemCount: itemCount, 
      itemBuilder: (_,__) => const ShimmerEffect(width: 300, height: 80)
    );
  }
}