import 'package:e_commerce/common/widgets/appBar/appbar.dart';
import 'package:e_commerce/features/personalization/controllers/update_name_controller.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/constants/texts.dart';
import 'package:e_commerce/utils/validators/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class ChangeNameScreen extends StatelessWidget {
  const ChangeNameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateNameController());

    return Scaffold(
      appBar: UAppBar(
        showBackArrow: true,
        title: Text('Change Name', style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: Padding(
        padding: EdgeInsets.all(USizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Use real name for easy verification. this name will appear on several pages.',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            SizedBox(height: USizes.spaceBtwSections),

            Form(
              key: controller.updateUserNameFormKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: controller.firstName,
                    validator: (value) => Validator.validateEmptyText('First name', value),
                    expands: false,
                    decoration: InputDecoration(labelText: UTexts.firstName, prefixIcon: Icon(Iconsax.user_copy)),
                  ),
                  SizedBox(height: USizes.spaceBtwInputFields),
                  TextFormField(
                    controller: controller.lastName,
                    validator: (value) => Validator.validateEmptyText('Last name', value),
                    expands: false,
                    decoration: InputDecoration(labelText: UTexts.lastName, prefixIcon: Icon(Iconsax.user_copy)),
                  )
                ],
              )
            ),
            SizedBox(height: USizes.spaceBtwSections),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: () => controller.updateUserName(), child: Text('Save')),
            ),
            
          ],
        ),
        ),
    );
  }
}