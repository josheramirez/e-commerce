import 'package:e_commerce/common/widgets/chips/choice_chip.dart';
import 'package:e_commerce/common/widgets/commmo_shapes/containers/rounded_container.dart';
import 'package:e_commerce/common/widgets/products/product_cards/product_tiitle_text.dart';
import 'package:e_commerce/features/shop/screens/home/home.dart';
import 'package:e_commerce/features/shop/screens/product_details/widgets/product_title_text.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class ProductsAttributes extends StatelessWidget {
  const ProductsAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        URoundedContainer(
          padding: const EdgeInsets.all(USizes.md),
          backgroundColor: UColors.grey,
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
                            Text('\$25', style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough)),
                            SizedBox(width: USizes.spaceBtwItems),
                    
                            // Sale Price
                            Text('\$20'),
                            
                          ],
                        ),
                    
                        // Stock
                        Row(
                          children: [
                            const ProductTitleText(title: 'Stock : ', smallSize: true),
                            Text('In Stock', style: Theme.of(context).textTheme.titleMedium),
                          ],
                        ),
                    
                       
                      ],
                    ),
                  )
                  
                ],
              ),

               // Variation Description
              ProductTitleText(
                title: 'This is a descrription of the product and it can go up 4 lines. this is just a test Lorem, This is a descrription of the product and it can go up 4 lines. this is just a test Lorem Ipsum',
                smallSize: true,
                maxLines: 3,
              ),
          
            ],
          ),
        ),
        const SizedBox(height: USizes.spaceBtwItems),

        // Attributes
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionHeading(title: 'Colors', showActionButton: false),
            SizedBox(height: USizes.spaceBtwItems/2),
            Wrap(
              direction: Axis.horizontal,
              spacing: 8,
              runSpacing: 16.0,
              children: [
                UChoiceChip(text: 'Green', selected: false, onSelected: (value){}),
                UChoiceChip(text: 'Blue', selected: true, onSelected: (value){}),
                UChoiceChip(text: 'Yellow', selected: true, onSelected: (value){}),
                UChoiceChip(text: 'Green', selected: false, onSelected: (value){}),
                UChoiceChip(text: 'Blue', selected: true, onSelected: (value){}),
                UChoiceChip(text: 'Yellow', selected: true, onSelected: (value){}),
                UChoiceChip(text: 'Green', selected: false, onSelected: (value){}),
                UChoiceChip(text: 'Blue', selected: true, onSelected: (value){}),
                UChoiceChip(text: 'Yellow', selected: true, onSelected: (value){}),
                UChoiceChip(text: 'Green', selected: false, onSelected: (value){}),
                UChoiceChip(text: 'Blue', selected: true, onSelected: (value){}),
                UChoiceChip(text: 'Yellow', selected: true, onSelected: (value){}),
                UChoiceChip(text: 'Green', selected: false, onSelected: (value){}),
                UChoiceChip(text: 'Blue', selected: true, onSelected: (value){}),
                UChoiceChip(text: 'Yellow', selected: true, onSelected: (value){})
              ]
            )
          ],
        ),
        // Sizes
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionHeading(title: 'Size', showActionButton: false),
            SizedBox(height: USizes.spaceBtwItems/2),
            Wrap(
              spacing: 8,
              children: [
                UChoiceChip(text: 'EU 34 ', selected: false, onSelected: (value){}),
                UChoiceChip(text: 'EU 36', selected: true, onSelected: (value){}),
                UChoiceChip(text: 'EU 38', selected: true, onSelected: (value){})
              ]
            )
          ],
        )
      ],
    );
                  
  }
}