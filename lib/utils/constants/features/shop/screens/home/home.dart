import 'package:e_commerce/common/widgets/circular_container.dart';
import 'package:e_commerce/common/widgets/primary_header_container.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/device_helpers.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:iconsax_flutter/iconsax_flutter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: UPrimaryHeaderContainer(
        child: Column(
          children: [UAppBar(title:"cositas")],
        ),
      ),
    );
  }
}

class UAppBar extends StatelessWidget implements PreferredSizeWidget{
  // const UAppBar({super.key, this.title, this.showBackArrow = false, this.leadingIcon, this.actions, this.leadingOnPressed});

  // final Widget? title;
  // final bool showBackArrow;
  // final IconData? leadingIcon;
  // final List<Widget>? actions;
  // final VoidCallback? leadingOnPressed;

  // @override
  // Widget build(BuildContext context) {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(horizontal: USizes.md),
  //     child: AppBar(
  //       automaticallyImplyLeading: false,

  //       // Leading
  //       leading: showBackArrow
  //         ? IconButton(onPressed : () => Get.back(), icon: Icon(Iconsax.arrow_left)) 
  //         : leadingIcon != null 
  //           ? IconButton(onPressed: leadingOnPressed, icon: Icon(leadingIcon))
  //           :null,
  //       title: title,
  //       actions: actions,
  //     ),
  //   );
  // }
  
  // @override
  // Size get preferredSize => Size.fromHeight(UDeviceHelper.getAppBarHeight());
    final String title;

  const UAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      // Add your customizations here
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight); // Default height
  // Or a custom height:
  // Size get preferredSize => Size.fromHeight(100.0); 

}