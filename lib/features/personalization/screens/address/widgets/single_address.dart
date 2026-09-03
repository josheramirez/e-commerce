import 'package:e_commerce/common/widgets/commmo_shapes/containers/rounded_container.dart';
import 'package:e_commerce/features/personalization/controllers/address_controller.dart';
import 'package:e_commerce/features/personalization/models/address_model.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class SingleAddress extends StatelessWidget {
  const SingleAddress({super.key, required this.address, required this.onTap});

  final AddressModel address;
  final VoidCallback onTap;
  
  @override
  Widget build(BuildContext context) {

    final controller = Get.put(AddressController());
    final dark = HelperFunctions.isDarkMode(context);

    return Obx(() {

        final selectedAddressId = controller.selectedAddress.value.id;
        final selectedAddress = selectedAddressId == address.id;

        return InkWell(
          onTap: onTap,
          child: URoundedContainer(
            padding: EdgeInsets.all(USizes.md),
            width: double.infinity,
            showBorder: true,
            backgroundColor: selectedAddress ? Colors.blue.withValues(alpha: 0.5) : Colors.transparent,
            borderColor: selectedAddress
              ? Colors.transparent 
              : dark
                ? UColors.darkGrey
                : UColors.grey,
            margin: EdgeInsets.only(bottom: USizes.spaceBtwItems),
            child: Stack(
              children: [

                // Icon
                Positioned(
                  right: 5,
                  top: 0,
                  child: Container(
                    color:Colors.red,
                    child: Icon(
                      selectedAddress ? Iconsax.tick_circle_copy : null,
                      color: selectedAddress
                        ? dark
                          ? UColors.light
                          : UColors.dark
                        :
                        null,
                    ),
                  ),
                ),

                // Column data
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    // Name
                    Text(
                      address.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    SizedBox(height: USizes.sm/2),

                    // Phone Number
                    Text(address.formattedPhoneNumber,maxLines: 1,overflow: TextOverflow.ellipsis),
                    SizedBox(height: USizes.sm/2),

                    // Address
                    Text(address.toString(), softWrap: true),
                    SizedBox(height: USizes.sm/2),

                  ],
                )
              ],
            ),
          ),
        );
      }
    );
  }
}