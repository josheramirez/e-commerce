import 'package:e_commerce/common/widgets/appBar/appbar.dart';
import 'package:e_commerce/features/shop/screens/cart/widgets/cart_items..dart';
import 'package:e_commerce/features/shop/screens/checkout/checkout.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: UAppBar(
        showBackArrow: true,
        title: Text('Cart', style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(USizes.defaultSpace),
          child: CartItems(),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(USizes.defaultSpace),
        child:
            //  ElevatedButton(onPressed: (){}, child: Text('Checkout \$ 235')),
            ElevatedButton(
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
              child: Text('Checkout \$ 235'),
            ),
      ),
    );
  }
}
