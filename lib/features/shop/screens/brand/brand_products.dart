import 'package:e_commerce/common/widgets/appBar/appbar.dart';
import 'package:e_commerce/common/widgets/products/sortable_products/sortable_products.dart';
import 'package:e_commerce/common/widgets/shimmer/vertical_product_shimmer.dart';
import 'package:e_commerce/features/shop/controllers/brand_controller.dart';
import 'package:e_commerce/features/shop/models/brand_model.dart';
import 'package:e_commerce/features/shop/screens/store/store.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key, required this.brand});

  final BrandModel brand;
  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;

    return Scaffold(
      appBar: UAppBar(title: Text(brand.name),showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(USizes.defaultSpace),
          child: Column(
            children: [
              BrandCard(showBorder: true, brand: brand),
              const SizedBox(height: USizes.spaceBtwItems),

              FutureBuilder(
                future: controller.getBrandProducts(brandId: brand.id),
                builder: (context, snapshot) {
                  const loader = VerticalProductShimmer();

                  if (snapshot.connectionState == ConnectionState.waiting) {return loader;}
                  if (!snapshot.hasData || snapshot.data == null || snapshot.data!.isEmpty) {
                    return const Center(child: Text('No Hay Datos'));
                  }
                  if (snapshot.hasError) return const Center(child: Text('Hubo un error.'));
                  
                  // Records Found !
                  final brandProducts = snapshot.data!;
                  return SortableProducts(products: brandProducts);
                }
              )
            ],
          ),
        ),
      ),
    );
  }
}