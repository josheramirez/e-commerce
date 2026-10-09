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
import 'package:e_commerce/utils/constants/texts_spanish.dart';
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
            top: 35,
            left: USizes.defaultSpace,
            bottom: 10,
            right: USizes.defaultSpace,
          ),
          child: Container(
            // color: Colors.amber,
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
                    SizedBox(height: 15),

                    // Text
                    Text(
                      TextsSpanish.loginTitle,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    SizedBox(height: 0),
                    Text(
                      TextsSpanish.loginSubTitle,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                SizedBox(height: 15),

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
                          validator: (value) =>
                              Validator.validatePassword(value),
                          obscureText: controller.hidePassword.value,
                          expands: false,
                          decoration: InputDecoration(
                            labelText: UTexts.password,
                            prefixIcon: Icon(Iconsax.password_check_copy),
                            suffixIcon: IconButton(
                              onPressed: () => controller.hidePassword.value =
                                  !controller.hidePassword.value,
                              icon: Icon(
                                controller.hidePassword.value
                                    ? Iconsax.eye_slash_copy
                                    : Iconsax.eye_copy,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),

                      // Remember Me & Forgot Password
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Obx(
                                () => Checkbox(
                                  value: controller.rememberMe.value,
                                  onChanged: (value) =>
                                      controller.rememberMe.value =
                                          !controller.rememberMe.value,
                                ),
                              ),
                              Text(TextsSpanish.rememberMe),
                            ],
                          ),

                          // Forgot Password
                          TextButton(
                            onPressed: () =>
                                Get.to(() => ForgetPasswordScreen()),
                            child: Text(TextsSpanish.forgetPassword),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),

                      // Sign In Button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            // backgroundColor: Colors.indigo,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              side: const BorderSide(
                                color: Colors.blueGrey,
                                width: 1.5,
                              ), // Change your radius here
                            ),
                            // fixedSize: const Size(120, 30),
                            // padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0) ,// Size(width, height)
                            minimumSize: const Size(120, 45),

                            // 2. Reduce the padding inside the button
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 4,
                            ),

                            // 3. Optional: shrink text to fit the smaller button
                            textStyle: const TextStyle(fontSize: 13),
                          ),
                          onPressed: () => controller.emailAndPasswordSignIn(),
                          child: Text(
                            UTexts.signIn,
                            style: TextStyle(
                              fontSize: 18, // Custom text size
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),

                      // Create Account Button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            // backgroundColor: Colors.indigo,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              side: const BorderSide(
                                color: Colors.blueGrey,
                                width: 1.5,
                              ), // Change your radius here
                            ),
                            // fixedSize: const Size(120, 30),
                            // padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0) ,// Size(width, height)
                            minimumSize: const Size(120, 45),

                            // 2. Reduce the padding inside the button
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 4,
                            ),

                            // 3. Optional: shrink text to fit the smaller button
                            textStyle: const TextStyle(fontSize: 13),
                          ),
                          onPressed: () => Get.to(() => SignupScreen()),
                          child: Text(
                            TextsSpanish.createAccount,
                            style: TextStyle(
                              fontSize: 18, // Custom text size
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),

                // Divider
                FormDivider(dividerText: TextsSpanish.orSignInWith.capitalize!),
                SizedBox(height: 15),

                // [GOOGLE - FACEBOOK]
                SocialButtons(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
