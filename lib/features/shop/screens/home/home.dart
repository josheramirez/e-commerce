import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/common/layout/grid_layout.dart';
import 'package:e_commerce/common/widgets/commmo_shapes/containers/circular_container.dart';
import 'package:e_commerce/common/widgets/commmo_shapes/containers/primary_header_container.dart';
import 'package:e_commerce/common/widgets/commmo_shapes/containers/rounded_image.dart';
import 'package:e_commerce/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:e_commerce/common/widgets/shimmer/horizontal_product_shimmer.dart';
import 'package:e_commerce/common/widgets/shimmer/shimmer_effect.dart';
import 'package:e_commerce/common/widgets/shimmer/vertical_product_shimmer.dart';
import 'package:e_commerce/features/shop/controllers/banner_controller.dart';
import 'package:e_commerce/features/shop/controllers/product/product_controller.dart';
import 'package:e_commerce/features/shop/models/product_model.dart';
import 'package:e_commerce/features/shop/screens/all_products/all_products.dart';
import 'package:e_commerce/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:e_commerce/features/shop/screens/home/widgets/home_categories.dart';
import 'package:e_commerce/global_config.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    RxString searchText = ''.obs;
    // RxBool searchResponse = false.obs;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // [HEADER]
            UPrimaryHeaderContainer(
              child: Column(
                children: [
                  // [APP BAR]
                  HomeAppbar(),
                  // SizedBox(height: USizes.spaceBtwSections / 2),

                  // SeachContainer(text: "Search in Store"),

                  // [SEARCH BAR]
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: USizes.defaultSpace,
                    ),
                    child: Container(
                      // color: Colors.white,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                          USizes.cardRadiusLg,
                        ),
                        border: null,
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Iconsax.search_normal_1_copy),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 20.0,
                            horizontal: 10,
                          ), // Adjust height here
                          border: OutlineInputBorder(),
                          hintText: 'Buscar',
                          hintStyle: TextStyle(
                            color: UColors
                                .darkGrey, // Change this to your preferred color
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: BorderSide(
                              color: Colors.grey,
                              width: 1.0,
                            ),
                          ),
                          // The border color when the field IS focused 🌟
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: BorderSide(
                              color: Colors.grey,
                              width: 1.0,
                            ),
                          ),
                        ),
                        onChanged: (value) => searchText.value = value,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),

                  // [CATEGORIES]
                  Obx(() {
                    if (searchText.value.isEmpty ||
                        searchText.value.length < 3) {
                      return Padding(
                        padding: const EdgeInsets.only(
                          left: USizes.defaultSpace,
                        ),
                        child: Column(
                          children: [
                            // Heading
                            SectionHeading(
                              title: 'Popular Categories',
                              showActionButton: false,
                              textColor: UColors.white,
                            ),
                            SizedBox(height: USizes.spaceBtwSections / 2),

                            // Categories
                            HomeCategories(),
                          ],
                        ),
                      );
                    }
                    return SizedBox(height: 0);
                  }),
                  SizedBox(height: USizes.spaceBtwSections),
                ],
              ),
            ),

            // [BODY / banner and list of products]
            Obx(() {
              if (searchText.value.isEmpty || searchText.value.length < 3) {
                return Padding(
                  padding: const EdgeInsets.only(
                    top: USizes.defaultSpace / 2,
                    left: USizes.defaultSpace,
                    right: USizes.defaultSpace,
                    bottom: USizes.defaultSpace,
                  ),
                  child: Column(
                    children: [
                      // [SLIDER]
                      PromoSlider(),
                      SizedBox(height: USizes.spaceBtwSections / 2),

                      // Heading
                      SectionHeading(
                        title: 'Productos Populares',
                        onPressed: () => Get.to(
                          () => AllProducts(
                            title: 'Productos Populares',
                            // query: FirebaseFirestore.instance.collection('Products').where('isFeatured', isEqualTo: true).limit(6),
                            futureMethod: controller.fetchAllFeaturedProducts(),
                          ),
                        ),
                      ),
                      SizedBox(height: USizes.spaceBtwItems / 2),

                      // Popular Products
                      Obx(() {
                        if (controller.isLoading.value) {
                          return VerticalProductShimmer();
                        }
                        if (controller.featuredProducts.isEmpty) {
                          return Center(
                            child: Text(
                              'No Data Found',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          );
                        }

                        return GridLayout(
                          itemCount: controller.featuredProducts.length,
                          itemBuilder: (_, index) => ProductCardVertical(
                            product: controller.featuredProducts[index],
                          ),
                        );
                      }),
                    ],
                  ),
                );
              }
              return
              // SizedBox(height: 0);
              FutureBuilder(
                future: ProductController.intance.getAllProducts(),
                builder: ((context, snapshot) {
                  const loader = HorizontalProductShimmer();

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return loader;
                  }
                  if (!snapshot.hasData ||
                      snapshot.data == null ||
                      snapshot.data!.isEmpty) {
                    return const Center(child: Text('No Hay Datos'));
                  }
                  if (snapshot.hasError)
                    return const Center(child: Text('Hubo un error.'));

                  // Records Found !
                  final products = snapshot.data!;

                  final filteredProducts = products
                      .where(
                        (product) => product.title.toLowerCase().contains(
                          searchText.value.toLowerCase(),
                        ),
                      )
                      .toList();

                  // Create a copy so you don't mess up the original list order
                  List<ProductModel> randomItems = List.from(products)
                    ..shuffle();

                  // Select the first 3 items from the shuffled list
                  List<ProductModel> selection = randomItems.take(6).toList();

                  return filteredProducts.isNotEmpty
                      ? GridLayout(
                          itemCount: filteredProducts.length,
                          itemBuilder: (_, index) => ProductCardVertical(
                            product: filteredProducts[index],
                          ),
                        )
                      : Column(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text('Sin Resultados...'),
                            ),

                            GridLayout(
                              itemCount: selection.length,
                              itemBuilder: (_, index) => ProductCardVertical(
                                product: selection[index],
                              ),
                            ),
                          ],
                        );
                }),
              );
            }),
          ],
        ),
      ),
    );
  }
}

class PromoSlider extends StatelessWidget {
  const PromoSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BannerController());
    return Obx(() {
      if (controller.isLoading.value)
        return ShimmerEffect(width: double.infinity, height: 190);

      if (controller.banners.isEmpty) {
        return Center(child: Text('No Data Found'));
      } else {
        return Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                padEnds: false,
                viewportFraction: 1,
                onPageChanged: (index, _) =>
                    controller.updatePageIndicator(index),
              ),
              items: controller.banners
                  .map(
                    (banner) => RoundedImage(
                      fit: BoxFit.fill,
                      width: double.infinity,
                      imageUrl: banner.imageUrl,
                      isNetworkImage: GlobalConfig.instance.isNetworkImage,
                      onPressed: () => Get.toNamed(banner.targetScreen),
                    ),
                  )
                  .toList(),
            ),
            SizedBox(height: USizes.spaceBtwItems),

            // Obx(() =>
            Row(
              children: [
                for (int i = 0; i < controller.banners.length; i++)
                  UCircularContainer(
                    width: 20,
                    height: 5,
                    margin: EdgeInsets.only(right: 10),
                    backgroundColor: controller.carouselCurrentIndex.value == i
                        ? UColors.primary
                        : Colors.grey,
                  ),
              ],
            ),
            // ),
          ],
        );
      }
    });
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
            // Icon
            Container(
              width: 56,
              height: 56,
              padding: const EdgeInsets.all(USizes.sm),
              decoration: BoxDecoration(
                color: UColors.white,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 0.0),
                  child: Image(
                    image: AssetImage(image.isEmpty ? Images.nullIcon : image),
                    fit: BoxFit.fill,
                    color: UColors.dark,
                  ),
                ),
              ),
            ),
            const SizedBox(height: USizes.spaceBtwItems / 2),

            // Text
            SizedBox(
              width: 55,
              child: Text(
                title,
                style: Theme.of(
                  context,
                ).textTheme.labelMedium!.apply(color: UColors.white),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SectionHeading extends StatelessWidget {
  const SectionHeading({
    super.key,
    this.textColor,
    this.showActionButton = true,
    required this.title,
    this.buttonTitle = 'Ver todos',
    this.onPressed,
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
        Text(
          title,
          style: Theme.of(
            context,
          ).textTheme.titleMedium!.apply(color: textColor),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        if (showActionButton)
          TextButton(onPressed: onPressed, child: Text(buttonTitle)),
      ],
    );
  }
}
