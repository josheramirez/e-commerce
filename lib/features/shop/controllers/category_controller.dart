import 'package:e_commerce/data/repositories/categories/category_repository.dart';
import 'package:e_commerce/dummy_data.dart';
import 'package:e_commerce/features/shop/models/category_model.dart';
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
        featuredCategories.addAll(DummyData.categories);
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
}