import 'package:e_commerce/data/repositories/authentication/authentication_repository.dart';
import 'package:e_commerce/features/authentication/controllers/signup/verify_email_controller.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/constants/texts.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key, this.email});

  final String? email;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());

    return Scaffold(
      // The close icon in the app bar is used to log out the user and redirect them to the login screen
      // this approach is taken to handle scenarios where the user enters the registration process
      // and the data is tored. Upon reopening the app, it checks if the mail is verified.
      // If not verified, the app always navigates to the verification screen.

      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => AuthenticationRepository.instance.logout(),
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
              Image(image: AssetImage(Images.mailSentImage), width: HelperFunctions.screenWidth() * 0.6),
              SizedBox(height: USizes.spaceBtwItems),

              // Title and subtitle
              Text(UTexts.verifyEmailTitle, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center),
              SizedBox(height: USizes.spaceBtwItems),
              
              Text(email ?? '', style: Theme.of(context).textTheme.labelLarge, textAlign: TextAlign.center),
              SizedBox(height: USizes.spaceBtwItems),
              
              Text(UTexts.verifyEmailSubTitle, style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center),
              SizedBox(height: USizes.spaceBtwItems),

              // Buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => controller.checkEmailVerificationStatus(),
                  child: Text(UTexts.uContinue),
                ),
              ),
              SizedBox(height: USizes.spaceBtwItems),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () => controller.sendEmailVerification(),
                  child: Text(UTexts.resendEmail),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
