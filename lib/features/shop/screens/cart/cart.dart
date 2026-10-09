import 'package:e_commerce/common/widgets/appBar/appbar.dart';
import 'package:e_commerce/common/widgets/loaders/animation_loader.dart';
import 'package:e_commerce/features/shop/controllers/cart_controller.dart';
import 'package:e_commerce/features/shop/screens/cart/widgets/cart_items..dart';
import 'package:e_commerce/features/shop/screens/checkout/checkout.dart';
import 'package:e_commerce/navigation_menu.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  String toThousandString(String words) => words.replaceAllMapped(
    RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
    (Match m) => '${m[1]}.',
  );

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;

    final formatter = NumberFormat('#.###');

    return Scaffold(
      backgroundColor: Colors.white,

      appBar: UAppBar(
        showBackArrow: true,
        title: Text('Carro', style: Theme.of(context).textTheme.headlineSmall),
      ),

      body: Obx(() {
        final emptyWidget = AnimationLoaderWidget(
          text: 'Whop! El carro esta Vacio.',
          animation: Images.cartEmptyAnimation,
          showAction: true,
          actionText: 'Vamos a llenarlo',
          onActionPressed: () => Get.off(() => const NavigationMenu()),
        );

        return controller.cartItems.isEmpty
            ? emptyWidget
            : SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(USizes.defaultSpace),
                  child: CartItems(),
                ),
              );
      }),

      // Checkout
      bottomNavigationBar: controller.cartItems.isEmpty
          ? const SizedBox()
          : Padding(
              padding: const EdgeInsets.all(USizes.defaultSpace),
              child: ElevatedButton(
                onPressed: () => Get.to(() => CheckoutScreen()),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Button background color
                  foregroundColor: Colors.white, // Text and icon color

                  elevation: 5, // Shadow depth
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 16,
                  ), // Internal spacing
                  minimumSize: const Size(150, 50), // Minimum width and height
                  textStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // Rounded corners
                  ),
                ),
                child: Obx(
                  () => Text(
                    'Checkout  \$ ${(toThousandString(controller.totalCartPrice.value.toInt().toString()))}',
                  ),
                ),
              ),
            ),
    );
  }
}

// GestureDetector(
//   onTap:  (){
//     if (product.productType == ProductType.single.toString()) {
//       final cartItem = cartController.convertToCartItem(product, 1);
//       cartController.addOneToCart(cartItem);
//     }else{
//       Get.to(() => ProductDetailScreen(product: product));
//     }
//   },
//   child: Obx(() {
//     final productQuantityInCart = cartController.getProductQuantityInCart(product.id);

//     return Container(
//       width: USizes.iconLg * 1.1,
//       height: USizes.iconLg * 1.1,
//       decoration: BoxDecoration(
//         color: productQuantityInCart > 0 ? UColors.primary : UColors.dark,
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(USizes.cardRadiusMd),
//           bottomRight: Radius.circular(USizes.productImageRadius,),
//         ),
//       ),
//       child: Center(
//         child: productQuantityInCart > 0
//           ? Text(productQuantityInCart.toString(), style: Theme.of(context).textTheme.bodyLarge!.apply(color: UColors.white))
//           : const Icon(Iconsax.add_copy, color: UColors.white)),
//     );
//   }
//   ),
// ),

//                     Container(
//   width: USizes.iconLg * 1.1,
//   height: USizes.iconLg * 1.1,
//   decoration: BoxDecoration(
//     color: UColors.primary,
//     borderRadius: BorderRadius.only(
//       topLeft: Radius.circular(USizes.cardRadiusMd),
//       bottomRight: Radius.circular(USizes.productImageRadius,),
//     ),
//   ),
//   child: Icon(Iconsax.add_copy, color: UColors.white),
// ),
