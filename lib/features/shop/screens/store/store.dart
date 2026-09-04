import 'package:e_commerce/common/images/circular_image.dart';
import 'package:e_commerce/common/layout/grid_layout.dart';
import 'package:e_commerce/common/widgets/appBar/appbar.dart';
import 'package:e_commerce/common/widgets/appBar/tabbar.dart';
import 'package:e_commerce/common/widgets/commmo_shapes/containers/rounded_container.dart';
import 'package:e_commerce/common/widgets/commmo_shapes/containers/search_container.dart';
import 'package:e_commerce/common/widgets/products/cart/cart_counter_icon.dart';
import 'package:e_commerce/common/widgets/products/product_cards/brand_title_with_verifed_icon.dart';
import 'package:e_commerce/common/widgets/shimmer/brands_shimmer.dart';
import 'package:e_commerce/features/shop/controllers/brand_controller.dart';
import 'package:e_commerce/features/shop/controllers/category_controller.dart';
import 'package:e_commerce/features/shop/models/brand_model.dart';
import 'package:e_commerce/features/shop/screens/brand/all_brands.dart';
import 'package:e_commerce/features/shop/screens/brand/brand_products.dart';
import 'package:e_commerce/features/shop/screens/home/home.dart';
import 'package:e_commerce/features/shop/screens/store/widgets/category_tab.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/enums.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    final dark = HelperFunctions.isDarkMode(context);
    final categories = CategoryController.instance.featuredCategories;
    final brandController = Get.put(BrandController());

    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        
        //  APP BAR
        appBar: UAppBar(
          title: Text('Store', style: Theme.of(context).textTheme.headlineMedium),
          actions: [CardCounterIcon( iconColor: Colors.black)],
        ),

        // 
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: UColors.white,
                expandedHeight: 450,

                flexibleSpace: Padding(
                    padding: EdgeInsets.all(USizes.defaultSpace),
                    child: ListView(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                  
                        // Search Bar
                        SizedBox(height: USizes.spaceBtwItems),
                        SeachContainer(text: 'Buscar', showBorder: true, showBackground: false, padding: EdgeInsets.zero),
                        SizedBox(height: USizes.spaceBtwSections),
                  
                        // Featured Brands
                        SectionHeading(title: 'Marcas Destacadas', onPressed: () => Get.to(() => AllBrandsScreen()),
                        ),
                        SizedBox(height: USizes.spaceBtwItems / 1.5),
                  
                        Obx(
                          (){ 
                            if(brandController.isLoading.value) return const BrandShimmer();
                  
                            if (brandController.featuredBrands.isEmpty) {
                              return Center(
                                child: Text('No Se Encontraron Datos', style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white))
                              );
                            }
                  
                            return GridLayout(
                              itemCount: brandController.featuredBrands.length,
                              mainAxisExtent: 80,
                              itemBuilder: (_, index) {
                                final brand = brandController.featuredBrands[index];
                                return BrandCard(showBorder: true, brand: brand, onTap: () => Get.to(() => BrandProducts(brand: brand)));
                              },
                            );
                          }
                        ),
                        
                      ],
                    ),
                  
                ),

                bottom: UTabBar(tabs: categories.map((category) => Tab(child: Text(category.name))).toList()),
              ),
            ];
          },

          body: Expanded(
            child: TabBarView(
              children: categories.map((category) => CategoryTab(category: category)).toList(),
            ),
          ),
        ),
      ),
    );
  }
}

class BrandCard extends StatelessWidget {
  const BrandCard({super.key, required this.showBorder, this.onTap, required this.brand});

  final bool showBorder;
  final void Function()? onTap;
  final BrandModel brand;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: URoundedContainer(
        padding: const EdgeInsets.all(USizes.sm),
        showBorder: showBorder,
        backgroundColor: Colors.transparent,
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            // Icon
            Flexible(
              child: CircularImage(
                isNetworkImage: true,
                image: brand.image,
                backgroundColor: Colors.white,
                // overlayColor: Colors.transparent,
              ),
            ),
            SizedBox(width: USizes.spaceBtwItems / 2),

            // Text
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BrandTitleWithVerifedIcon(title: brand.name, brandTextSize: TextSizes.large),
                  Text(
                    '${brand.productsCount ?? 0} productos', style: Theme.of(context).textTheme.labelMedium, overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
