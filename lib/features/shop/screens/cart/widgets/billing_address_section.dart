import 'package:e_commerce/features/personalization/controllers/address_controller.dart';
import 'package:e_commerce/features/shop/screens/home/home.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BillingAddressSection extends StatelessWidget {
  const BillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddressController());

    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeading( title: 'Direcction de Envio',buttonTitle: 'Cambiar',onPressed: () => controller.selectNewAddressPopup(context)),
          controller.selectedAddress.value.id.isNotEmpty ?
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Name
              Text(controller.selectedAddress.value.name,style: Theme.of(context).textTheme.bodyMedium),
              SizedBox(height: USizes.spaceBtwItems / 2),
      
              // Phone
              Row(
                children: [
                  Icon(Icons.phone, color: Colors.grey, size: 16),
                  SizedBox(width: USizes.spaceBtwItems),
                  Text(controller.selectedAddress.value.phoneNumber,style: Theme.of(context).textTheme.bodyMedium),
                ],
              ),
              SizedBox(width: USizes.spaceBtwItems),
      
              // Address
              Row(
                children: [
                  Icon(Icons.location_history, color: Colors.grey, size: 16),
                  SizedBox(width: USizes.spaceBtwItems),
                  Expanded(
                    child: Text( 'Avebida siempreN VIVA',style: Theme.of(context).textTheme.bodyMedium,softWrap: true),
                  ),
                ],
              ),
              SizedBox(width: USizes.spaceBtwItems),
            ],
          )
          : Text('Selecciona Direccion', style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
    );
  }
}
