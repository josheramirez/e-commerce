import 'package:e_commerce/common/widgets/commmo_shapes/containers/rounded_container.dart';
import 'package:e_commerce/common/widgets/commmo_shapes/containers/rounded_image.dart';
import 'package:e_commerce/common/widgets/icons/circular_icons.dart';
import 'package:e_commerce/common/widgets/products/favorite_icon/favorite_icon.dart';
import 'package:e_commerce/common/widgets/products/product_cards/brand_title_with_verifed_icon.dart';
import 'package:e_commerce/common/widgets/products/product_cards/product_title_text.dart';
import 'package:e_commerce/features/shop/controllers/product/product_controller.dart';
import 'package:e_commerce/features/shop/models/product_model.dart';
import 'package:e_commerce/features/shop/screens/product_details/widgets/product_price_text.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/enums.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class ProductCardHorizontal extends StatelessWidget {
  const ProductCardHorizontal({super.key, required this.product});

  final ProductModel product;
  
  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    final controller = ProductController.intance;
    final salePercentage = controller.calculateSalePercentage(product.price, product.salePrice);

    return Container(
      width: 310,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(USizes.productImageRadius),
        color: UColors.yellow,
      ),
      child: Row(
        children: [
          URoundedContainer(
            height: 120,
            padding: EdgeInsets.all(USizes.sm),
            backgroundColor: dark ? UColors.dark : UColors.light,
            child: Stack(
              children: [

                // Thumbnail
                SizedBox(
                  height: 120, 
                  width: 120,
                  child: RoundedImage(imageUrl: product.thumbnail,applyImageRadius: true),
                ),

                // Sale Tag
                if(salePercentage != null)
                Positioned(
                  top: 12,
                  child: URoundedContainer(
                    radius: USizes.sm,
                    backgroundColor: UColors.yellow.withValues(alpha: 0.8),
                    padding: EdgeInsets.symmetric(horizontal: USizes.sm,vertical: USizes.xs),
                    child: Text('$salePercentage%', style: Theme.of(context).textTheme.labelLarge!.apply(color: UColors.black)),
                  ),
                ),

                // Favorite Icon
                Positioned(
                  top: 0,
                  right: 0,
                  child: FavoriteIcon(productId: product.id),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                  // Name & Brand
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                     
                      // Name
                      ProductTitleText(title: product.title,smallSize: true),
                      SizedBox(height: USizes.spaceBtwItems / 2),
                      // Brand
                      BrandTitleWithVerifedIcon(title: product.brand!.name),
                      SizedBox(height: USizes.spaceBtwItems / 3),

                    ],
                  ),

                  const Spacer(),

                  // Price & Button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      // [RIGHT SIDE] Price 
                      Flexible(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: USizes.sm),
                              child: Text(
                                controller.getProductPrice(product),
                                style: Theme.of(context).textTheme.headlineMedium,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
          
                      // [LEFT SIDE] Add to Cart Button Side
                      Container(
                        width: USizes.iconLg * 1.1,
                        height: USizes.iconLg * 1.1,
                        decoration: BoxDecoration(
                          color: UColors.primary,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(USizes.cardRadiusMd),
                            bottomRight: Radius.circular(
                              USizes.productImageRadius,
                            ),
                          ),
                        ),
                        child: Icon(Iconsax.add_copy, color: UColors.white),
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
