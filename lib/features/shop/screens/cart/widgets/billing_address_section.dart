import 'package:e_commerce/features/shop/screens/home/home.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class BillingAddressSection extends StatelessWidget {
  const BillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeading(
          title: 'Shipping Address',
          buttonTitle: 'Change',
          onPressed: () {},
        ),
        Text(
          'Custom Text Shipping',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        SizedBox(height: USizes.spaceBtwItems / 2),

        Row(
          children: [
            Icon(Icons.phone, color: Colors.grey, size: 16),
            SizedBox(width: USizes.spaceBtwItems),
            Text(
              '+283 290929392',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        SizedBox(width: USizes.spaceBtwItems),

        Row(
          children: [
            Icon(Icons.location_history, color: Colors.grey, size: 16),
            SizedBox(width: USizes.spaceBtwItems),
            Expanded(
              child: Text(
                'Avebida siempreN VIVA',
                style: Theme.of(context).textTheme.bodyMedium,
                softWrap: true,
              ),
            ),
          ],
        ),
        SizedBox(width: USizes.spaceBtwItems),
      ],
    );
  }
}
