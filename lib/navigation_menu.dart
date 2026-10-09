import 'package:e_commerce/dummy_data.dart';
import 'package:e_commerce/features/authentication/models/user_model.dart';
import 'package:e_commerce/features/personalization/screens/settings/settings.dart';
import 'package:e_commerce/features/shop/models/post_model.dart';
import 'package:e_commerce/features/shop/models/product_market_model.dart';
import 'package:e_commerce/features/shop/screens/comments/comment_screen.dart';
import 'package:e_commerce/features/shop/screens/product_market/product_market_screen.dart';
import 'package:e_commerce/features/shop/screens/store/store.dart';
import 'package:e_commerce/features/shop/screens/wishlist/wishlist.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/features/shop/screens/home/home.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());

    return Scaffold(
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
      bottomNavigationBar: Obx(
        () => NavigationBar(
          elevation: 0,
          backgroundColor: UColors.light,
          indicatorColor: UColors.black.withValues(alpha: 0.1),
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) {
            controller.selectedIndex.value = index;
          },
          destinations: [
            const NavigationDestination(
              icon: Icon(Iconsax.home),
              label: 'Home',
            ),
            const NavigationDestination(
              icon: Icon(Iconsax.shop),
              label: 'Store',
            ),
            // const NavigationDestination(icon: Icon(Iconsax.heart), label: 'WishList'),
            const NavigationDestination(
              icon: Icon(Iconsax.user),
              label: 'Products',
            ),
            // const NavigationDestination(icon: Icon(Iconsax.user), label: 'Comments'),
            const NavigationDestination(
              icon: Icon(Iconsax.user),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}

class NavigationController extends GetxController {
  RxInt selectedIndex = 0.obs;

  List<Widget> screens = [
    HomeScreen(),
    StoreScreen(),
    ProductMarketScreen(),
    // WishlistScreen(),
    // CommentScreen(product: ProductMarketModel(
    //   id: '1',
    //   image: Images.productMarket1,
    //   name: 'arroz grado 2',
    //   quantity: '1 Kg',
    //   price: 900,
    //   store: DummyData.stores[0],
    //   updateDate: DateTime.now(),
    //   post: PostModel(
    //     id: '01',
    //     user: UserModel(
    //       id: '222',
    //       firstName: 'joshe',
    //       lastName: 'ramirez',
    //       username: 'el_Pulento',
    //       email: 'joselo@gmail.com',
    //       phoneNumber: '123123123',
    //       profilePicture: '',
    //     ),
    //     productId: '1',
    //     price: 300,
    //     store: DummyData.stores[0],
    //     comment: '222',
    //     negativeFeedback: 234,
    //     positiveFeedback: 1122
    //   )
    // ),)
    SettingsScreen(),
  ];
}
