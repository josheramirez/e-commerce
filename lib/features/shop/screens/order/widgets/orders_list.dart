import 'package:e_commerce/common/widgets/commmo_shapes/containers/rounded_container.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class OrdersListItems extends StatelessWidget {
  const OrdersListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 10,
      separatorBuilder: (_, __) => SizedBox(height: USizes.spaceBtwItems),
      itemBuilder: (_, index) => URoundedContainer(
        showBorder: true,
        padding: EdgeInsets.all(USizes.md),
        backgroundColor: dark ? UColors.dark : UColors.light,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
      
            // Progress
            Row(
              children: [
                Icon(Iconsax.ship_copy),
                SizedBox(width: USizes.spaceBtwItems / 2),
      
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Processing',
                        style: Theme.of(context).textTheme.bodyLarge!.apply(color: UColors.primary, fontWeightDelta: 1),
                      ),
                      Text('07 Nov 2024', style: Theme.of(context).textTheme.bodyLarge),
                    ],
                  ),
                ),
      
                // Icon
                IconButton(onPressed: (){}, icon: Icon(Iconsax.arrow_right_3_copy, size: USizes.iconSm)),
              ],
            ),
            SizedBox(height: USizes.spaceBtwItems),
      
            // 
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Icon(Iconsax.tag_copy),
                      SizedBox(width: USizes.spaceBtwItems / 2),
                      Expanded(
                        child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Order',style: Theme.of(context).textTheme.labelMedium),
                                Text('#34334f2', style: Theme.of(context).textTheme.titleMedium),
                              ],
                       )
                      )
                    ],
                  )
                ),
      
                              Expanded(
                  child: Row(
                    children: [
                      Icon(Iconsax.calendar_copy),
                      SizedBox(width: USizes.spaceBtwItems / 2),
                      Expanded(
                        child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Order',style: Theme.of(context).textTheme.labelMedium),
                                Text('#34334f2', style: Theme.of(context).textTheme.titleMedium),
                              ],
                       )
                      )
                    ],
                  )
                )
      
              ],
            ),
          ],
        ),
      ),
    );
  }
}