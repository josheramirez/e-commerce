import 'package:e_commerce/features/shop/controllers/cart_controller.dart';
import 'package:e_commerce/features/shop/screens/cart/cart.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class CardCounterIcon extends StatelessWidget {
  const CardCounterIcon({
    super.key, this.iconColor, this.counterBgColor, this.counterTextColor,
  });

  final Color? iconColor, counterBgColor, counterTextColor;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CartController());
    final dark = HelperFunctions.isDarkMode(context);

    return Stack(
      children: [
        IconButton(onPressed: () => Get.to(() => CartScreen()), icon: const Icon(Iconsax.shopping_bag_copy), color: iconColor),
        Positioned(
          right: 0,
          child: Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              color: counterBgColor ?? (dark ? Colors.white : Colors.black),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(
              child: Obx(
                () => Text(
                  controller.numberOfCartItems.value.toString(),
                  style: Theme.of(context).textTheme.labelLarge!.apply(
                    color: counterTextColor ?? (dark ? Colors.black : Colors.white),
                    fontSizeFactor: 0.8,
                  ),
                ),
              )
            ),
          ),
        )
      ]
    );
  }
}
