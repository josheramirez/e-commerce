import 'package:e_commerce/common/images/circular_image.dart';
import 'package:e_commerce/common/widgets/appBar/appbar.dart';
import 'package:e_commerce/common/widgets/chips/choice_chip.dart';
import 'package:e_commerce/common/widgets/commmo_shapes/containers/rounded_container.dart';
import 'package:e_commerce/common/widgets/commmo_shapes/containers/rounded_image.dart';
import 'package:e_commerce/common/widgets/icons/circular_icons.dart';
import 'package:e_commerce/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:e_commerce/common/widgets/products/product_cards/product_tiitle_text.dart';
import 'package:e_commerce/features/shop/screens/home/home.dart';
import 'package:e_commerce/features/shop/screens/product_details/widgets/curved_edge_widget.dart';
import 'package:e_commerce/features/shop/screens/product_details/widgets/product_detail_image_slider.dart';
import 'package:e_commerce/features/shop/screens/product_details/widgets/product_price_text.dart';
import 'package:e_commerce/features/shop/screens/product_details/widgets/product_title_text.dart';
import 'package:e_commerce/features/shop/screens/product_details/widgets/rating_and_share.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/enums.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';


class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.red ,
      body: SingleChildScrollView(
        child: Column(
          children: [

            // Product Image Slider
            ProductImageSlider(),
            
            // Product Details
            Padding(
              padding: const EdgeInsets.only(right: USizes.defaultSpace, left:  USizes.defaultSpace, bottom: USizes.defaultSpace),
              child: Column(
                children: [
                  // Ratting and Share Button
                  RatingAndShare(),

                  // Product Meta Data
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Row(
                        children: [
                          // Sale Tag
                          URoundedContainer(
                            radius: USizes.sm,
                            backgroundColor: UColors.textSecondary.withAlpha(100),
                            padding: EdgeInsets.symmetric(horizontal: USizes.sm, vertical: USizes.xs),
                            child: Text('25%', style: Theme.of(context).textTheme.labelLarge!.apply(color: UColors.black)),
                          ),
                          const SizedBox(width: USizes.spaceBtwItems),
                          
                          // Price
                          Text('\$250',style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough)),
                          const SizedBox(width: USizes.spaceBtwItems),
                          ProductPriceText(price: '175' , isLarge: true,),
                        ],
                      ),
                     
                    //  Title
                     const SizedBox(height: USizes.spaceBtwItems / 1.5),
                     const ProductTiitleText(title: "Green Nike Basketball"),

                    // Stock Status
                    Row(
                      children: [
                          const ProductTiitleText(title: "Status"),
                          const SizedBox(width: USizes.spaceBtwItems),
                          Text('In Stock', style: Theme.of(context).textTheme.titleMedium),
                      ],
                    ),
                    const SizedBox(height: USizes.spaceBtwItems / 1.5),
                    
                    // Brand
                    Row(
                      children: [
                          CircularImage(
                            // backgroundColor: Colors.red,
                            image: Images.shoesIcon,
                            width: 32,
                            height: 32,
                            overlayColor:  UColors.white,  
                          ),
                          const BrandTitleWithVerifiedIcon(title: 'Nike', brandTextSize: TextSizes.medium),
                      ],
                    ),
                    ],
                  ),
                  
                  // Attributes
                  Column(
                    children: [
                      URoundedContainer(
                        padding: const EdgeInsets.all(USizes.md),
                        backgroundColor: UColors.grey,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                SectionHeading(title: 'Variation', showActionButton: false),
                                SizedBox(width: USizes.spaceBtwItems),

                                Flexible(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      
                                      // Price
                                      Row(
                                        children: [
                                          ProductTiitleText(title: 'Price : ', smallSize: true),
                                          SizedBox(width: USizes.spaceBtwItems /2 ),
                                          
                                          // Actual Price
                                          Text('\$25', style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough)),
                                          SizedBox(width: USizes.spaceBtwItems),
                                  
                                          // Sale Price
                                          Text('\$20'),
                                          
                                        ],
                                      ),
                                  
                                      // Stock
                                      Row(
                                        children: [
                                          const ProductTitleText(title: 'Stock : ', smallSize: true),
                                          Text('In Stock', style: Theme.of(context).textTheme.titleMedium),
                                        ],
                                      ),
                                  
                                      // Variation Description
                                      ProductTitleText(
                                        title: 'This is a descrription of the product and it can go up 4 lines. this is just a test Lorem, This is a descrription of the product and it can go up 4 lines. this is just a test Lorem Ipsum',
                                        smallSize: true,
                                        maxLines: 3,
                                      ),
                                  
                                    ],
                                  ),
                                )
                               
                              ],
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: USizes.spaceBtwItems),

                      // Attributes
                      Column(
                        children: [
                          SectionHeading(title: 'Colors'),
                          SizedBox(height: USizes.spaceBtwItems/2),
                          UChoiceChip(text: 'Green', selected: true)
                        ],
                      )
                    ],
                  )
                  // Checkout Button
                  // Description
                  // Reviews
                ],
              ),
            ),


          ],
        ),
      ),
    );
  }
}

