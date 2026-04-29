import 'package:e_commerce/features/shop/screens/product_details/widgets/curved_edge_widget.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/utils/constants/sizes.dart';


class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: SingleChildScrollView(
      
        child: Column(
          children: [
            // Product Image Slider
            UCurvedEdgeWidget(
              child:  
                Container(
                  color: Colors.yellow,
                  child: Stack(
                    children: [
                      // Main Large Image
                      SizedBox(
                        height: 400,
                        child: Padding(
                          padding: const EdgeInsets.all(USizes.productImageRadius * 2),
                          child: Center(child: Image(image: AssetImage(Images.productImage2))),
                        ))
                    ],
                  ),
                ),
            ),
            
          ],
        ),
      ),
    );
  }
}