import 'package:e_commerce/common/widgets/appBar/appbar.dart';
import 'package:e_commerce/common/widgets/commmo_shapes/containers/rounded_image.dart';
import 'package:e_commerce/common/widgets/icons/circular_icons.dart';
import 'package:e_commerce/features/shop/screens/product_details/widgets/curved_edge_widget.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class ProductImageSlider extends StatelessWidget {
  const ProductImageSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return UCurvedEdgeWidget(
      child:  
        Container(
          color: Colors.yellow,
          child: Stack(
            children: [
              // Main Large Image
              SizedBox(
                height: 400,
                child: Padding(
                  padding: const EdgeInsets.all(USizes.productImageRadius * 2),
                  child: Center(child: Image(image: AssetImage(Images.productImage2))),
                )
              ),
    
              // Imagen Slider
    
              Positioned(
                right: 0,
                bottom: 30,
                left: USizes.defaultSpace,
                child: SizedBox(
                  height: 80,
                  child: ListView.separated(
                    itemCount: 10,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: AlwaysScrollableScrollPhysics(),
                    separatorBuilder: (_ , __) => const SizedBox(width: USizes.spaceBtwItems),
                    itemBuilder: (_,__) =>
                      RoundedImage(
                        height: 80,
                        // backgroundColor: dark? UColors.dark : UColors.white ,
                        backgroundColor: UColors.white ,
                        padding: EdgeInsets.all(USizes.sm),
                        border: Border.all(color: UColors.primary),
                        imageUrl: Images.productImage1
                      )
                  ),
                ),
              ),
    
              // App Bar
              UAppBar(
                showBackArrow: true,
                actions: [UCircularIcon(icon: Iconsax.heart, color: Colors.red,)],
              )
            ],
          ),
        ),
    );
  }
}