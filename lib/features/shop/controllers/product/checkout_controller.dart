import 'package:e_commerce/features/shop/models/payment_method_model.dart';
import 'package:e_commerce/features/shop/screens/checkout/payment_title.dart';
import 'package:e_commerce/features/shop/screens/home/home.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/state_manager.dart';

class CheckoutController extends GetxController {
  static CheckoutController get instance => Get.find();

  final Rx<PaymentMethodModel> selectedPaymentMethod = PaymentMethodModel.empty().obs;
  
  @override
  void onInit() {
    selectedPaymentMethod.value = PaymentMethodModel(name: 'Mercado Pago', image: Images.mercadoPago);
    super.onInit();
  }

  Future<dynamic> selectPaymentMethod(BuildContext context){
    return showModalBottomSheet(
      context: context,
      builder: (_) => SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(USizes.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionHeading(title: 'Selecciona Metodo de Pago', showActionButton: false),
              const SizedBox(height: USizes.spaceBtwSections),
              PaymentTitle(paymentMethod: PaymentMethodModel(name: 'Paypal', image: Images.paypal)),
              const SizedBox(height: USizes.spaceBtwItems/2),
              PaymentTitle(paymentMethod: PaymentMethodModel(name: 'Tarjeta Credito', image: Images.creditCard)),
              const SizedBox(height: USizes.spaceBtwItems/2),
              PaymentTitle(paymentMethod: PaymentMethodModel(name: 'Webpay', image: Images.webpay)),
              const SizedBox(height: USizes.spaceBtwItems/2),
              PaymentTitle(paymentMethod: PaymentMethodModel(name: 'Mercado Pago', image: Images.mercadoPago)),
              const SizedBox(height: USizes.spaceBtwItems/2),
              PaymentTitle(paymentMethod: PaymentMethodModel(name: 'BitCoins', image: Images.bitcoin)),
              const SizedBox(height: USizes.spaceBtwItems/2),
              const SizedBox(height: USizes.spaceBtwSections),
            ],
          ),
        ),
      )
    );
  }
}