import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/common/widgets/commmo_shapes/containers/rounded_container.dart';
import 'package:e_commerce/common/widgets/shimmer/shimmer_effect.dart';
import 'package:e_commerce/features/shop/models/brand_model.dart';
import 'package:e_commerce/features/shop/screens/brand/brand_products.dart';
import 'package:e_commerce/features/shop/screens/store/store.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BrandShowcase extends StatelessWidget {
  const BrandShowcase({super.key, required this.images, required this.brand});

  final BrandModel brand;
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(() => BrandProducts(brand: brand)),
      child: URoundedContainer(
        showBorder: true,
        borderColor: UColors.darkGrey,
        backgroundColor: Colors.transparent,
        padding: const EdgeInsets.all(USizes.md),
        margin: const EdgeInsets.only(bottom: USizes.spaceBtwItems),
        child: Column(
          children: [
            
            // Brand with Product Count
            BrandCard(showBorder: false, brand: brand),
      
            // Brand Top 3 Product Image
            Row(
              children: images
                  .map((image) => brandTopProductImageWidget(image, context))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget brandTopProductImageWidget(String image, context) {
    return Expanded(
      child: URoundedContainer(
        height: 100,
        backgroundColor: HelperFunctions.isDarkMode(context) ? UColors.darkGrey : UColors.white,
        margin: const EdgeInsets.only(right: USizes.sm),
        padding: const EdgeInsets.all(5),
        // child: Image(image: AssetImage(image), fit: BoxFit.contain),
        child: CachedNetworkImage(
          fit: BoxFit.contain,
          imageUrl: image,
          progressIndicatorBuilder:(context, url, progress) => const ShimmerEffect(width: 100, height: 100),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    );
  }
}
