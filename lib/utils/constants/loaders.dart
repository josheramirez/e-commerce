import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class Loaders {
  
  static customToast({required message}){
    ScaffoldMessenger.of(Get.context!).showSnackBar(
        SnackBar(
          elevation: 0,
          duration: const Duration(seconds: 3),
          backgroundColor: Colors.transparent,
          content: Container(
            padding: const EdgeInsets.all(12.0),
            margin: const EdgeInsets.symmetric(horizontal: 30.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: HelperFunctions.isDarkMode(Get.context!) ? UColors.darkerGrey.withValues(alpha: 0.9) : UColors.grey.withValues(alpha: 0.9)
            ),
            child: Center(child: Text(message,style: Theme.of(Get.context!).textTheme.labelLarge,),),
          ),
        )
    );
  }

  /// Warning Orange Snack bar
  static warningSnackBar({required title, message = ''}) {
    Get.snackbar(title, message,
        isDismissible: true,
        shouldIconPulse: true,
        colorText: UColors.white,
        backgroundColor: Colors.orange,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
        margin: const EdgeInsets.all(20),
        icon: const Icon(Iconsax.warning_2, color: UColors.white));
  }

  /// Success Green Snack bar
  static successSnackBar({required title, message = '', duration = 3}) {
    Get.snackbar(title, message,
        isDismissible: true,
        shouldIconPulse: true,
        colorText: UColors.white,
        backgroundColor: UColors.primary,
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: duration),
        margin: const EdgeInsets.all(10),
        icon: const Icon(Iconsax.check, color: UColors.white));
  }

  /// Error Red Snack bar
  static errorSnackBar({required title, message = ''}) {
    Get.snackbar(title, message,
        isDismissible: true,
        shouldIconPulse: true,
        colorText: UColors.white,
        backgroundColor: Colors.red.shade600,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
        margin: const EdgeInsets.all(20),
        icon: const Icon(Iconsax.warning_2, color: UColors.white));
  }
}