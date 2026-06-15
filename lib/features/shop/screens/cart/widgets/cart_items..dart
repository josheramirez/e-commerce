import 'package:e_commerce/common/widgets/products/cart/add_remove_button.dart';
import 'package:e_commerce/common/widgets/products/cart/cart_item.dart';
import 'package:e_commerce/features/shop/screens/product_details/widgets/product_price_text.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class CartItems extends StatelessWidget {
  const CartItems({super.key, this.showAddRemoveButtons = true});

  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
            shrinkWrap: true, // Forces the list to only take up necessary space
            separatorBuilder: (_, __) => const SizedBox(height: USizes.spaceBtwSections),
            itemCount:2,
            itemBuilder: (_, index) => Column(
              children: [
                CartItem(),
                if(showAddRemoveButtons) SizedBox(height: USizes.spaceBtwItems),

                if(showAddRemoveButtons)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     Row(
                        children: [
                          SizedBox(width: 70),
                          ProductQuantityWithAddRemoveButton(),
                        ], 
                      ),
                      ProductPriceText(price: '40')
                  ],
                ),
               
              ],
            ), 
           
          );
  }
}