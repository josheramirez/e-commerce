import 'package:e_commerce/common/widgets/appBar/appbar.dart';
import 'package:e_commerce/common/widgets/products/cart/cart_counter_icon.dart';
import 'package:e_commerce/common/widgets/shimmer/shimmer_effect.dart';
import 'package:e_commerce/data/repositories/user/user_repository.dart';
import 'package:e_commerce/features/personalization/controllers/user_controller.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeAppbar extends StatelessWidget {
  const HomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    
    return UAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Good Morning", style: Theme.of(context).textTheme.labelMedium!.apply(color: UColors.grey)),
          Obx(() {
            if (controller.profileLoading.value) {
              // Display a shimer loader while user profile is being loaded
              return const ShimmerEffect(width: 80, height: 15);
            }else{
              return Text(controller.user.value.fullName, style: Theme.of(context).textTheme.headlineSmall!.apply(color: UColors.white));
            }
            }
          ),
        
        ],
      ),
      actions: [CardCounterIcon(onPressed: () {}, iconColor: UColors.white)],
    );
  }
}
