import 'package:e_commerce/common/widgets/success_screen/success_screen.dart';
import 'package:e_commerce/data/repositories/authentication/authentication_repository.dart';
import 'package:e_commerce/data/repositories/order/order_repository.dart';
import 'package:e_commerce/features/personalization/controllers/address_controller.dart';
import 'package:e_commerce/features/shop/controllers/cart_controller.dart';
import 'package:e_commerce/features/shop/controllers/product/checkout_controller.dart';
import 'package:e_commerce/features/shop/models/order_model.dart';
import 'package:e_commerce/navigation_menu.dart';
import 'package:e_commerce/utils/constants/enums.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:e_commerce/utils/constants/loaders.dart';
import 'package:e_commerce/utils/popups/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/state_manager.dart';

class OrderController extends GetxController {
  static OrderController get instance => Get.find();

  final cartController = CartController.instance;
  final addressController = AddressController.instance;
  final checkoutController = CheckoutController.instance;
  final orderRepository = Get.put(OrderRepository());

  // Fetch user's order history
  Future<List<OrderModel>> fetchUserOrders() async {
    try {
      final userOrders = await orderRepository.fetchUserOrders();
      return userOrders;
    } catch (e) {
      Loaders.warningSnackBar(title: 'Oh Snap', message: e.toString());
      return [];
    }
  }

  // Add method for order processing
  void processOrder(double totalAmount) async{
    try {
      // Start Loader
      FullScreenLoader.openLoadingDialog('Processing your order', Images.pencilAnimation);

      // Get user authentication id
      final userId = AuthenticationRepository.instance.currentUser!.uid;
      if(userId.isEmpty) return;

      // Add Details
      final order = OrderModel(
        id: UniqueKey().toString(),
        userId: userId,
        status: OrderStatus.pending, 
        totalAmount: totalAmount, 
        orderDate: DateTime.now(),
        paymentMethod: checkoutController.selectedPaymentMethod.value.name,
        address: addressController.selectedAddress.value,
        // Set Date as needed
        deliveryDate: DateTime.now(),
        items: cartController.cartItems.toList(), 
      );

      // Save the order to Firestore
      await orderRepository.saveOrder(order, userId);

      // Update the cart status
      cartController.clearCart();

      // Show Success screen
      Get.off(() => SuccessScreen(
          image: Images.successfulPaymentIcon,
          title: 'Pago Exitoso',
          subtitle: 'Tu Pedido sera enviado pronto.',
          onPress: () => Get.offAll(() => NavigationMenu()),
      ));

    } catch (e) {
      Loaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}