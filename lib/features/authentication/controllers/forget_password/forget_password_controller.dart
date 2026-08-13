import 'package:e_commerce/data/repositories/authentication/authentication_repository.dart';
import 'package:e_commerce/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:e_commerce/utils/constants/loaders.dart';
import 'package:e_commerce/utils/helpers/network_manager.dart';
import 'package:e_commerce/utils/popups/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController{
  static ForgetPasswordController get instance => Get.find();

  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  sendPasswordResetMail() async{
    try {
      // Start Loading
      FullScreenLoader.openLoadingDialog("Processing your request...", Images.loadingAnimation);
      
      // Check Internet Connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }

            // Form Validation
      if(!forgetPasswordFormKey.currentState!.validate()){
        //Remove Loader
        FullScreenLoader.stopLoading(); 
        return;
      }

      // Send Email To Reset Password
      await AuthenticationRepository.instance.sendPasswordResetEmail(email.text.trim());

      // Remove Loader
      FullScreenLoader.stopLoading();

      // Show Success Screen
      Loaders.successSnackBar(title: "Email Sent", message: "Email Link Sent to Reset your Password".tr);

      // Redirect
      Get.to(() => ResetPasswordScreen(email: email.text.trim()));
      
    } catch (e) {
      // Remove Loader
      FullScreenLoader.stopLoading();
      Loaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

  resendPasswordResetEmail(String email) async{
      try {
        // Start Loading
        FullScreenLoader.openLoadingDialog("Processing your request...", Images.loadingAnimation);
        
        // Check Internet Connection
        final isConnected = await NetworkManager.instance.isConnected();
        if (!isConnected) {
          FullScreenLoader.stopLoading();
          return;
        }

        // Send Email To Reset Password
        await AuthenticationRepository.instance.sendPasswordResetEmail(email);
        
        // Remove Loader
        FullScreenLoader.stopLoading();

        // Show Success Screen
        Loaders.successSnackBar(title: "Email Sent", message: "Email Link Sent to Reset your Password".tr);

        
        } catch (e) {
          // Remove Loader
          FullScreenLoader.stopLoading();
          Loaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
      }


  }
}