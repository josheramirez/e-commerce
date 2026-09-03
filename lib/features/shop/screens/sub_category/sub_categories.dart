import 'package:e_commerce/common/widgets/appBar/appbar.dart';
import 'package:e_commerce/common/widgets/commmo_shapes/containers/rounded_image.dart';
import 'package:e_commerce/common/widgets/products/product_cards/product_card_horizontal.dart';
import 'package:e_commerce/common/widgets/shimmer/horizontal_product_shimmer.dart';
import 'package:e_commerce/features/shop/controllers/category_controller.dart';
import 'package:e_commerce/features/shop/models/category_model.dart';
import 'package:e_commerce/features/shop/screens/all_products/all_products.dart';
import 'package:e_commerce/features/shop/screens/home/home.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: UAppBar(title: Text(category.name), showBackArrow: true),
      
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(USizes.defaultSpace),
          child: Column(
            children: [

              // Banner
              RoundedImage(width: double.infinity, imageUrl: Images.homeBanner2, applyImageRadius: true),
              SizedBox(height: USizes.spaceBtwSections),
              
              // Sub-Categories
              FutureBuilder(
                future: controller.getSubCategories(category.id),
                builder: (context, snapshot) {

                  const loader = HorizontalProductShimmer();

                  if (snapshot.connectionState == ConnectionState.waiting) {return loader;}
                  if (!snapshot.hasData || snapshot.data == null || snapshot.data!.isEmpty) {
                    return const Center(child: Text('No Hay Datos'));
                  }
                  if (snapshot.hasError) return const Center(child: Text('Hubo un error.'));
                  
                  // Records Found !
                  final subCategories = snapshot.data!;

                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: subCategories.length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (_, index){
                      
                      final subCategory = subCategories[index];
                      
                      return FutureBuilder(
                        future: controller.getCategoryProducts(categoryId: subCategory.id),
                        builder: (context, snapshot) {

                            if (snapshot.connectionState == ConnectionState.waiting) {return loader;}
                            if (!snapshot.hasData || snapshot.data == null || snapshot.data!.isEmpty) {
                              return const Center(child: Text('No Hay Datos'));
                            }
                            if (snapshot.hasError) return const Center(child: Text('Hubo un error.'));
                            
                            // Records Found !
                            final products = snapshot.data!;

                          return Column(
                            children: [
                          
                              // Heading
                              SectionHeading(
                                title: subCategory.name,
                                onPressed: () => Get.to(
                                  () => AllProducts(
                                    title: subCategory.name,
                                    futureMethod: controller.getCategoryProducts(
                                      categoryId: subCategory.id,
                                      limit: -1,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: USizes.spaceBtwItems / 2),
                              
                              // 
                              SizedBox(
                                height: 120,
                                child: ListView.separated(
                                  itemCount:products.length,
                                  scrollDirection: Axis.horizontal,
                                  separatorBuilder: (context, index) => SizedBox(width: USizes.spaceBtwItems), 
                                  itemBuilder: (context, index) =>  ProductCardHorizontal(product: products[index]),
                                ),
                              ),

                              const SizedBox(height: USizes.spaceBtwSections),
                            ]
                          );
                        }
                      );

                      
                    },
                  );
                }
              )
            ],
          ),
        ),
      ),
    );
  }
}