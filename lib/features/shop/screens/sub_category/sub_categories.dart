import 'package:e_commerce/common/widgets/appBar/appbar.dart';
import 'package:e_commerce/common/widgets/commmo_shapes/containers/rounded_image.dart';
import 'package:e_commerce/common/widgets/products/product_cards/product_card_horizontal.dart';
import 'package:e_commerce/features/shop/screens/home/home.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: UAppBar(title: Text('Sports'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(USizes.defaultSpace),
          child: Column(
            children: [

              // Banner
              RoundedImage(width: double.infinity, imageUrl: Images.homeBanner2, applyImageRadius: true),
              SizedBox(height: USizes.spaceBtwSections),
              
              // Sub-Categories
              Column(
                children: [
                  SectionHeading(title: 'Sports shirts', onPressed: (){}),
                  SizedBox(height: USizes.spaceBtwItems / 2),
                  
                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      itemCount:10,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) => SizedBox(width: USizes.spaceBtwItems), 
                      itemBuilder: (context, index) =>  const ProductCardHorizontal(),
                    ),
                  ),
                ]
              )
            ],
          ),
        ),
      ),
    );
  }
}