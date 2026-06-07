import 'package:e_commerce/common/widgets/commmo_shapes/containers/rounded_container.dart';
import 'package:e_commerce/common/widgets/products/ratings/rating_indicator.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(backgroundImage: AssetImage(Images.user)),
                SizedBox(width: USizes.spaceBtwItems),
                Text('Jhon Doe', style: Theme.of(context).textTheme.titleMedium),
              ],
            ),
            IconButton(onPressed: (){}, icon: Icon(Icons.more_vert)),
          ],
        ),
        SizedBox(height: USizes.spaceBtwItems),

        // Review
        Row(
          children: [
            URatingBarIndicator(rating: 4),
            SizedBox(width: USizes.spaceBtwItems),
            Text('01 Nov, 2023', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        SizedBox(height: USizes.spaceBtwItems),
        ReadMoreText(
          'The user interface is very intituivem I was able to purchase in a better price in other place,The user interface is very intituivem I was able to purchase in a better price in other place, The user interface is very intituivem I was able to purchase in a better price in other place ',
          trimLines: 2,
          trimExpandedText: 'show less',
          trimCollapsedText: 'show more',
          trimMode: TrimMode.Line,
          moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: UColors.primary),
          lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: UColors.primary),
        ),
        SizedBox(height:  USizes.spaceBtwItems),

        // Company Review
        URoundedContainer(
          backgroundColor: UColors.grey,
          child: Padding(
            padding: EdgeInsets.all(USizes.md),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Figure Store', style: Theme.of(context).textTheme.titleMedium),
                    Text('02 Nov, 2024', style: Theme.of(context).textTheme.bodyMedium),
                  ],
                ),
                SizedBox(height: USizes.spaceBtwItems),
                ReadMoreText(
                  'The user interface is very intituivem I was able to purchase in a better price in other place,The user interface is very intituivem I was able to purchase in a better price in other place, The user interface is very intituivem I was able to purchase in a better price in other place ',
                  trimLines: 2,
                  trimExpandedText: 'show less',
                  trimCollapsedText: 'show more',
                  trimMode: TrimMode.Line,
                  moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: UColors.primary),
                  lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: UColors.primary),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: USizes.spaceBtwSections),
      ],
    );
  }
}