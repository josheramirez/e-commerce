import 'package:e_commerce/common/style/shadow.dart';
import 'package:e_commerce/common/widgets/commmo_shapes/containers/primary_header_container.dart';
import 'package:e_commerce/common/widgets/commmo_shapes/containers/rounded_container.dart';
import 'package:e_commerce/common/widgets/icons/circular_icons.dart';
import 'package:e_commerce/common/widgets/products/product_cards/brand_title_text.dart';
import 'package:e_commerce/common/widgets/products/product_cards/product_tiitle_text.dart';
import 'package:e_commerce/features/shop/screens/home/home.dart';
import 'package:e_commerce/features/shop/screens/product_details/product_detail.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/enums.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class ProductCardVertical extends StatelessWidget {
  const ProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => ProductDetailScreen()),
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(0),
        decoration: 
          BoxDecoration(
            boxShadow: UShadow.verticalProductShadow,
            borderRadius: BorderRadius.circular(USizes.productImageRadius),
            color: UColors.white
          ),

        child: Column(
          children: [
      
            // Image Box
            URoundedContainer(
              height: 180,
              padding: const EdgeInsets.all(USizes.sm),
              backgroundColor: UColors.light,
              child: Stack(
                children:[
                  // Thumbnail Image
                  RoundedImage(imageUrl: Images.productImage5, applyImageRadius: true),
      
                  // Sale Tag
                  Positioned(
                    top: 12,
                    child: URoundedContainer(
                      radius: USizes.sm,
                      backgroundColor: UColors.yellow.withValues(alpha: 0.9),
                      padding: const EdgeInsets.symmetric(horizontal: USizes.sm, vertical: USizes.xs),
                      child: Text('25%', style: Theme.of(context).textTheme.labelLarge!.apply(color: UColors.black)),
                    )
                  ),
      
                  // Favorite Icon
                  Positioned(
                    top: 0,
                    right: 0,
                    child: UCircularIcon(icon: Iconsax.heart, color: Colors.red,),
                  )
                ],
              ),
            ),
            SizedBox(height: USizes.spaceBtwItems/2),
            
            // Details
            Padding(
              padding: const EdgeInsets.only(left:USizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductTiitleText(title: "Blue Shoe Nike", smallSize: false),
                  SizedBox(height: USizes.spaceBtwItems/2,),
                  BrandTitleWithVerifiedIcon(title: "pokemon",),
      
                  // Price
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('\$80', style: Theme.of(context).textTheme.headlineMedium, maxLines: 1, overflow: TextOverflow.ellipsis),
                      Container(
                        width: USizes.iconLg*1.2,
                        height: USizes.iconLg*1.2,
                        decoration: BoxDecoration(
                          color: UColors.primary,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(USizes.cardRadiusMd),
                            bottomRight: Radius.circular(USizes.productImageRadius)
                          )
                        ),
                        child: Icon(Iconsax.add_copy, color:  UColors.white),
                      )
                    ],
                  )
                  
                ],
              ),
            )
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

        BrandTitleText(title: "pokemon"),
        Icon(Iconsax.verify, color: UColors.primary, size: USizes.iconXs)
      ],
    );
  }
}

