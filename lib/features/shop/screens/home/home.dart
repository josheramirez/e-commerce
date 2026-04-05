import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/common/widgets/appBar/appbar.dart';
import 'package:e_commerce/common/widgets/commmo_shapes/containers/circular_container.dart';
import 'package:e_commerce/common/widgets/commmo_shapes/containers/primary_header_container.dart';
import 'package:e_commerce/common/widgets/commmo_shapes/containers/search_container.dart';
import 'package:e_commerce/features/shop/controllers/home_controller.dart';
import 'package:e_commerce/features/shop/screens/home/widgets/home_appbar.dart';
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
      
      body: Column(
        children: [
          // Header
          UPrimaryHeaderContainer(
            child: Column(
              children: [
                // App Bar
                CustomAppBar(),
                SizedBox(height: USizes.spaceBtwSections),
          
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
                            return VerticalImageText(image: Images.shoesIcon, title: 'Shoes', onTap: (){});
                          },
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),

          // Body
          Padding(
            padding: const EdgeInsets.all(USizes.defaultSpace),
            child: PromoSlder(banners: [
              Images.homeBanner1,
              Images.homeBanner2,
              Images.homeBanner3,
              Images.homeBanner4,
              Images.homeBanner5]
            ),
          )
        ],
      ),
    );
  }
}

class PromoSlder extends StatelessWidget {
  const PromoSlder({
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

class RoundedImage extends StatelessWidget {
  const RoundedImage({
    super.key, 
    this.width, 
    this.height, 
    required this.imageUrl, 
    this.applyImageRadius = true, 
    this.border, 
    this.backgroundColor = UColors.light, 
    this.fit = BoxFit.contain, 
    this.padding, 
    this.onPressed, 
    this.borderRadius = USizes.md, 
    this.isNetworkImage = true,
  });

  final double? width, height;
  final String imageUrl;
  final bool applyImageRadius;
  final BoxBorder? border;
  final Color backgroundColor;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImage;
  final VoidCallback? onPressed;
  final double borderRadius;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,

      decoration: BoxDecoration(border: border, color: backgroundColor, borderRadius: BorderRadius.circular(borderRadius)),
      child: ClipRRect(
        borderRadius: applyImageRadius? BorderRadius.circular(borderRadius) : BorderRadius.zero,
        child: Image(image: isNetworkImage ? NetworkImage(imageUrl) : AssetImage(imageUrl) as ImageProvider ,fit: fit),
      ),
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
      children: [
        Text(title, style: Theme.of(context).textTheme.titleMedium!.apply(color: textColor), maxLines: 1, overflow: TextOverflow.ellipsis),
        if(showActionButton) TextButton(onPressed: onPressed, child: Text(buttonTitle))
      ],
    );
  }
}

