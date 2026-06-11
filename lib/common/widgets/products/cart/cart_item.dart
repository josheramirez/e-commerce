import 'package:e_commerce/common/widgets/commmo_shapes/containers/rounded_image.dart';
import 'package:e_commerce/common/widgets/products/product_cards/brand_title_with_verifed_icon.dart';
import 'package:e_commerce/features/shop/screens/product_details/widgets/product_title_text.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Image
        RoundedImage(
          imageUrl: Images.productImage1,
          width: 60,
          height: 60,
          padding: EdgeInsets.all(USizes.sm),
          backgroundColor: UColors.light,
        ),
        
        // Title,  Price & Size
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BrandTitleWithVerifedIcon(title: 'Nike'),
            ProductTitleText(title: 'Black Sports Shoes', maxLines: 1),
            // Attributes
            Text.rich(
              TextSpan(children: [
                TextSpan(text: 'Color ', style: Theme.of(context).textTheme.bodySmall),
                TextSpan(text: 'Green ', style: Theme.of(context).textTheme.bodyLarge),
                TextSpan(text: 'Size ', style: Theme.of(context).textTheme.bodySmall),
                TextSpan(text: 'Uk 38 ', style: Theme.of(context).textTheme.bodyLarge),
              ])
            )
          ],
        )
      ],
    );
  }
}