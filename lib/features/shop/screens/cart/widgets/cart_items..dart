import 'package:e_commerce/common/widgets/products/cart/add_remove_button.dart';
import 'package:e_commerce/common/widgets/products/cart/cart_item.dart';
import 'package:e_commerce/features/shop/controllers/cart_controller.dart';
import 'package:e_commerce/features/shop/screens/product_details/widgets/product_price_text.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class CartItems extends StatelessWidget {
  const CartItems({super.key, this.showAddRemoveButtons = true});

  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;

    return Obx(
      () => ListView.separated(
        shrinkWrap: true, // Forces the list to only take up necessary space
        itemCount: controller.cartItems.length,
        separatorBuilder: (_, __) => const SizedBox(height: USizes.spaceBtwSections),
        itemBuilder: (_, index) => Obx(
          () {
            final item = controller.cartItems[index];
            return Column(
              children: [

                // Cart Item
                CartItem(cartItem: item,),
                // if(showAddRemoveButtons) SizedBox(height: USizes.spaceBtwItems),
                
                // Add Remove Button Row with total price
                if(showAddRemoveButtons)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                      Row(
                        children: [
                          const SizedBox(width: 80),
                          Container(
                            color: Colors.transparent,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: ProductQuantityWithAddRemoveButton(
                                quantity: item.quantity,
                                add: () => controller.addOneToCart(item),
                                remove: () => controller.removeOneFromCart(item),
                              ),
                            ),
                          ),
                        ], 
                      ),
                      ProductPriceText(price: (item.price * item.quantity).toStringAsFixed(0)),
                  ],
                ),
                
              ],
            );
          }
        ), 
        
      ),
    );
  }
}