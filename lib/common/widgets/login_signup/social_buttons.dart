import 'package:e_commerce/features/authentication/controllers/login/login_controller.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SocialButtons extends StatelessWidget {
  const SocialButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: UColors.grey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            onPressed: () => controller.googleSignIn(),
            icon: Image(
              image: AssetImage(Images.googleIcon),
              height: USizes.iconMd,
              width: USizes.iconMd,
            ),
          ),
        ),

        SizedBox(width: USizes.spaceBtwItems),

        Container(
          decoration: BoxDecoration(
            border: Border.all(color: UColors.grey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            onPressed: () {},
            icon: Image(
              image: AssetImage(Images.facebookIcon),
              height: USizes.iconMd,
              width: USizes.iconMd,
            ),
          ),
        ),
      ],
    );
  }
}
