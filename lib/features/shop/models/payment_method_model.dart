import 'package:e_commerce/utils/constants/enums.dart';
import 'package:get/state_manager.dart';

class PaymentMethodModel extends GetxController{
  String name;
  String image;
  // PaymentMethods? paymentMethod;

  PaymentMethodModel({
    required this.name,
    required this.image,
    // this.paymentMethod
  });


  static PaymentMethodModel empty() => PaymentMethodModel(
    name: '',
    image: '',
    // paymentMethod: PaymentMethods.creditCard,
  );
}