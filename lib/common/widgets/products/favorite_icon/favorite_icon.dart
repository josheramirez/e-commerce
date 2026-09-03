import 'package:e_commerce/common/widgets/icons/circular_icons.dart';
import 'package:e_commerce/features/shop/controllers/product/favorites_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class FavoriteIcon extends StatelessWidget {
  const FavoriteIcon({super.key, required this.productId});

  final String productId;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavoritesController());
    return Obx(
      () => UCircularIcon(
        icon: controller.isFavorite(productId) ? Iconsax.heart: Iconsax.heart_copy ,
        color: controller.isFavorite(productId) ? Colors.red : null ,
        onPressed: () => controller.toggleFavoriteProduct(productId),
      ),
    );
  }
}