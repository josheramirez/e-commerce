import 'package:e_commerce/common/widgets/appBar/appbar.dart';
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
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () => Get.to(() => AddNewAddressScreen()),
        child: Icon(Iconsax.add_copy, color: UColors.white),
      ),
      appBar: UAppBar(
        showBackArrow: true,
        title: Text(
          'Addresses',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(USizes.defaultSpace),
          child: Column(
            children: [
              SingleAddress(selectedAddress: true),
              SingleAddress(selectedAddress: false),
            ],
          ),
        ),
      ),
    );
  }
}
