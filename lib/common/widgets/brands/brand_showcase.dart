import 'package:e_commerce/common/widgets/commmo_shapes/containers/rounded_container.dart';
import 'package:e_commerce/features/shop/screens/store/store.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class BrandShowcase extends StatelessWidget {
  const BrandShowcase({
    super.key, required this.images,
  });

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return URoundedContainer(
      padding: EdgeInsets.only(right: USizes.md,left: USizes.md, bottom: USizes.md),
      showBorder: true,
      borderColor: UColors.darkGrey,
      backgroundColor: Colors.transparent,
      margin: const EdgeInsets.only(bottom: USizes.spaceBtwItems),
      child: Column(
        children: [
          // Brand with Product Count
          BrandCard(showBorder: false,),
    
          // Brand Top 3 Product Image
          Row(
            children: images.map((image)=> brandTopProductImageWidget(image, context)).toList()
          )
        ],
      ),
    );
  }

  Widget brandTopProductImageWidget(String image, context){
   return Expanded(
      child: URoundedContainer(
        height: 100,
        backgroundColor: UColors.darkGrey,
        margin: const EdgeInsets.only(right: USizes.sm),
        padding: const EdgeInsets.all(USizes.md),
        child:  Image(image: AssetImage(image), fit: BoxFit.contain),
      ),
    );
  }
}
