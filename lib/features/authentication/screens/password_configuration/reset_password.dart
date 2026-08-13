import 'package:e_commerce/features/authentication/controllers/forget_password/forget_password_controller.dart';
import 'package:e_commerce/features/authentication/screens/login/login.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/constants/texts.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => Get.back(),
            icon: Icon(CupertinoIcons.clear),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(USizes.defaultSpace),
          child: Column(
            children: [

              // Image
              Image(
                image: AssetImage(Images.mailSentImage),
                width: HelperFunctions.screenWidth() * 0.6,
              ),
              const SizedBox(height: USizes.spaceBtwSections),

              /// Title % Subtitle\
              Text(email, style: Theme.of(context).textTheme.bodyMedium, textAlign: TextAlign.center),
              const SizedBox(height: USizes.spaceBtwItems),

              Text(UTexts.resendEmail,style: Theme.of(context).textTheme.headlineMedium,textAlign: TextAlign.center),
              const SizedBox(height: USizes.spaceBtwItems),

              Text(
                UTexts.resetPasswordSubTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: USizes.spaceBtwSections),

              /// Button Done
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Get.offAll(() => LoginScreen()),
                  child: const Text(UTexts.done),
                ),
              ),
              
              /// Button Resend
              const SizedBox(height: USizes.spaceBtwItems),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () => ForgetPasswordController.instance.resendPasswordResetEmail(email),
                  child: const Text(UTexts.resendEmail),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
