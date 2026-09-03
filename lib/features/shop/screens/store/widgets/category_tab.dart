import 'package:e_commerce/common/layout/grid_layout.dart';
import 'package:e_commerce/common/widgets/brands/brand_showcase.dart';
import 'package:e_commerce/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:e_commerce/common/widgets/shimmer/vertical_product_shimmer.dart';
import 'package:e_commerce/features/shop/controllers/category_controller.dart';
import 'package:e_commerce/features/shop/controllers/product/product_controller.dart';
import 'package:e_commerce/features/shop/models/category_model.dart';
import 'package:e_commerce/features/shop/screens/all_products/all_products.dart';
import 'package:e_commerce/features/shop/screens/home/home.dart';
import 'package:e_commerce/features/shop/screens/store/widgets/category_brands.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab({super.key, required this.category});

  final CategoryModel category;
  
  @override
  Widget build(BuildContext context) {
    
    final controller = CategoryController.instance;

    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(USizes.defaultSpace),
          child: Column(
            children: [

              // Brands
              CategoryBrands(category: category),
              const SizedBox(height: USizes.spaceBtwItems),

              // Products
              FutureBuilder(
                future: controller.getCategoryProducts(categoryId: category.id),
                builder: (context, snapshot){
                  

                  final loader = const VerticalProductShimmer();

                  if (snapshot.connectionState == ConnectionState.waiting) {return loader;}
                  if (!snapshot.hasData || snapshot.data == null || snapshot.data!.isEmpty) {
                    return const Center(child: Text('No Hay Datos'));
                  }
                  if (snapshot.hasError) return const Center(child: Text('Hubo un error.'));

                  // Record Found !
                  final products = snapshot.data!;

                  return Column(
                      children: [
                        SectionHeading(
                          title: 'You might like', 
                          onPressed: () => Get.to(AllProducts(
                            title: category.name,
                            futureMethod: controller.getCategoryProducts(categoryId: category.id, limit: -1),
                          ))
                        ),
                        const SizedBox(height: USizes.spaceBtwItems),
                        GridLayout(itemCount: products.length, itemBuilder: (_, index) => ProductCardVertical(product: products[index])),
                      ]
                    );
      
                }
              )

             
              // const SizedBox(height: USizes.spaceBtwItems),
              
            ],
          ),
        ),
      ]
    );
    }
}