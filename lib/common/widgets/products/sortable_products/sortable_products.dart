import 'package:e_commerce/common/layout/grid_layout.dart';
import 'package:e_commerce/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:e_commerce/features/shop/controllers/all_products_controller.dart';
import 'package:e_commerce/features/shop/controllers/product/product_controller.dart';
import 'package:e_commerce/features/shop/models/product_model.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class SortableProducts extends StatelessWidget {
  const SortableProducts({
    super.key, required this.products,
  });

  final List<ProductModel> products;
  
  // final 
  @override
  Widget build(BuildContext context) {

    final controller = Get.put(AllProductsController());
    controller.assignProducts(products);

    return Column(
      children: [
        // Dropdown
        DropdownButtonFormField( 
          initialValue: controller.selectedSortOption.value,
          decoration: InputDecoration(    
            // border: OutlineInputBorder(
            //   borderRadius: BorderRadius.circular(8.0),
            // ),
            prefixIcon: Icon(Iconsax.sort_copy)
          ),
          onChanged: (value) {
            // Sort Products based on the selected option
            controller.sortProducts(value!);
          },
          items: ['Nombre', 'Mayor Precio', 'Menor Precio', 'Ofertas', 'Por Fecha', 'Mas Populares']
            .map((option) => DropdownMenuItem(value: option, child: Text(option)))
            .toList()
        ),
        SizedBox(height: USizes.spaceBtwSections),
        // Products
        Obx(() => GridLayout(itemCount: controller.products.length,  itemBuilder: (_, index) => ProductCardVertical(product: controller.products[index])))
      ],
    );
  }
}