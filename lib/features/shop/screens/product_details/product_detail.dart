import 'package:e_commerce/common/images/circular_image.dart';
import 'package:e_commerce/common/widgets/appBar/appbar.dart';
import 'package:e_commerce/common/widgets/chips/choice_chip.dart';
import 'package:e_commerce/common/widgets/commmo_shapes/containers/rounded_container.dart';
import 'package:e_commerce/common/widgets/commmo_shapes/containers/rounded_image.dart';
import 'package:e_commerce/common/widgets/icons/circular_icons.dart';
import 'package:e_commerce/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:e_commerce/common/widgets/products/product_cards/product_tiitle_text.dart';
import 'package:e_commerce/features/shop/screens/home/home.dart';
import 'package:e_commerce/features/shop/screens/product_details/widgets/bottom_add_to_card_widget.dart';
import 'package:e_commerce/features/shop/screens/product_details/widgets/curved_edge_widget.dart';
import 'package:e_commerce/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:e_commerce/features/shop/screens/product_details/widgets/product_detail_image_slider.dart';
import 'package:e_commerce/features/shop/screens/product_details/widgets/product_price_text.dart';
import 'package:e_commerce/features/shop/screens/product_details/widgets/product_title_text.dart';
import 'package:e_commerce/features/shop/screens/product_details/widgets/rating_and_share.dart';
import 'package:e_commerce/features/shop/screens/product_reviews/widgets/product_reviews.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/enums.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:readmore/readmore.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.red ,
      bottomNavigationBar: BottomAddToCard(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Product Image Slider
            ProductImageSlider(),

            // Product Details
            Padding(
              padding: const EdgeInsets.only(
                right: USizes.defaultSpace,
                left: USizes.defaultSpace,
                bottom: USizes.defaultSpace,
              ),
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
                            backgroundColor: UColors.textSecondary.withAlpha(
                              100,
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: USizes.sm,
                              vertical: USizes.xs,
                            ),
                            child: Text(
                              '25%',
                              style: Theme.of(context).textTheme.labelLarge!
                                  .apply(color: UColors.black),
                            ),
                          ),
                          const SizedBox(width: USizes.spaceBtwItems),

                          // Price
                          Text(
                            '\$250',
                            style: Theme.of(context).textTheme.titleSmall!
                                .apply(decoration: TextDecoration.lineThrough),
                          ),
                          const SizedBox(width: USizes.spaceBtwItems),
                          ProductPriceText(price: '175', isLarge: true),
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
                          Text(
                            'In Stock',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
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
                            overlayColor: UColors.white,
                          ),
                          const BrandTitleWithVerifiedIcon(
                            title: 'Nike',
                            brandTextSize: TextSizes.medium,
                          ),
                        ],
                      ),
                    ],
                  ),

                  // Attributes
                  ProductsAttributes(),
                  SizedBox(height: USizes.spaceBtwSections),

                  // Checkout Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue, // Button background color
                        foregroundColor: Colors.white, // Text and icon color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            12.0,
                          ), // Adjust radius here
                        ),
                        fixedSize: const Size.fromHeight(50),
                      ),
                      child: Text('Checkout'),
                    ),
                  ),
                  SizedBox(height: USizes.spaceBtwItems),

                  // Description
                  SectionHeading(title: 'Description'),
                  SizedBox(height: USizes.spaceBtwItems),
                  ReadMoreText(
                    'Your long text goes here that needs to be truncated with a read more linkYour long text goes here Your long text goes here that needs to be truncated with a read more linkYour long text goes here that needs to be truncated with a read more link...', // <-- Add this string!
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Show more',
                    trimExpandedText: 'Less',
                    moreStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                    ),
                    lessStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  // SizedBox(height: USizes.spaceBtwSections),

                  // Reviews
                  Divider(),
                  SizedBox(height: USizes.spaceBtwItems),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SectionHeading(
                        title: 'Reviews (199)',
                        showActionButton: false,
                      ),
                      IconButton(
                        onPressed: () =>
                            Get.to(() => const ProductReviewsScreen()),
                        icon: Icon(Iconsax.arrow_right_3_copy, size: 18),
                      ),
                    ],
                  ),
                  SizedBox(height: USizes.spaceBtwItems),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
