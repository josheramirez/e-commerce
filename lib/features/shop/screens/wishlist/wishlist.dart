import 'package:e_commerce/common/layout/grid_layout.dart';
import 'package:e_commerce/common/widgets/appBar/appbar.dart';
import 'package:e_commerce/common/widgets/icons/circular_icons.dart';
import 'package:e_commerce/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:e_commerce/features/shop/screens/home/home.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UAppBar(
        title: Text('Wishlist', style: Theme.of(context).textTheme.headlineMedium),
        actions: [
          UCircularIcon(icon: Iconsax.add_copy, onPressed: () => Get.to(HomeScreen())),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(USizes.defaultSpace),
        child: Column(
          children: [
            GridLayout(itemCount: 20, itemBuilder: (_, index) => const ProductCardVertical())
          ],
        ),
      ),
    );
  }
}