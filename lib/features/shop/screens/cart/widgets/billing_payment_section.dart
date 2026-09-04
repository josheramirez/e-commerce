import 'package:e_commerce/common/widgets/commmo_shapes/containers/rounded_container.dart';
import 'package:e_commerce/features/shop/controllers/product/checkout_controller.dart';
import 'package:e_commerce/features/shop/screens/home/home.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class BillingPaymentSection extends StatelessWidget {
  const BillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {

    final dark = HelperFunctions.isDarkMode(context);
    final controller = Get.put(CheckoutController());
    
    return Column(
      children: [
        SectionHeading(title: 'Metodo de Pago', buttonTitle: 'Cambiar', onPressed: () => controller.selectPaymentMethod(context)),
        SizedBox(height: USizes.spaceBtwItems / 2),
        Obx(
          () => Row(
            children: [
              URoundedContainer(
                width: 60,
                height: 35,
                backgroundColor: dark ? UColors.light : UColors.white,
                padding: EdgeInsets.all(USizes.sm),
                child: Image(image: AssetImage(controller.selectedPaymentMethod.value.image), fit:  BoxFit.contain),
              ),
              SizedBox(width: USizes.spaceBtwItems / 2),
              Text(controller.selectedPaymentMethod.value.name, style: Theme.of(context).textTheme.bodyLarge),
            ],
          ),
        )
      ],
    );
  }
}