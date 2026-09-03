import 'dart:convert';

import 'package:e_commerce/common/style/shadow.dart';
import 'package:e_commerce/common/widgets/commmo_shapes/containers/rounded_container.dart';
import 'package:e_commerce/common/widgets/commmo_shapes/containers/rounded_image.dart';
import 'package:e_commerce/common/widgets/icons/circular_icons.dart';
import 'package:e_commerce/common/widgets/products/favorite_icon/favorite_icon.dart';
import 'package:e_commerce/common/widgets/products/product_cards/brand_title_text.dart';
import 'package:e_commerce/common/widgets/products/product_cards/product_title_text.dart';
import 'package:e_commerce/features/shop/controllers/product/product_controller.dart';
import 'package:e_commerce/features/shop/models/product_model.dart';
import 'package:e_commerce/features/shop/screens/product_details/product_detail.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/enums.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class ProductCardVertical extends StatelessWidget {
  const ProductCardVertical({super.key, required this.product});

  final ProductModel product;
  
  @override
  Widget build(BuildContext context) {

    final controller = ProductController.intance;
    final salePercentage = controller.calculateSalePercentage(product.price, product.salePrice);
    final dark = HelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: () => Get.to(() => ProductDetailScreen(product: product)),
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(0),
        decoration: BoxDecoration(
          boxShadow: UShadow.verticalProductShadow,
          borderRadius: BorderRadius.circular(USizes.productImageRadius),
          color: UColors.white,
        ),

        child: Column(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Column(
                children: [
                  // Image Box
                  URoundedContainer(
                    height: 180,
                    padding: const EdgeInsets.all(USizes.sm),
                    backgroundColor: UColors.lightGrey,
                    child: Stack(
                      children: [
                        
                        // Thumbnail Image
                        RoundedImage(imageUrl: product.thumbnail, applyImageRadius: true, isNetworkImage: true),
                        
                        // Sale Tag
                        if(salePercentage != '0' && salePercentage != null)
                        Positioned(
                          top: 12,
                          child: URoundedContainer(
                            radius: USizes.sm,
                            backgroundColor: UColors.yellow.withValues(alpha: 0.9),
                            padding: const EdgeInsets.symmetric(
                              horizontal: USizes.sm,
                              vertical: USizes.xs,
                            ),
                            child: Text('$salePercentage%', style: Theme.of(context).textTheme.labelLarge!.apply(color: UColors.black)),
                          ),
                        ),
                        
                        // Favorite Icon
                        Positioned(top: 0, right: 0, child: FavoriteIcon(productId: product.id),
                        ),
                        
                      ],
                    ),
                  ),
                  //
                  
                  
                  Padding(
                    padding: const EdgeInsets.only(left: USizes.sm, right: USizes.sm),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Name
                        ProductTitleText(title: product.title, smallSize: false),
                        // SizedBox(height: USizes.spaceBtwItems / 4),
                        // Brand
                        BrandTitleWithVerifiedIcon(title: product.brand!.name),
                      ]
                    )
                  )
                ],
              )
            ),

            // Details
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child:
                     Column(
                      children: [
                        // Original Price with lineThrough becouse have some sale discount
                        if(product.productType == ProductType.single.toString() && product.salePrice > 0)
                          Padding(
                            padding: const EdgeInsets.only(left: USizes.sm),
                            child: Text(product.price.toString(), style: Theme.of(context).textTheme.labelMedium!.apply(decoration: TextDecoration.lineThrough)),
                          ),
                      ],
                     )
                ),
    
                          // Price & Button
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // [RIGHT SIDE]
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
          ],
        ),
      ),
    );
  }
}

class BrandTitleWithVerifiedIcon extends StatelessWidget {
  const BrandTitleWithVerifiedIcon({
    super.key,
    required this.title,
    this.maxLines = 1,
    this.textColor,
    this.iconColor = UColors.primary,
    this.textAlign = TextAlign.center,
    this.brandTextSize = TextSizes.small,
  });

  final String title;
  final int maxLines;
  final Color? textColor, iconColor;
  final TextAlign? textAlign;
  final TextSizes brandTextSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        BrandTitleText(title: title),
        Icon(Iconsax.verify, color: UColors.primary, size: USizes.iconXs),
      ],
    );
  }
}
