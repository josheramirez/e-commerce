import 'package:e_commerce/common/widgets/icons/circular_icons.dart';
import 'package:e_commerce/features/shop/controllers/cart_controller.dart';
import 'package:e_commerce/features/shop/models/product_model.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class BottomAddToCard extends StatelessWidget {
  const BottomAddToCard({super.key, required this.product});

  final ProductModel product;
  
  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    controller.updateAlreadyAddedProductCount(product);
    final dark = HelperFunctions.isDarkMode(context);

    return Container(
      padding: EdgeInsets.symmetric(horizontal:  USizes.defaultSpace, vertical: USizes.defaultSpace / 2),
      decoration: BoxDecoration(
        color : UColors.grey,
        borderRadius: BorderRadius.only(
          topLeft:  Radius.circular(USizes.cardRadiusLg),
          topRight: Radius.circular(USizes.cardRadiusLg)
        )
      ),
      child: Obx(
        () => Row(
          mainAxisAlignment:  MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                UCircularIcon(
                  icon: Iconsax.minus_copy,
                  backgroundColor: UColors.darkGrey,
                  width: 40,
                  height: 40,
                  color: Colors.white,
                  onPressed: () => controller.productQuantityInCart.value < 1
                      ? null
                      : controller.productQuantityInCart.value -= 1,
                ),
                
                SizedBox(width: USizes.spaceBtwItems),
                Text(controller.productQuantityInCart.value.toString(), style: Theme.of(context).textTheme.titleSmall),
        
                SizedBox(width: USizes.spaceBtwItems),
                UCircularIcon(
                  icon: Iconsax.add_copy,
                  backgroundColor: UColors.black,
                  width: 40,
                  height: 40,
                  color: UColors.white,
                  onPressed: () => controller.productQuantityInCart.value += 1,
                )
              ],
            ),
        
            ElevatedButton(
              onPressed: controller.productQuantityInCart.value < 1
                  ? null
                  : () => controller.addToCart(product),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(USizes.md),
                backgroundColor: Colors.black,     // Button background color
                foregroundColor: Colors.white,    // Text and icon color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0), // Adjust radius here
                ),
                fixedSize: const Size.fromHeight(50),
              ), 
              child: Text('Agregar al Carro'),
            )
          ],
        ),
      ),
    );
  }
}