import 'package:e_commerce/common/widgets/appBar/appbar.dart';
import 'package:e_commerce/common/widgets/products/ratings/rating_indicator.dart';
import 'package:e_commerce/features/shop/screens/product_reviews/widgets/user_review_card.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/device_helpers.dart';
import 'package:flutter/material.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar
      appBar: UAppBar(title: Text('Reviews & Ratings'), showBackArrow: true),

      // Body
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(USizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Rating and reviews are verified and are from people who use the same type of device that you use.',
              ),
              SizedBox(height: USizes.spaceBtwItems),

              // Overall Product Ratings
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Text(
                      '4.9',
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                  ),
                  Expanded(
                    flex: 7,
                    child: Column(
                      children: [
                        RatingProgressIndicator(text: '5', value: 1),
                        RatingProgressIndicator(text: '4', value: 0.5),
                        RatingProgressIndicator(text: '3', value: 0.2),
                        RatingProgressIndicator(text: '2', value: 0.1),
                        RatingProgressIndicator(text: '1', value: 0.03),
                      ],
                    ),
                  ),
                ],
              ),
              URatingBarIndicator(rating: 2.5),
              Text('12.434', style: Theme.of(context).textTheme.bodySmall),
              SizedBox(height: USizes.spaceBtwSections),

              // User Reviews List
              UserReviewCard(),
              UserReviewCard(),
              UserReviewCard(),
              UserReviewCard(),
            ],
          ),
        ),
      ),
    );
  }
}

class RatingProgressIndicator extends StatelessWidget {
  const RatingProgressIndicator({
    super.key,
    required this.text,
    required this.value,
  });

  final String text;
  final double value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Text(text, style: Theme.of(context).textTheme.bodyMedium),
        ),
        Expanded(
          flex: 11,
          child: SizedBox(
            width: UDeviceHelper.getScreenWidth(context) * 0.8,
            child: LinearProgressIndicator(
              value: value,
              minHeight: 10,
              backgroundColor: UColors.grey,
              borderRadius: BorderRadius.circular(7),
              valueColor: AlwaysStoppedAnimation(UColors.primary),
            ),
          ),
        ),
      ],
    );
  }
}
