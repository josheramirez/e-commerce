import 'package:e_commerce/common/layout/grid_layout.dart';
import 'package:e_commerce/common/widgets/appBar/appbar.dart';
import 'package:e_commerce/common/widgets/products/sortable_products/sortable_products.dart';
import 'package:e_commerce/features/shop/screens/brand/brand_products.dart';
import 'package:e_commerce/features/shop/screens/home/home.dart';
import 'package:e_commerce/features/shop/screens/store/store.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UAppBar(title: Text('Brand'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(USizes.defaultSpace),
          child: Column(
            children: [
              SectionHeading(title: 'Brands'),
              SizedBox(height: USizes.spaceBtwItems),

              // Brands
              GridLayout(
                itemCount: 10, 
                itemBuilder: (context, index) => BrandCard(
                  showBorder: true, 
                  onTap: () => Get.to(()=>BrandProducts())
                  ),
                mainAxisExtent: 80,
              )
            ],
          ),
        ),
      ),
    );
  }
}