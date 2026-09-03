import 'package:e_commerce/common/widgets/appBar/appbar.dart';
import 'package:e_commerce/features/personalization/controllers/address_controller.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/validators/validator.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = AddressController.instance;

    return Scaffold(
      appBar: UAppBar(showBackArrow: true, title: Text('Add new Address')),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(USizes.defaultSpace),
          child: Form(
            key: controller.addressFormKey,
            child: Column(
              children: [

                // Name
                TextFormField(
                  controller: controller.name,
                  validator: (value) => Validator.validateEmptyText('Name', value),
                  decoration: InputDecoration(prefixIcon: Icon(Iconsax.user_copy), labelText: 'Nombre', border: OutlineInputBorder()),
                ),
                SizedBox(height: USizes.spaceBtwInputFields),
                
                // Phone
                TextFormField(
                  controller: controller.phoneNumber,
                  validator: Validator.validatePhoneNumber,
                  decoration: InputDecoration(prefixIcon: Icon(Iconsax.mobile_copy),labelText: 'Telefono')),
                SizedBox(height: USizes.spaceBtwInputFields),
                Row(
                  children: [

                    // Street
                    Expanded(
                      child: TextFormField(
                        controller: controller.street,
                        validator: (value) => Validator.validateEmptyText('Street', value), 
                        decoration: const InputDecoration(prefixIcon: Icon(Iconsax.building_3_copy), border: OutlineInputBorder(), labelText: 'Calle'),
                      ),
                    ),
                    SizedBox(width: USizes.spaceBtwInputFields),

                    // Postal Code
                    Expanded(
                      child: TextFormField(
                        controller: controller.postalCode,
                        validator: (value) => Validator.validateEmptyText('Postal Code', value),
                        decoration: const InputDecoration(prefixIcon: Icon(Iconsax.code_copy),border: OutlineInputBorder(), labelText: 'Postal Code', ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: USizes.spaceBtwInputFields),
                Row(
                  children: [

                    // City
                    Expanded(
                      child: TextFormField(
                        controller: controller.city,
                        validator: (value) => Validator.validateEmptyText('City', value),
                        decoration: const InputDecoration(prefixIcon: Icon(Iconsax.building_4_copy),border: OutlineInputBorder(),labelText: 'City',),
                      ),
                    ),
                    SizedBox(width: USizes.spaceBtwInputFields),

                    // State
                    Expanded(
                      child: TextFormField(
                        controller: controller.state,
                        validator: (value) => Validator.validateEmptyText('State', value),
                        decoration: const InputDecoration( prefixIcon: Icon(Iconsax.activity_copy),border: OutlineInputBorder(),labelText: 'State',
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: USizes.spaceBtwInputFields),

                // Country
                TextFormField(
                  controller: controller.country,
                  validator: (value) => Validator.validateEmptyText('Country', value),
                  decoration: InputDecoration(prefixIcon: Icon(Iconsax.global_copy), labelText: 'Country',border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: USizes.defaultSpace),

                // Button Save
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue, // Button background color
                      foregroundColor: Colors.white, // Text and icon color
                      elevation: 5, // Shadow depth
                      padding: const EdgeInsets.symmetric(horizontal: 32,vertical: 16), // Internal spacing
                      minimumSize: const Size(150,50,), // Minimum width and height
                      textStyle: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold,),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12), // Rounded corners
                      ),
                    ),
                    child: Text('Save'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
