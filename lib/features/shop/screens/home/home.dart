import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/common/layout/grid_layout.dart';
import 'package:e_commerce/common/widgets/appBar/appbar.dart';
import 'package:e_commerce/common/widgets/commmo_shapes/containers/circular_container.dart';
import 'package:e_commerce/common/widgets/commmo_shapes/containers/primary_header_container.dart';
import 'package:e_commerce/common/widgets/commmo_shapes/containers/rounded_image.dart';
import 'package:e_commerce/common/widgets/commmo_shapes/containers/search_container.dart';
import 'package:e_commerce/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:e_commerce/features/shop/controllers/home_controller.dart';
import 'package:e_commerce/features/shop/screens/all_products/all_products.dart';
import 'package:e_commerce/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:e_commerce/features/shop/screens/sub_category/sub_categories.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/device_helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            UPrimaryHeaderContainer(
              child: Column(
                children: [
                  // App Bar
                  HomeAppbar(),
                  SizedBox(height: USizes.spaceBtwSections/2),
            
                  // Search Bar
                  SeachContainer(text: "Search in Store"),
                  SizedBox(height: USizes.spaceBtwSections),
            
                  Padding(
                    padding: const EdgeInsets.only(left: USizes.defaultSpace),
                    child: Column(
                      children: [
                        
                        // Heading
                        SectionHeading(title: 'Popular Categories', showActionButton: false, textColor: UColors.white,),
                        SizedBox(height: USizes.spaceBtwSections/2),
                        
                        // Categories
                        SizedBox(
                          height: 80,
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: 6,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (_, index){
                              return VerticalImageText(image: Images.shoesIcon, title: 'Shoes', onTap: () => Get.to(() => SubCategoriesScreen()));
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: USizes.spaceBtwSections)
                ],
              ),
            ),
        
            // Body
            Padding(
              padding: const EdgeInsets.all(USizes.defaultSpace),
              child: Column(
                children: [
                  PromoSlider(banners: [
                    Images.homeBanner1,
                    Images.homeBanner2,
                    Images.homeBanner3,
                    Images.homeBanner4,
                    Images.homeBanner5]
                  ),
                  SizedBox(height: USizes.spaceBtwSections),

                  // Heading
                  SectionHeading(title: 'Popular Products', onPressed: () => Get.to(()=> AllProducts())),
                  SizedBox(height: USizes.spaceBtwItems),
                  GridLayout(itemCount: 10, itemBuilder: (_, index){
                    return ProductCardVertical();}
                )
        
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}



class PromoSlider extends StatelessWidget {
  const PromoSlider({
    super.key, required this.banners,
  });

  final List<String> banners;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            viewportFraction: 1,
            onPageChanged: (index, _) => controller.updatePageIndicator(index),
          ),
          items: banners.map((url) => RoundedImage(imageUrl: url)).toList(), 
        ),
        SizedBox(height: USizes.defaultSpace),
        Obx(
          () => Row(
            children: [
              for(int i = 0; i < banners.length; i++)
              UCircularContainer(
                width: 20,
                height: 5,
                margin: EdgeInsets.only(right: 10),
                backgroundColor: controller.carouselCurrentIndex.value == i ? UColors.primary : Colors.grey
              ),
            ],
          ),
        )
      ],
    );
  }
}


class VerticalImageText extends StatelessWidget {
  const VerticalImageText({
    super.key, 
    required this.image, 
    required this.title, 
    this.textColor = UColors.white, 
    this.backgroundColor = UColors.white, 
    this.onTap,
  });

  final String image, title;
  final Color textColor;
  final Color? backgroundColor;
  final void Function()? onTap;
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: USizes.spaceBtwItems),
        child: Column(
          children: [
            Container(
              width: 56,
              height: 56,
              padding: const EdgeInsets.all(USizes.sm),
              decoration: BoxDecoration(
                color: UColors.white,
                borderRadius: BorderRadius.circular(100)
              ),
              child: Center(
                child: Image(image: AssetImage(Images.shoesIcon), fit: BoxFit.cover, color: UColors.dark,),
              )
            ),
        
            const SizedBox(height: USizes.spaceBtwItems/2),
            SizedBox(
              width: 55, 
              child: Text('Shoes category', style: Theme.of(context).textTheme.labelMedium!.apply(color: UColors.white),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              )
            ),
              
          ],
        ),
      ),
    );
  }
}

class SectionHeading extends StatelessWidget {
  const SectionHeading({
    super.key, this.textColor, this.showActionButton = true, required this.title, this.buttonTitle = 'View all', this.onPressed,
  });

  final Color? textColor;
  final bool showActionButton;
  final String title, buttonTitle;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: Theme.of(context).textTheme.titleMedium!.apply(color: textColor), maxLines: 1, overflow: TextOverflow.ellipsis),
        if(showActionButton) TextButton(onPressed: onPressed, child: Text(buttonTitle))
      ],
    );
  }
}

