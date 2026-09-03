import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/common/widgets/appBar/appbar.dart';
import 'package:e_commerce/common/widgets/products/sortable_products/sortable_products.dart';
import 'package:e_commerce/common/widgets/shimmer/vertical_product_shimmer.dart';
import 'package:e_commerce/features/shop/controllers/all_products_controller.dart';
import 'package:e_commerce/features/shop/models/product_model.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({super.key, required this.title, this.query, this.futureMethod});

  final String title;
  final Query? query;
  final Future<List<ProductModel>>? futureMethod;
  

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductsController());

    return Scaffold(
      appBar: UAppBar(title: Text(title), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(USizes.defaultSpace),
          child: FutureBuilder(
            future: futureMethod ?? controller.fetchProductsByQuery(query),
            builder: (context, snapshot) {
              
              const loader = VerticalProductShimmer();

              if (snapshot.connectionState == ConnectionState.waiting) {return loader;}
              if (!snapshot.hasData || snapshot.data == null || snapshot.data!.isEmpty) {
                return const Center(child: Text('No Hay Datos'));
              }
              if (snapshot.hasError) return const Center(child: Text('Hubo un error.'));

              final products = snapshot.data!;

              return SortableProducts(products: products);
            }
          ),
        ),
      ),
    );
  }
}
