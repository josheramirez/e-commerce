import 'package:e_commerce/common/images/circular_image.dart';
import 'package:e_commerce/common/layout/grid_layout.dart';
import 'package:e_commerce/common/widgets/appBar/appbar.dart';
import 'package:e_commerce/common/widgets/appBar/tabbar.dart';
import 'package:e_commerce/common/widgets/brands/brand_showcase.dart';
import 'package:e_commerce/common/widgets/commmo_shapes/containers/rounded_container.dart';
import 'package:e_commerce/common/widgets/commmo_shapes/containers/search_container.dart';
import 'package:e_commerce/common/widgets/products/cart/cart_counter_icon.dart';
import 'package:e_commerce/common/widgets/products/product_cards/brand_title_with_verifed_icon.dart';
import 'package:e_commerce/features/shop/screens/home/home.dart';
import 'package:e_commerce/features/shop/screens/store/widgets/category_tab.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/enums.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/device_helpers.dart';
import 'package:flutter/material.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
      length: 6,
      child: Scaffold(
          appBar: UAppBar(
            title: Text('Store', style: Theme.of(context).textTheme.headlineMedium),
            actions: [
              CardCounterIcon(onPressed: (){}, iconColor: Colors.black,)
            ],
          ),
          body: NestedScrollView(headerSliverBuilder: (_ , innerBoxIsScrolled){
          return [
            SliverAppBar(
              automaticallyImplyLeading: false,
              pinned: true,
              floating: true,
              backgroundColor: UColors.white,
              expandedHeight: 440,
              
              flexibleSpace: Padding(
                padding: EdgeInsets.all(USizes.defaultSpace),
                child: ListView(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    // Search Bar
                    SizedBox(height: USizes.spaceBtwItems),
                    SeachContainer(text: 'Search in Store', showBorder: true, showBackground: false, padding: EdgeInsets.zero,),
                    SizedBox(height: USizes.spaceBtwSections,),
      
                    // Featured Brands
                    SectionHeading(title: 'Featured Brands', onPressed: (){}),
                    SizedBox(height: USizes.spaceBtwItems/1.5),
      
                    // Brand Grid
                    GridLayout(itemCount: 4, mainAxisExtent: 80, itemBuilder: (_, index){ 
                      return BrandCard(showBorder: false,);
                      }
                    )
                
                  ],
                ),
              ),

              bottom: UTabBar(
                tabs: 
                [
                  Tab(child: Text("Hotwheels")),
                  Tab(child: Text("TCG")),
                  Tab(child: Text("Lego")),
                  Tab(child: Text("Model Kits")),
                  Tab(child: Text("Warhammer")),
                  Tab(child: Text("Tools")),
                ],
              ),

              
            
            ),
          ];
          }, 
          
          body: TabBarView(
            children: [
              CategoryTab(),
              CategoryTab(),
              CategoryTab(),
              CategoryTab(),
              CategoryTab(),
              CategoryTab(),
            ])),
        ),
    );
  }
}


class BrandCard extends StatelessWidget {
  const BrandCard({
    super.key, required this.showBorder, this.onTap,
  });

  final bool showBorder;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: URoundedContainer(
        padding: const EdgeInsets.all(USizes.sm),
        showBorder: showBorder,
        backgroundColor: Colors.transparent,
        child: Row(
          children: [
          // Icon
          Flexible(
                  child: CircularImage(
                    isNetworkImage: false,
                    image: Images.pokemonIcon,
                    backgroundColor: Colors.transparent,
                    overlayColor: UColors.black,
                  ),
                ),
          SizedBox(width: USizes.spaceBtwItems / 2,),
      
          // Text
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BrandTitleWithVerifedIcon(title: "Pokemon", brandTextSize:  TextSizes.large,),
                Text(
                  '250 products edasdfasdsfasdfasdfasdfa',
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.labelMedium
                )
              ],
            ),
          )
          ],
      
        ),
      ),
    );
  }
}

