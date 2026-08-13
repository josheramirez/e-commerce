import 'package:e_commerce/common/widgets/login_signup/form_divider.dart';
import 'package:e_commerce/common/widgets/login_signup/social_buttons.dart';
import 'package:e_commerce/features/authentication/controllers/login/login_controller.dart';
import 'package:e_commerce/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:e_commerce/features/authentication/screens/singup/signup.dart';
import 'package:e_commerce/navigation_menu.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/constants/texts.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:e_commerce/utils/validators/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    final controller = Get.put(LoginController());

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: USizes.appBarHeight,
            left: USizes.defaultSpace,
            bottom: USizes.defaultSpace,
            right: USizes.defaultSpace,
          ),
          child: Column(    
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Logo
                  Image(
                    height: 150,
                    image: AssetImage(
                      dark ? Images.logoAppWhite : Images.logoAppBlack,
                    ),
                  ),
                  SizedBox(height: USizes.spaceBtwItems),

                  // Text
                  Text(
                    UTexts.loginTitle,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  SizedBox(height: USizes.sm),
                  Text(
                    UTexts.loginSubTitle,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
              SizedBox(height: USizes.spaceBtwSections),

              // Form
              Form(
                key: controller.loginFormKey,
                child: Column(
                  children: [
                    // Email
                    TextFormField(
                      controller: controller.email,
                      validator: (value) => Validator.validateEmail(value),
                      decoration: InputDecoration(
                        prefixIcon: Icon(Iconsax.direct_right_copy),
                        labelText: UTexts.email,
                      ),
                    ),
                    SizedBox(height: USizes.spaceBtwInputFields),

                    // Password
                    Obx(
                      () => TextFormField(
                        controller: controller.password,
                        validator: (value) => Validator.validatePassword(value),
                        obscureText: controller.hidePassword.value,
                        expands: false,
                        decoration: InputDecoration(
                          labelText: UTexts.password,
                          prefixIcon: Icon(Iconsax.password_check_copy),
                          suffixIcon: IconButton(
                            onPressed: () => controller.hidePassword.value = !controller.hidePassword.value, 
                            icon: Icon(controller.hidePassword.value ? Iconsax.eye_slash_copy : Iconsax.eye_copy)
                          )
                        ),
                      ),
                    ),
                    SizedBox(height: USizes.spaceBtwInputFields / 2),

                    // Remember Me & Forgot Password
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Obx(
                              () => Checkbox( 
                                value: controller.rememberMe.value, 
                                onChanged: (value) => controller.rememberMe.value = !controller.rememberMe.value
                              ),
                            ),
                            Text(UTexts.rememberMe),
                          ],
                        ),

                        // Forgot Password
                        TextButton(
                          onPressed: () => Get.to(() => ForgetPasswordScreen()),
                          child: Text(UTexts.forgetPassword),
                        ),
                      ],
                    ),
                    SizedBox(height: USizes.spaceBtwSections),

                    // Sign In Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => controller.emailAndPasswordSignIn(),
                        child: Text(UTexts.signIn),
                      ),
                    ),
                    SizedBox(height: USizes.spaceBtwItems),

                    // Create Account Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => Get.to(() => SingupScreen()),
                        child: Text(UTexts.createAccount),
                      ),
                    ),
                    SizedBox(height: USizes.spaceBtwSections),
                  ],
                ),
              ),

              // Divider
              FormDivider(dividerText: UTexts.orSignInWith.capitalize!),
              SizedBox(height: USizes.spaceBtwSections),

              // Footer
              SocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
