import 'package:e_commerce/features/authentication/controllers/forget_password/forget_password_controller.dart';
import 'package:e_commerce/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/constants/texts.dart';
import 'package:e_commerce/utils/validators/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());
    
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(USizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Heading
            Text(
              UTexts.forgetPasswordTitle,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: USizes.spaceBtwItems),
            Text(
              UTexts.forgetPasswordSubTitle,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(height: USizes.spaceBtwSections * 2),

            // Text field
            Form(
              key: controller.forgetPasswordFormKey,
              child: TextFormField(
                controller: controller.email,
                validator: Validator.validateEmail,
                decoration: InputDecoration(
                  labelText: UTexts.email,
                  prefixIcon: Icon(Iconsax.direct_right_copy),
                ),
              ),
            ),
            const SizedBox(height: USizes.spaceBtwSections),

            // Submit Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.sendPasswordResetMail(),
                child: Text(UTexts.submit),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
