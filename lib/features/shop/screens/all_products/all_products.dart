import 'package:e_commerce/common/widgets/appBar/appbar.dart';
import 'package:e_commerce/common/widgets/products/sortable_products/sortable_products.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UAppBar(title: Text('Popular Products'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(USizes.defaultSpace),
          child: SortableProducts(),
        ),
      ),
    );
  }
}
