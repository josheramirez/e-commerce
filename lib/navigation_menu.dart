import 'package:e_commerce/utils/constants/colors.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';


class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());

    return Scaffold(
      body:  Obx(() => controller.screens[controller.selectedIndex.value]),
      bottomNavigationBar: Obx(
       () => NavigationBar(
          elevation: 0,
          backgroundColor: UColors.light,
          indicatorColor: UColors.black.withValues(alpha: 0.1),
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected:(index) {
            controller.selectedIndex.value = index;
          },
          destinations: [
            NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
            NavigationDestination(icon: Icon(Iconsax.shop), label: 'Store'),
            NavigationDestination(icon: Icon(Iconsax.heart), label: 'WishList'),
            NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile'),
          ]
        ),
      )
    );
  }
}

class NavigationController extends GetxController{
  RxInt selectedIndex = 0.obs;

  List<Widget> screens = [Container(color: Colors.red),Container(color: Colors.green),Container(color: Colors.blue),Container(color: Colors.orange)];
}