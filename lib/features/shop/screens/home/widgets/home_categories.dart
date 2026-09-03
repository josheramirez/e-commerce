import 'package:e_commerce/common/widgets/shimmer/category_shimmer.dart';
import 'package:e_commerce/features/shop/controllers/category_controller.dart';
import 'package:e_commerce/features/shop/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../sub_category/sub_categories.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final categoryController = Get.put(CategoryController());

    return Obx(() {
      if (categoryController.isLoading.value) return CategoryShimmer();
      
      if (categoryController.featuredCategories.isEmpty) {
        return Center(child: Text('No data Found', style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white)));
      }

      return SizedBox(
        height: 80,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: categoryController.featuredCategories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            final  category = categoryController.featuredCategories[index];
            return VerticalImageText(
              image: category.image,
              title: category.name,
              onTap: () => Get.to(() => SubCategoriesScreen(category: category)),
            );
          },
        ),
      );
    });
  }
}
