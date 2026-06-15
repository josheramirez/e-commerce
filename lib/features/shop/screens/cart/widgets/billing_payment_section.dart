import 'package:e_commerce/common/widgets/commmo_shapes/containers/rounded_container.dart';
import 'package:e_commerce/features/shop/screens/home/home.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class BillingPaymentSection extends StatelessWidget {
  const BillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    // final dark = HelperFunctions.isDarkMode(context),
    final dark = false;
    return Column(
      children: [
        SectionHeading(title: 'Payment Method', buttonTitle: 'Change', onPressed: (){}),
        SizedBox(height: USizes.spaceBtwItems / 2),
        Row(
          children: [
            URoundedContainer(
              width: 60,
              height: 35,
              backgroundColor: dark ? UColors.light : UColors.white,
              padding: EdgeInsets.all(USizes.sm),
              child: Image(image: AssetImage(Images.paypal), fit:  BoxFit.contain),
            ),
            SizedBox(width: USizes.spaceBtwItems / 2),
            Text('Paypal', style: Theme.of(context).textTheme.bodyLarge),
          ],
        )
      ],
    );
  }
}