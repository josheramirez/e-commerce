import 'package:e_commerce/features/personalization/controllers/user_controller.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/constants/texts.dart';
import 'package:e_commerce/utils/validators/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class ReAuthentificateLoginForm extends StatelessWidget {
  const ReAuthentificateLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: AppBar(title: Text('Re-Authenticate User')),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(USizes.defaultSpace),
          child: Form(
            key: controller.reAuthFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Email
                TextFormField(
                  controller: controller.verifyEmail,
                  validator: Validator.validateEmail,
                  decoration: InputDecoration(prefixIcon: Icon(Iconsax.direct_right_copy), labelText: UTexts.email)
                ),
                SizedBox(height: USizes.spaceBtwInputFields),

                // Password
                Obx(
                  () => TextFormField(
                    obscureText: controller.hidePassword.value,
                    controller: controller.verifyPassword,
                    validator: (value) => Validator.validateEmptyText('Password', value),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Iconsax.password_check_copy), 
                      labelText: UTexts.password,
                      suffixIcon: IconButton(
                        onPressed: () => controller.hidePassword.value = !controller.hidePassword.value, 
                        icon: Icon(Iconsax.eye_slash_copy)
                      )
                      ),
                  ),
                ),
                SizedBox(height: USizes.spaceBtwInputFields),

                // Login Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => controller.reAuthenticateEmailAndPasswordUser(),
                    child: Text('Verify'),
                  ),
                )
              ],
            )
          ),
        ),
      ),
    );
  }
}