import 'dart:convert';

import 'package:e_commerce/common/style/shadow.dart';
import 'package:e_commerce/common/widgets/commmo_shapes/containers/rounded_container.dart';
import 'package:e_commerce/common/widgets/commmo_shapes/containers/rounded_image.dart';
import 'package:e_commerce/common/widgets/icons/circular_icons.dart';
import 'package:e_commerce/common/widgets/products/favorite_icon/favorite_icon.dart';
import 'package:e_commerce/common/widgets/products/product_cards/brand_title_text.dart';
import 'package:e_commerce/common/widgets/products/product_cards/product_title_text.dart';
import 'package:e_commerce/features/shop/controllers/cart_controller.dart';
import 'package:e_commerce/features/shop/controllers/product/product_controller.dart';
import 'package:e_commerce/features/shop/models/product_model.dart';
import 'package:e_commerce/features/shop/screens/product_details/product_detail.dart';
import 'package:e_commerce/global_config.dart';
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
    final cartController = CartController.instance;

    final salePercentage = controller.calculateSalePercentage(
      product.price,
      product.salePrice,
    );
    final dark = HelperFunctions.isDarkMode(context);

    String toThousandString(String words) => words.replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]}.',
    );


    return GestureDetector(
      onTap: () => Get.to(() => ProductDetailScreen(product: product)),
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(0),
        decoration: BoxDecoration(
          // boxShadow: UShadow.verticalProductShadow,
          borderRadius: BorderRadius.circular(USizes.productImageRadius),
          color: UColors.white,
          border: Border.all(
            color: UColors.darkGrey.withValues(alpha: 0.1), // Border color
            width: 1.0,          // Border width
          ),
        ),

        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                // [IMAGE]
                URoundedContainer(
                  // height: 180,
                  padding: const EdgeInsets.all(0),
                  backgroundColor: UColors.white,
                  child: Stack(
                    children: [

                      // [THUMBNAIL]
                      RoundedImage(
                        height: 170,
                        imageUrl: product.thumbnail,
                        applyImageRadius: true,
                        isNetworkImage: GlobalConfig.instance.isNetworkImage,
                      ),

                      // [SALE TAG]
                      if (salePercentage != '0' && salePercentage != null)
                        Positioned(
                          top: 12,
                          left: 12,
                          child: URoundedContainer(
                            radius: USizes.sm,
                            backgroundColor: UColors.yellow.withValues(
                              alpha: 0.9,
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: USizes.sm,
                              vertical: USizes.xs,
                            ),
                            child: Text(
                              '$salePercentage%',
                              style: Theme.of(context).textTheme.labelLarge!
                                  .apply(color: UColors.black),
                            ),
                          ),
                        ),

                      // [FAVORITE ICON]
                      Positioned(
                        top: 0,
                        right: 0,
                        child: FavoriteIcon(productId: product.id),
                      ),
                    ],
                  ),
                ),
                
              ],
            ),
            SizedBox(height:10),
            
            // [TITLE]
            Container(
              // color: Colors.amber,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: USizes.sm,
                  right: USizes.sm,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // Name
                    ProductTitleText(title: product.title, smallSize: false,maxLines: 2,),
                    // SizedBox(height: USizes.spaceBtwItems / 4),
                    // Brand
                    BrandTitleWithVerifiedIcon(title: product.brand!.name, brandImage: product.brand!.image),
                  ],
                ),
              ),
            ),

            Spacer(),
            // [DETAILS]
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Discount
                Container(
                  // color: Colors.amber,
                  child: Column(
                    children: [
                      // Original Price with lineThrough becouse have some sale discount
                      if (product.productType == ProductType.single.toString() &&
                          product.salePrice > 0)
                        Padding(
                          padding: const EdgeInsets.only(left: USizes.sm),
                          child: Text(
                            (toThousandString(product.price.toString())),
                            style: Theme.of(context).textTheme.labelMedium!.apply(
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),

                // [PRICE AND BUTTON]
                Container(
                  // color: Colors.red,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // [RIGHT SIDE] PRICE
                      Flexible(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: USizes.sm),
                              child: Text(
                                '\$ ${(toThousandString(controller.getProductPrice(product)))}',
                                // controller.getProductPrice(product),
                                // style: Theme.of(context).textTheme.headlineMedium,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
    height: 1.0, // Force line height to tightly match font size
    fontSize: 20,
    fontWeight: FontWeight.bold
  ),
                              ),
                            ),
                          ],
                        ),
                      ),
                  
                      // [LEFT SIDE] ADD BUTTON
                      GestureDetector(
                        onTap: () {
                          if (product.productType ==
                              ProductType.single.toString()) {
                            final cartItem = cartController.convertToCartItem(
                              product,
                              1,
                            );
                            cartController.addOneToCart(cartItem);
                          } else {
                            Get.to(() => ProductDetailScreen(product: product));
                          }
                        },
                        child: Obx(() {
                          final productQuantityInCart = cartController
                              .getProductQuantityInCart(product.id);
                  
                          return Container(
                            width: USizes.iconLg * 1.0,
                            height: USizes.iconLg * 1.0,
                            decoration: BoxDecoration(
                              color: productQuantityInCart > 0
                                  ? UColors.primary
                                  : UColors.dark,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(USizes.cardRadiusMd),
                                bottomRight: Radius.circular(
                                  USizes.productImageRadius,
                                ),
                              ),
                            ),
                            child: Center(
                              child: productQuantityInCart > 0
                                  ? Text(
                                      productQuantityInCart.toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .apply(color: UColors.white),
                                    )
                                  : const Icon(
                                      Iconsax.add_copy,
                                      color: UColors.white,
                                    ),
                            ),
                          );
                        }),
                      ),
                    ],
                  ),
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
    this.brandImage = '',
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
  final String brandImage;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if(brandImage != '')
        SizedBox(
          width: 15,
          height: 15,
          child: Image(image: AssetImage(brandImage),),
        ),
        SizedBox(width: 5,),
        BrandTitleText(title: title),
        Icon(Iconsax.verify, color: UColors.primary, size: USizes.iconXs),
      ],
    );
  }
}
