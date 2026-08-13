import 'package:e_commerce/common/widgets/commmo_shapes/containers/rounded_container.dart';
import 'package:e_commerce/common/widgets/commmo_shapes/containers/rounded_image.dart';
import 'package:e_commerce/common/widgets/icons/circular_icons.dart';
import 'package:e_commerce/common/widgets/products/product_cards/brand_title_with_verifed_icon.dart';
import 'package:e_commerce/common/widgets/products/product_cards/product_tiitle_text.dart';
import 'package:e_commerce/features/shop/screens/product_details/widgets/product_price_text.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class ProductCardHorizontal extends StatelessWidget {
  const ProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);

    return Container(
      width: 310,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(USizes.productImageRadius),
        color: UColors.yellow,
      ),
      child: Row(
        children: [
          // Thumbnail
          URoundedContainer(
            height: 120,
            padding: EdgeInsets.all(USizes.sm),
            backgroundColor: dark ? UColors.dark : UColors.light,
            child: Stack(
              children: [
                SizedBox(
                  height: 120,
                  width: 120,
                  child: RoundedImage(
                    imageUrl: Images.productImage1,
                    applyImageRadius: true,
                  ),
                ),
                Positioned(
                  top: 12,
                  child: URoundedContainer(
                    radius: USizes.sm,
                    backgroundColor: UColors.yellow.withValues(alpha: 0.9),
                    padding: EdgeInsets.symmetric(
                      horizontal: USizes.sm,
                      vertical: USizes.xs,
                    ),
                    child: Text(
                      '25%',
                      style: Theme.of(
                        context,
                      ).textTheme.labelLarge!.apply(color: UColors.black),
                    ),
                  ),
                ),
                // Favorite Icon
                Positioned(
                  top: 0,
                  right: 0,
                  child: UCircularIcon(icon: Iconsax.heart, color: Colors.red),
                ),
              ],
            ),
          ),

          // Details
          SizedBox(
            width: 172,
            child: Padding(
              padding: EdgeInsets.only(top: USizes.sm, left: USizes.sm),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProductTiitleText(
                        title: 'Green Nike Half Sleeve',
                        smallSize: true,
                      ),
                      SizedBox(height: USizes.spaceBtwItems / 2),
                      BrandTitleWithVerifedIcon(title: 'Nirke'),
                      SizedBox(height: USizes.spaceBtwItems / 3),
                    ],
                  ),

                  const Spacer(),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.only(left: USizes.sm),
                          child: ProductPriceText(price: '256.45'),
                        ),
                      ),

                      // Add to cart
                      Container(
                        decoration: BoxDecoration(
                          color: UColors.dark,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(USizes.cardRadiusMd),
                            bottomRight: Radius.circular(
                              USizes.productImageRadius,
                            ),
                          ),
                        ),
                        child: SizedBox(
                          width: USizes.iconLg * 1.2,
                          height: USizes.iconLg * 1.2,
                          child: Center(
                            child: Icon(Iconsax.add_copy, color: UColors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
