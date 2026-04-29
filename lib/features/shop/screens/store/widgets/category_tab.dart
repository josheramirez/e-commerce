import 'package:e_commerce/common/layout/grid_layout.dart';
import 'package:e_commerce/common/widgets/brands/brand_showcase.dart';
import 'package:e_commerce/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:e_commerce/features/shop/screens/home/home.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab({super.key});

  // final 
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(USizes.defaultSpace),
          child: Column(
            children: [
              // Brand
              Padding(
                padding: const EdgeInsets.all(0),
                child: BrandShowcase(images: [Images.productImage1,Images.productImage1,Images.productImage1],),
              ),

              // Products
              SectionHeading(title: 'You might like', onPressed: (){}),
              const SizedBox(height: USizes.spaceBtwItems),

              GridLayout(itemCount: 4, itemBuilder: (_, index) => const ProductCardVertical()),
              const SizedBox(height: USizes.spaceBtwItems),
              
            ],
          ),
        ),
      ]
    );
    }
}