import 'package:e_commerce/common/widgets/chips/choice_chip.dart';
import 'package:e_commerce/common/widgets/commmo_shapes/containers/rounded_container.dart';
import 'package:e_commerce/common/widgets/products/product_cards/product_tiitle_text.dart';
import 'package:e_commerce/features/shop/controllers/product/variation_controller.dart';
import 'package:e_commerce/features/shop/models/product_model.dart';
import 'package:e_commerce/features/shop/screens/home/home.dart';
import 'package:e_commerce/features/shop/screens/product_details/widgets/product_price_text.dart';
import 'package:e_commerce/features/shop/screens/product_details/widgets/product_title_text.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductsAttributes extends StatelessWidget {
  const ProductsAttributes({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VariationController());
    final dark = HelperFunctions.isDarkMode(context);
    
    return Obx(
      () => Column(
        children: [
          // Selected Attribute Pricing & Description
          // Display variation price and stock when variatiion is selected.
          if(controller.selectedVariation.value.id.isNotEmpty)
          URoundedContainer(
            padding: const EdgeInsets.all(USizes.md),
            backgroundColor: dark ? UColors.darkerGrey : UColors.grey,
            child: Column(
              children: [
                Row(
                  children: [
                    SectionHeading(title: 'Variation', showActionButton: false),
                    SizedBox(width: USizes.spaceBtwItems),
      
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          
                          // Price
                          Row(
                            children: [
                              ProductTiitleText(title: 'Price : ', smallSize: true),
                              SizedBox(width: USizes.spaceBtwItems /2 ),
                              
                              // Actual Price
                              if(controller.selectedVariation.value.salePrice > 0)
                              Text('\$${controller.getVariationPrice()}', style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough)),
                              if(controller.selectedVariation.value.salePrice > 0)
                              SizedBox(width: USizes.spaceBtwItems),
                      
                              // Sale Price
                              ProductPriceText(price: controller.getVariationPrice())
                              
                            ],
                          ),
                      
                          // Stock
                          Row(
                            children: [
                              const ProductTitleText(title: 'Stock : ', smallSize: true),
                              Text(controller.variationStockStatus.value, style: Theme.of(context).textTheme.titleMedium),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
      
                 // Variation Description
                ProductTitleText(
                  title: controller.selectedVariation.value.description ?? '',
                  smallSize: true,
                  maxLines: 3,
                ),
            
              ],
            ),
          ),
          const SizedBox(height: USizes.spaceBtwItems),
      
          // Attribute 
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: product.productAttributes!.map((attribute) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SectionHeading(title: attribute.name ?? '', showActionButton: false),
                SizedBox(height: USizes.spaceBtwItems/2),
                
                Obx(
                  () => Wrap(
                    direction: Axis.horizontal,
                    spacing: 8,
                    runSpacing: 16.0,
                    children: attribute.values!.map((attributeValue) {
                      final isSelected = controller.selectedAttributes[attribute.name] == attributeValue;
                      final available = controller
                      .getAttributesAvailabilityInVariation(product.productVariations!, attribute.name!)
                      .contains(attributeValue);
                  
                      return UChoiceChip(
                        text: attributeValue, 
                        selected: isSelected, 
                        onSelected: available ? 
                          (selected){
                            if(selected && available){
                              controller.onAttributeSelected(product, attribute.name ?? '', attributeValue);
                            }
                          }
                          :
                          null
                      );
                    }).toList()
                  ),
                )
              ],
            )
            ).toList()
          ),
         
          // Sizes
          // Column(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     SectionHeading(title: 'Size', showActionButton: false),
          //     SizedBox(height: USizes.spaceBtwItems/2),
          //     Wrap(
          //       spacing: 8,
          //       children: [
          //         UChoiceChip(text: 'EU 34 ', selected: false, onSelected: (value){}),
          //         UChoiceChip(text: 'EU 36', selected: true, onSelected: (value){}),
          //         UChoiceChip(text: 'EU 38', selected: true, onSelected: (value){})
          //       ]
          //     )
          //   ],
          // )
        ],
      ),
    );
                  
  }
}