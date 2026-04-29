import 'package:e_commerce/common/images/circular_image.dart';
import 'package:e_commerce/common/widgets/appBar/appbar.dart';
import 'package:e_commerce/common/widgets/commmo_shapes/containers/primary_header_container.dart';
import 'package:e_commerce/common/widgets/list_tiles/settings_menu_tile.dart';
import 'package:e_commerce/features/personalization/screens/profile/profile.dart';
import 'package:e_commerce/features/shop/screens/home/home.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
        
            // Header
            UPrimaryHeaderContainer(
              child: Column(
                children: [
                  UAppBar(title: Text('Account' , style: Theme.of(context).textTheme.headlineMedium!.apply(color: UColors.white))),
                  
                  // User Profile Card
                  ListTile(
                    leading: const CircularImage(image: Images.user, width: 50, height: 50, padding: 0),
                    title: Text('Coding with T', style: Theme.of(context).textTheme.headlineSmall!.apply(color: UColors.white),),
                    subtitle: Text('datatalks@gmail.com', style: Theme.of(context).textTheme.bodyMedium!.apply(color: UColors.white),),
                    trailing: IconButton(onPressed: () => Get.to(() => ProfileScreen()) , icon: Icon(Iconsax.edit_copy, color: UColors.white,)),
                  ),
                  SizedBox(height: USizes.spaceBtwSections),
        
                ],
              )
            ),
            
            // Body
            Padding(
              padding: EdgeInsets.all(USizes.defaultSpace),
              child: Column(
                children: [
                  
                  // Account Settings 
                  SectionHeading(title: 'Account Settings', showActionButton: false),
                  SizedBox(height: USizes.spaceBtwItems),
                  SettingsMenuTile(icon: Iconsax.safe_home_copy, title: 'My Address', subtitle: 'Set Shopping delivery address'),
                  SettingsMenuTile(icon: Iconsax.shopping_cart_copy, title: 'My Cart', subtitle: 'Add, remove products and move to checkout'),
                  SettingsMenuTile(icon: Iconsax.bag_tick_copy, title: 'My Orders', subtitle: 'In progress and Completed Orders'),
                  SettingsMenuTile(icon: Iconsax.bank_copy, title: 'Bank Account', subtitle: 'Withdraw balance to registered bank account'),
                  SettingsMenuTile(icon: Iconsax.discount_shape_copy, title: 'My Coupons', subtitle: 'List of all the discounted coupons'),
                  SettingsMenuTile(icon: Iconsax.notification_copy, title: 'Notifications', subtitle: 'Set any kind of notification message'),
                  SettingsMenuTile(icon: Iconsax.security_card_copy, title: 'Account Privacy', subtitle: 'Manage data usage and connected accounts'),
        
                  // App Settings
                  SizedBox(height: USizes.spaceBtwSections),
                  SectionHeading(title: 'App Settings', showActionButton: false),
                  SettingsMenuTile(icon: Iconsax.document_upload_copy, title: 'Load Data', subtitle: 'Upload Data to your Cloud Firebase'),
                  SettingsMenuTile(icon: Iconsax.location_copy, title: 'Geolocation', subtitle: 'Set recommendation based on location', trailing: Switch(value: true, onChanged: (value) {})),
                  SettingsMenuTile(icon: Iconsax.security_user_copy, title: 'Safe Mode', subtitle: 'Search result is safe for all ages', trailing: Switch(value: true, onChanged: (value) {})),
                  SettingsMenuTile(icon: Iconsax.safe_home_copy, title: 'HD Image Quality', subtitle: 'Set image quality to be seen', trailing: Switch(value: true, onChanged: (value) {})),
              
                  
                  // Logout Buttom
                  SizedBox(height: USizes.spaceBtwSections),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: OutlinedButton(onPressed: (){}, child: Text('Logout'),
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                      ),
                    ),
                  ),
                  SizedBox(height: USizes.spaceBtwItems * 2.5)
        
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}