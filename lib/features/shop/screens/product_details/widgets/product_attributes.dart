import 'package:e_commerce/common/widgets/chips/choice_chip.dart';
import 'package:e_commerce/common/widgets/commmo_shapes/containers/rounded_container.dart';
import 'package:e_commerce/common/widgets/products/product_cards/product_title_text.dart';
import 'package:e_commerce/features/shop/controllers/product/variation_controller.dart';
import 'package:e_commerce/features/shop/models/product_model.dart';
import 'package:e_commerce/features/shop/screens/home/home.dart';
import 'package:e_commerce/features/shop/screens/product_details/widgets/product_price_text.dart';
import 'package:e_commerce/features/shop/screens/product_details/widgets/product_title_text.dart' hide ProductTitleText;
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
    final controller = VariationController.instance;
    controller.getAttributesMap(product);
    final dark = HelperFunctions.isDarkMode(context);

    return Obx(      
      () => Column(
        children: [
        
          // [VARIATION DETAIL] 
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
                    SectionHeading(title: 'Variante', showActionButton: false),
                    SizedBox(width: USizes.spaceBtwItems),
      
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          
                          // Price
                          Row(
                            children: [
                              ProductTitleText(title: 'Precio : ', smallSize: true),
                              SizedBox(width: USizes.spaceBtwItems /2 ),
                              
                              // Actual Price
                              if(controller.selectedVariation.value.salePrice > 0)
                              Text('\$${controller.selectedVariation.value.price}', style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough)),
                              if(controller.selectedVariation.value.salePrice > 0)
                              SizedBox(width: USizes.spaceBtwItems /2),
                      
                              // Sale Price
                              ProductPriceText(price: controller.getVariationPrice())
                              
                            ],
                          ),
                      
                          // Stock
                          Row(
                            children: [
                              const ProductTitleText(title: 'Stock : ', smallSize: true),
                              SizedBox(width: 12),
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
      
          // [VARIATION ATRIBUTES] 
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: product.productAttributes!.map((attribute) => 
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  // Attribute Name
                  SectionHeading(title: attribute.name ?? '', showActionButton: false),
                  SizedBox(height: USizes.spaceBtwItems/2),
                  
                  // Attribute Values
                  Obx(
                    () => Wrap(
                      direction: Axis.horizontal,
                      spacing: 8,
                      runSpacing: 16.0,
                      children: attribute.values!.map((attributeValue) {
                        final isSelected = controller.selectedAttributes[attribute.name] == attributeValue;
                        bool available = controller
                        .getAttributesAvailabilityInVariation(product.productVariations!, attribute.name!)
                        .contains(attributeValue);

                    // print('isSelected: $isSelected for attribute: ${attribute.name} and value: $attributeValue');
                    // print('available: $available for attribute: ${attribute.name} and value: $attributeValue');
                    // print('selectedAttributes: ${controller.selectedAttributes} for attribute: ${attribute.name} and value: $attributeValue');

print('in attribute: ${attribute.name} and value: $attributeValue');
print('controller.attributesMap.length: ${controller.attributesMap.length} for attribute: ${attribute.name} and value: $attributeValue');

if(controller.attributesMap.length >1){
  for (var disabledOption in controller.disabledOptions) {
    // Check if the current attribute and value is in the disabled options
    if (disabledOption[attribute.name] == attributeValue) {
        int keyLength = disabledOption.keys.length;

        // position in disabledOption of the current attribute name (Color or Model)
        int index = disabledOption.keys.toList().indexOf(attribute.name.toString());

        // position in attributeMap of the last key (last selected button) in the disabledOption map
        // 0 for Color, 1 for Model
        int indexInMap = controller.attributesMap.indexOf(disabledOption.keys.last);

        final lastKeyDisabledOption = disabledOption.keys.last;

        print('index in MAp is $indexInMap , keyLength: $keyLength');
        print('disabledOptions: ${controller.disabledOptions}');
        print('first key ,  ${disabledOption[disabledOption.keys.first]}');
        print('last key ,  ${disabledOption[disabledOption.keys.last]}');
        print('selectedAttributes: ${controller.selectedAttributes}');

        // if is the last element in the disabledOption and first element selected are the same then block the other attribute
        if (index == keyLength - 1 && controller.selectedAttributes[disabledOption.keys.first] == disabledOption[disabledOption.keys.first]) {
            print('DISABLED OPTION: $disabledOption for attribute: ${attribute.name} and value: $attributeValue');
            available = false; // Mark as unavailable if it's the last key in the disabled option
        } 

        // if is the last element in the disabledOption and first element selected are the same then block the other attribute
        if (index == 0 && controller.selectedAttributes[disabledOption.keys.last] == disabledOption[disabledOption.keys.last]) {
            print('DISABLED OPTION: $disabledOption for attribute: ${attribute.name} and value: $attributeValue');
            available = false; // Mark as unavailable if it's the last key in the disabled option
        } 

        // // if last selected is Model i need to block Color
        // if (indexInMap == 1 && attributeValue == disabledOption[disabledOption.keys.first]) {
        //     print('DISABLED OPTION: $disabledOption for attribute: ${attribute.name} and value: $attributeValue');
        //     available = false; // Mark as unavailable if it's the last key in the disabled option
        // } 


        // // if last selected is Color i need to block Model
        // if ( indexInMap == 0 && attributeValue == disabledOption[disabledOption.keys.first]) {
        //     print('DISABLED OPTION: $disabledOption for attribute: ${attribute.name} and value: $attributeValue');
        //     available = false; // Mark as unavailable if it's the last key in the disabled option
        // } 
    }
  }
}

                        return UChoiceChip(
                          text: attributeValue, 
                          selected: isSelected, 
                          onSelected: 
                            available ? 
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