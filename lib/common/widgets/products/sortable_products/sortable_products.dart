import 'package:e_commerce/common/layout/grid_layout.dart';
import 'package:e_commerce/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class SortableProducts extends StatelessWidget {
  const SortableProducts({
    super.key,
  });

  // final 
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Dropdown
        DropdownButtonFormField( 
          decoration: InputDecoration(    
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            prefixIcon: Icon(Iconsax.sort_copy)
          ),
          onChanged: (value) {},
          items: ['Name', 'Higher Price', 'Lower Price', 'Sale', 'Newest', 'Popularity']
            .map((option) => DropdownMenuItem(value: option, child: Text(option)))
            .toList()
        ),
        SizedBox(height: USizes.spaceBtwSections),
        // Products
        GridLayout(itemCount: 4,  itemBuilder: (_, index) => ProductCardVertical())
      ],
    );
  }
}