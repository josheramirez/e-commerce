import 'package:e_commerce/common/widgets/appBar/appbar.dart';
import 'package:e_commerce/features/personalization/controllers/address_controller.dart';
import 'package:e_commerce/features/personalization/screens/address/add_new_address.dart';
import 'package:e_commerce/features/personalization/screens/address/widgets/single_address.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class UserAddressScreen extends StatefulWidget {
  const UserAddressScreen({super.key});

  @override
  State<UserAddressScreen> createState() => _UserAddressScreenState();
}

class _UserAddressScreenState extends State<UserAddressScreen> {
  @override
  Widget build(BuildContext context) {

    final controller = Get.put(AddressController());

    return Scaffold(
      
      // Button
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () => Get.to(() => AddNewAddressScreen()),
        child: Icon(Iconsax.add_copy, color: UColors.white),
      ),

      // AppBar
      appBar: UAppBar(showBackArrow: true, title: Text('Addresses', style: Theme.of(context).textTheme.headlineSmall)),
      
      // Addresses
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(USizes.defaultSpace),
          child: Obx(
            () => FutureBuilder(
            
              // Use key to trigger refresh
              key: Key(controller.refreshData.value.toString()),
              future: controller.getAllUserAddresses(),
              builder: (context, snapshot){
                
                // const loader = VerticalProductShimmer();
            
                // if (snapshot.connectionState == ConnectionState.waiting) {return loader;}
                if (!snapshot.hasData || snapshot.data == null || snapshot.data!.isEmpty) {
                  return const Center(child: Text('No Hay Datos'));
                }
                if (snapshot.hasError) return const Center(child: Text('Hubo un error.'));
            
                final addresses = snapshot.data!;
            
                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: addresses.length,
                    itemBuilder: (_, index) => SingleAddress(
                      address: addresses[index],
                      onTap: () => controller.selectedAddress(addresses[index]),
                    )
                );
            
              }
            ),
          )
          // Column(
          //   children: [
          //     SingleAddress(selectedAddress: true),
          //     SingleAddress(selectedAddress: false),
          //   ],
          // ),
        ),
      ),
    
    );
  }
}
