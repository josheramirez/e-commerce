import 'package:e_commerce/common/layout/grid_layout.dart';
import 'package:e_commerce/common/widgets/appBar/appbar.dart';
import 'package:e_commerce/common/widgets/icons/circular_icons.dart';
import 'package:e_commerce/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:e_commerce/common/widgets/shimmer/vertical_product_shimmer.dart';
import 'package:e_commerce/features/shop/controllers/product/favorites_controller.dart';
import 'package:e_commerce/features/shop/controllers/product/product_controller.dart';
import 'package:e_commerce/features/shop/screens/home/home.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = FavoritesController.instance;

    return Scaffold(
      appBar: UAppBar(
        title: Text('Wishlist', style: Theme.of(context).textTheme.headlineMedium),
        actions: [
          UCircularIcon(icon: Iconsax.add_copy, onPressed: () => Get.to(HomeScreen())),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(USizes.defaultSpace),

          child: Obx(
            () => FutureBuilder(
              future: controller.getFavoriteProducts(), 
              builder: (context, snapshot){
            
                const loader = VerticalProductShimmer(itemCount: 6);
            
                if (snapshot.connectionState == ConnectionState.waiting) {return loader;}
                if (!snapshot.hasData || snapshot.data == null || snapshot.data!.isEmpty) {
                  return const Center(child: Text('No Hay Datos'));
                }
                if (snapshot.hasError) return const Center(child: Text('Hubo un error.'));
                 
                // Record Found !
                final products = snapshot.data!;
                 
                return GridLayout(
                  itemCount: products.length,
                  itemBuilder: (_, index) => ProductCardVertical(
                    product: products[index],
                  ),
                );
              }
            ),
          ),
        ),
      ),
    );
  }
}