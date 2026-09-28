import 'package:e_commerce/common/widgets/brands/brand_showcase.dart';
import 'package:e_commerce/common/widgets/shimmer/boxes_shimmer.dart';
import 'package:e_commerce/common/widgets/shimmer/list_title_shimmer.dart';
import 'package:e_commerce/features/shop/controllers/brand_controller.dart';
import 'package:e_commerce/features/shop/models/category_model.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class CategoryBrands extends StatelessWidget {
  const CategoryBrands({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return FutureBuilder(
      future: controller.getBrandsForCategory(category.id),
      builder: (context, snapshot) {
        
        const loader = Column(
          children: [
            ListTitleShimmer(),
            SizedBox(height: USizes.spaceBtwItems),
            BoxesShimmer(),
            SizedBox(height: USizes.spaceBtwItems),
          ],
        );

        if (snapshot.connectionState == ConnectionState.waiting) {return loader;}
        if (!snapshot.hasData || snapshot.data == null || snapshot.data!.isEmpty) {
          return const Center(child: Text('No Hay Datos'));
        }
        if (snapshot.hasError) return const Center(child: Text('Hubo un error.'));
        
        // Founf brands fot this category
        final brands = snapshot.data!;
        
        // Find 3 images for each brand
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: brands.length,
          itemBuilder: (_, index){
            final brand = brands[index];
            return FutureBuilder(
              future: controller.getBrandProducts(brandId: brand.id, limit: 3),
              builder: (context, snapshot) {

                if (snapshot.connectionState == ConnectionState.waiting) {return loader;}
                if (!snapshot.hasData || snapshot.data == null || snapshot.data!.isEmpty) {
                  return const Center(child: Text('No Hay Datos'));
                }
                if (snapshot.hasError) return const Center(child: Text('Hubo un error.'));

                final products = snapshot.data!;

                return BrandShowcase(brand: brand, images: products.map((e) => e.thumbnail).toList());
              }
            );
          }
        );

      }
    );
  }
}