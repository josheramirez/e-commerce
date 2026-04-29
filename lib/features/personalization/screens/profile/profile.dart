import 'package:e_commerce/common/images/circular_image.dart';
import 'package:e_commerce/common/widgets/appBar/appbar.dart';
import 'package:e_commerce/features/shop/screens/home/home.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UAppBar(
        showBackArrow: true,
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(USizes.defaultSpace),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    CircularImage(image: Images.user, width: 80, height: 80),
                    TextButton(onPressed: (){}, child: Text('Change profile Picture'))
                  ],
                ),
              ),

              // Details
              SizedBox(height: USizes.spaceBtwItems / 2 ),
              Divider(),
              SizedBox(height: USizes.spaceBtwItems),
              SectionHeading(title: 'Profile Information', showActionButton: false),
              SizedBox(height: USizes.spaceBtwItems),
              ProfileMenu(title: 'Name', value: "writh with T", onPressed: (){}),
              ProfileMenu(title: 'Username', value: "writh with T", onPressed: (){}),
              SizedBox(height: USizes.spaceBtwItems),
              Divider(),
              SizedBox(height: USizes.spaceBtwItems),
              
              
              SectionHeading(title: 'Personal Information', showActionButton: false),
              SizedBox(height: USizes.spaceBtwItems),
              ProfileMenu(title: 'User Id', value: "writh with T", onPressed: (){}, icon: Iconsax.copy_copy,),
              ProfileMenu(title: 'Email', value: "writh with T", onPressed: (){}),
              ProfileMenu(title: 'Phone Number', value: "writh with T", onPressed: (){}),
              ProfileMenu(title: 'Gender', value: "writh with T", onPressed: (){}),
              ProfileMenu(title: 'Date of Birth', value: "writh with T", onPressed: (){}),
              Divider(),
              SizedBox(height: USizes.spaceBtwItems),

              Center(
                child: TextButton(
                  onPressed: (){}, 
                  child: Text('Close Account', style: TextStyle(color: Colors.red)),
                ),
              )
            ],
          ),  
        ),
      ),
    );
  }
}

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    super.key, this.icon = Iconsax.arrow_right_3_copy, required this.onPressed, required this.title, required this.value,
  });

  final IconData icon;
  final VoidCallback onPressed;
  final String title, value;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: USizes.spaceBtwItems / 1.5),
        child: Row(
          children: [
            Expanded(flex: 3, child: Text(title, style: Theme.of(context).textTheme.bodySmall, overflow: TextOverflow.ellipsis)),
            Expanded(flex: 5, child: Text(value, style: Theme.of(context).textTheme.bodyMedium, overflow: TextOverflow.ellipsis)),
            Expanded(child: Icon(icon, size: 18)),
          ],
        ),
      ),
    );
  }
}