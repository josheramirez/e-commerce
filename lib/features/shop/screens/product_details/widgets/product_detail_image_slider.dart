import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/common/widgets/appBar/appbar.dart';
import 'package:e_commerce/common/widgets/commmo_shapes/containers/rounded_image.dart';
import 'package:e_commerce/common/widgets/icons/circular_icons.dart';
import 'package:e_commerce/features/shop/controllers/product/images_controller.dart';
import 'package:e_commerce/features/shop/models/product_model.dart';
import 'package:e_commerce/features/shop/screens/product_details/widgets/curved_edge_widget.dart';
import 'package:e_commerce/global_config.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class ProductImageSlider extends StatelessWidget {
  const ProductImageSlider({
    super.key, required this.product,
  });

  final ProductModel product;
  
  @override
  Widget build(BuildContext context) {

    final dark = HelperFunctions.isDarkMode(context);
    final controller = Get.put(ImagesController());
    final images = controller.getAllProductImages(product);

    return UCurvedEdgeWidget(
      child:  
        Container(
          color: Colors.white,
          child: Stack(
            children: [
              
              // Main Large Image
              SizedBox(
                height: 400,
                child: Padding(
                  padding: const EdgeInsets.all(USizes.productImageRadius * 2),
                  child: Center(child: Obx((){
                    final image = controller.selectedProductImage.value;
                    return GestureDetector(
                      onTap: () => controller.showEnlargeInage(image),
                      child: 
                      GlobalConfig.instance.isNetworkImage ?
                      CachedNetworkImage(
                        imageUrl: image,
                        progressIndicatorBuilder: (_,__,downloadProgress) => 
                          CircularProgressIndicator(value: downloadProgress.progress, color: UColors.primary),  
                      )
                      :
                      Image.asset(image)
                    );
                  })),
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
                    itemCount: images.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: AlwaysScrollableScrollPhysics(),
                    separatorBuilder: (_ , __) => SizedBox(width: USizes.spaceBtwItems),
                    itemBuilder: (_, index) => Obx(
                        (){
                          final imageSelected = controller.selectedProductImage.value == images[index];
                          return RoundedImage(
                            width: 80,
                            isNetworkImage: GlobalConfig.instance.isNetworkImage,
                            imageUrl: images[index],
                            padding: EdgeInsets.all(USizes.sm),
                            backgroundColor: dark? UColors.dark : UColors.white,
                            onPressed: () => controller.selectedProductImage.value = images[index],
                            border: Border.all(color: imageSelected ? UColors.primary : Colors.transparent),
                          );
                        },
                          
                      ),
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