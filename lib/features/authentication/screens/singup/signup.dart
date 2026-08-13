import 'package:e_commerce/common/widgets/login_signup/form_divider.dart';
import 'package:e_commerce/common/widgets/login_signup/social_buttons.dart';
import 'package:e_commerce/features/authentication/controllers/signup/signup_controller.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/constants/texts.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:e_commerce/utils/validators/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/string_extensions.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class SingupScreen extends StatelessWidget {
  const SingupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(USizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Text
              Text(
                UTexts.signupTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(height: USizes.spaceBtwSections),

              // Form
              SignupForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class SignupForm extends StatelessWidget {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    final controller = Get.put(SignupController());

    return Form(
      key: controller.signupFormKey,
      child: Column(
        children: [

          // First and Last Name
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller.firstName,
                  validator: (value) =>
                      Validator.validateEmptyText('First name', value),
                  expands: false,
                  decoration: InputDecoration(
                    labelText: UTexts.firstName,
                    prefixIcon: Icon(Iconsax.user_copy),
                  ),
                ),
              ),
              SizedBox(width: USizes.spaceBtwInputFields),
              Expanded(
                child: TextFormField(
                  controller: controller.lastName,
                  validator: (value) =>
                      Validator.validateEmptyText('Last name', value),
                  expands: false,
                  decoration: InputDecoration(
                    labelText: UTexts.lastName,
                    prefixIcon: Icon(Iconsax.user_copy),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: USizes.spaceBtwInputFields),

          // Username
          TextFormField(
            controller: controller.username,
            validator: (value) =>
                Validator.validateEmptyText('Username', value),
            expands: false,
            decoration: InputDecoration(
              labelText: "Username",
              prefixIcon: Icon(Iconsax.user_edit_copy),
            ),
          ),
          SizedBox(height: USizes.spaceBtwInputFields),

          // Email
          TextFormField(
            controller: controller.email,
            validator: (value) => Validator.validateEmail(value),
            expands: false,
            decoration: InputDecoration(
              labelText: "Email",
              prefixIcon: Icon(Iconsax.direct_copy),
            ),
          ),
          SizedBox(height: USizes.spaceBtwInputFields),

          // Phone number
          TextFormField(
            controller: controller.phoneNumber,
            validator: (value) => Validator.validatePhoneNumber(value),
            expands: false,
            decoration: InputDecoration(
              labelText: UTexts.phoneNumber,
              prefixIcon: Icon(Iconsax.call_copy),
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
          SizedBox(height: USizes.spaceBtwSections),

          // Term and condition checkbox
          Row(
            children: [
              SizedBox(
                width: 24,
                height: 24,
                child: Obx(
                  () => Checkbox(
                  value: controller.privacyPolicy.value, 
                  onChanged: (value) => controller.privacyPolicy.value = !controller.privacyPolicy.value
                  )
                ),
              ),
              SizedBox(width: USizes.spaceBtwItems),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: '${UTexts.iAgreeTo} ',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    TextSpan(
                      text: UTexts.privacyPolicy,
                      style: Theme.of(context).textTheme.bodyMedium!.apply(
                        color: dark ? UColors.white : UColors.primary,
                        decoration: TextDecoration.underline,
                        decorationColor: dark ? UColors.white : UColors.primary,
                      ),
                    ),
                    TextSpan(
                      text: ' ${UTexts.and} ',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    TextSpan(
                      text: UTexts.termsOfUse,
                      style: Theme.of(context).textTheme.bodyMedium!.apply(
                        color: dark ? UColors.white : UColors.primary,
                        decoration: TextDecoration.underline,
                        decorationColor: dark ? UColors.white : UColors.primary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: USizes.spaceBtwSections),

          // Sign Up Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => controller.signup(),
              child: Text(UTexts.createAccount),
            ),
          ),
          SizedBox(height: USizes.spaceBtwSections),

          // Divider
          FormDivider(dividerText: UTexts.orSignInWith.capitalize!),
          SizedBox(height: USizes.spaceBtwSections),

          // Social Buttons
          SocialButtons(),
        ],
      ),
    );
  }
}
