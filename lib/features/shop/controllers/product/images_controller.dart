import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/features/shop/models/product_model.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImagesController  extends GetxController{
  static ImagesController get instance => Get.find();

  RxString selectedProductImage = ''.obs;

  List<String> getAllProductImages(ProductModel product){

    // Use Set to add unique images only
    Set<String> images = {};

    // Load Thumbnail image
    images.add(product.thumbnail);

    // Assign Tumbnail as Selected image
    selectedProductImage.value = product.thumbnail;

    if (product.images != null) {
      images.addAll(product.images!);
    }

    // // Get all the images from the Product Vatiations if not null
    if (product.productVariations != null && product.productVariations!.isNotEmpty) {
      images.addAll(product.productVariations!.map((variation) => variation.image));
    }
    
    return images.toList();
  }

  // Show Image Popup
  void showEnlargeInage(String image){
    Get.to(
      fullscreenDialog: true,
      () => Dialog.fullscreen(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: USizes.defaultSpace*2, horizontal: USizes.defaultSpace),
              child: CachedNetworkImage(imageUrl: image)
            ),
            SizedBox(height: USizes.spaceBtwSections),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: 150,
                child: OutlinedButton(onPressed: () => Get.back(), child: Text('Close')),
              ),
            )
          ],
        ),
      )
    );
  }
}