import 'package:e_commerce/common/widgets/appBar/appbar.dart';
import 'package:e_commerce/common/widgets/commmo_shapes/containers/rounded_container.dart';
import 'package:e_commerce/common/widgets/success_screen/success_screen.dart';
import 'package:e_commerce/features/shop/screens/cart/widgets/billing_address_section.dart';
import 'package:e_commerce/features/shop/screens/cart/widgets/billing_payment_section.dart';
import 'package:e_commerce/features/shop/screens/cart/widgets/cart_items..dart';
import 'package:e_commerce/features/shop/screens/cart/widgets/cupon_code.dart';
import 'package:e_commerce/navigation_menu.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final dark = HelperFunctions.isDarkMode(context),
    final dark = false;
    return Scaffold(
      appBar: UAppBar(
        showBackArrow: true,
        title: Text(
          'Order Review',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(USizes.defaultSpace),
          child: Column(
            children: [
              // Items in Cart
              CartItems(showAddRemoveButtons: false),
              SizedBox(height: USizes.spaceBtwSections),

              // Coupon TextField
              CuponCode(),
              SizedBox(height: USizes.spaceBtwSections),

              // Billing Section
              URoundedContainer(
                showBorder: true,
                padding: EdgeInsets.all(USizes.md),
                backgroundColor: dark ? UColors.black : UColors.white,
                child: Column(
                  children: [
                    // Pricing
                    BillingPaymentSection(),
                    SizedBox(height: USizes.spaceBtwItems),

                    // Divider
                    Divider(),
                    SizedBox(height: USizes.spaceBtwItems),

                    // PAyment Method
                    BillingAddressSection(),
                    SizedBox(height: USizes.spaceBtwItems),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(USizes.defaultSpace),
        child:
            //  ElevatedButton(onPressed: (){}, child: Text('Checkout \$ 235')),
            ElevatedButton(
              onPressed: () => Get.to(
                () => SuccessScreen(
                  image: Images.successfulPaymentIcon,
                  title: 'Payment Success',
                  subtitle: 'Your item will be shipped soon',
                  onPress: () => Get.offAll(() => NavigationMenu()),
                ),
              ),
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
