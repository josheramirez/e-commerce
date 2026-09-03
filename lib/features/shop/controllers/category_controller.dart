import 'package:e_commerce/data/repositories/categories/category_repository.dart';
import 'package:e_commerce/data/repositories/products/product_repository.dart';
import 'package:e_commerce/dummy_data.dart';
import 'package:e_commerce/features/shop/models/category_model.dart';
import 'package:e_commerce/features/shop/models/product_model.dart';
import 'package:e_commerce/utils/constants/loaders.dart';
import 'package:get/get.dart';

class  CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  final isLoading = false.obs;
  final _categoryRepository = Get.put(CategoryRepository());
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;

  @override
  void onInit(){
    fetchCategories();
    super.onInit();
  }

  final bool localData = true;
  
  // Load category data
  Future<void> fetchCategories() async{
    
    // Fetch Local data or From Firebase
    if (localData) {
        // Show loader while loading categories
        isLoading.value = true;
        featuredCategories.addAll(DummyData.categories.where((category) => category.isFeatured == true && category.parentId.isEmpty));
        await Future.delayed(const Duration(seconds: 2));
        isLoading.value = false;
    }else{
      try {
        // Show loader while loading categories
        isLoading.value = true;

        // Fetch categories from data source (Firestore, API, etc)
        final categories = await _categoryRepository.getAllCategories();
        // Update the categories list
        allCategories.assignAll(categories);

        // Filter featured categories
        featuredCategories.assignAll(allCategories.where((category) => category.isFeatured && category.parentId.isEmpty).take(8).toList());
      
      } catch (e) {
        Loaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
      } finally {
        isLoading.value = false;
      }
    }
  }

  // Get Category or Sub-Category Products.
  Future<List<ProductModel>> getCategoryProducts({required String categoryId, int limit = 4}) async{
    print('getCategoryProducts : $categoryId');
    
    // Fetch Local data or From Firebase
    if (localData) {
      // Get all ProductCategory who match with categoryId
      final productCategoryQuery = limit != 4
          ? DummyData.productCategory
            .where((e) => e.categoryId == categoryId)
          : DummyData.productCategory
                .where((e) => e.categoryId == categoryId)
                .take(limit);

      // Create list of Products ids than has categoryId
      final List<String> productIds = productCategoryQuery.map((doc) => doc.productId as String).toList();

       await Future.delayed(const Duration(seconds: 2));
       
      // Get the products
      final products = DummyData.products.where((product) => productIds.contains(product.id)).toList();

      return products;
    }else{
      try {
        // Fetch limited (4) products against each subCategory
        final products = await ProductRepository.instance.getProductsForCategory(categoryId: categoryId, limit: limit);
        return products;
      } catch (e) {
        Loaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
        return [];
      }
    }
  }

  Future<List<CategoryModel>> getSubCategories(String categoryId) async{
    // Fetch Local data or From Firebase
    if (localData) {
        final subCategories = DummyData.categories.where((category) => category.parentId == categoryId).toList();
        return subCategories;
    }else{
      try {
        final subCategories = await _categoryRepository.getSubCategories(categoryId);
        return subCategories;
      } catch (e) {
        Loaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
            return [];
      }
    }
  }
}