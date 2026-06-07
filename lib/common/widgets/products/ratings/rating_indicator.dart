import 'package:e_commerce/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class URatingBarIndicator extends StatelessWidget {
  const URatingBarIndicator({
    super.key, required this.rating,
  });

  final double rating;

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      itemBuilder: (_,  __) => Icon(Iconsax.star, color: UColors.primary),
      rating: rating,
      itemSize: 20,
      unratedColor: UColors.grey,
      );
  }
}