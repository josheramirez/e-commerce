import 'package:e_commerce/common/layout/grid_layout.dart';
import 'package:e_commerce/common/widgets/appBar/appbar.dart';
import 'package:e_commerce/common/widgets/shimmer/brands_shimmer.dart';
import 'package:e_commerce/features/shop/controllers/brand_controller.dart';
import 'package:e_commerce/features/shop/models/brand_model.dart';
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
    final brandController = BrandController.instance;

    return Scaffold(
      appBar: UAppBar(title: Text('Brand'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(USizes.defaultSpace),
          child: Column(
            children: [
              SectionHeading(title: 'Brands'),
              SizedBox(height: USizes.spaceBtwItems),

              Obx(
                (){
                  if(brandController.isLoading.value) return const BrandShimmer();

                  if (brandController.allBrands.isEmpty) {
                    return Center(
                      child: Text('No Se Encontraron Datos', style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white))
                    );
                  }
                    // Brands
                    return GridLayout(
                      itemCount: brandController.allBrands.length,
                      itemBuilder: (context, index){
                        final brand = brandController.allBrands[index];
                        return BrandCard(showBorder: true, brand: brand, onTap: () => Get.to(() => BrandProducts(brand: brand)));
                      },
                      mainAxisExtent: 80,
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
