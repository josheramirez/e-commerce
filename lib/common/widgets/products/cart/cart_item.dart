import 'package:e_commerce/common/widgets/commmo_shapes/containers/rounded_image.dart';
import 'package:e_commerce/common/widgets/products/product_cards/brand_title_with_verifed_icon.dart';
import 'package:e_commerce/features/shop/models/cart_item_model.dart';
import 'package:e_commerce/features/shop/screens/product_details/widgets/product_title_text.dart';
import 'package:e_commerce/global_config.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.cartItem});

  final CartItemModel cartItem;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Image
        RoundedImage(
          imageUrl: cartItem.image ?? '',
          width: 80,
          height: 80,
          padding: EdgeInsets.all(2),
          backgroundColor: UColors.light,
          isNetworkImage: GlobalConfig.instance.isNetworkImage,
        ),

        // Title,  Price & Size
        Flexible(
          child: Container(
            color: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Brand
                  BrandTitleWithVerifedIcon(title: cartItem.brandName ?? ''),

                  // Name
                  Flexible(
                    child: ProductTitleText(title: cartItem.title, maxLines: 1),
                  ),

                  // Attributes
                  Text.rich(
                    TextSpan(
                      children: (cartItem.selectedVariation ?? {}).entries
                          .map(
                            (e) => TextSpan(
                              children: [
                                TextSpan(
                                  text: e.key,
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                                TextSpan(
                                  text: ' ${e.value}',
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ],
                            ),
                          )
                          .toList(),
                    ),
                    maxLines: 1, // Set the limit of lines before clipping
                    overflow: TextOverflow.ellipsis, // Triggers the '...'
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
