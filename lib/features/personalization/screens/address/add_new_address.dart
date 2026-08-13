import 'package:e_commerce/common/widgets/appBar/appbar.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UAppBar(showBackArrow: true, title: Text('Add new Address')),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(USizes.defaultSpace),
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Iconsax.user_copy),
                    labelText: 'Name',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: USizes.spaceBtwInputFields),
                TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Iconsax.mobile_copy),
                    labelText: 'Phone',
                  ),
                ),
                SizedBox(height: USizes.spaceBtwInputFields),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.building_3_copy),
                          border: OutlineInputBorder(),
                          labelText: 'Street',
                        ),
                      ),
                    ),
                    SizedBox(width: USizes.spaceBtwInputFields),
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.code_copy),
                          border: OutlineInputBorder(),
                          labelText: 'Postal Code',
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: USizes.spaceBtwInputFields),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.building_4_copy),
                          border: OutlineInputBorder(),
                          labelText: 'City',
                        ),
                      ),
                    ),
                    SizedBox(width: USizes.spaceBtwInputFields),
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.activity_copy),
                          border: OutlineInputBorder(),
                          labelText: 'State',
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: USizes.spaceBtwInputFields),
                TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Iconsax.global_copy),
                    labelText: 'Country',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: USizes.defaultSpace),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue, // Button background color
                      foregroundColor: Colors.white, // Text and icon color

                      elevation: 5, // Shadow depth
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 16,
                      ), // Internal spacing
                      minimumSize: const Size(
                        150,
                        50,
                      ), // Minimum width and height
                      textStyle: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          12,
                        ), // Rounded corners
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
