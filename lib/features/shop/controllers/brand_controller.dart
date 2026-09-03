import 'package:e_commerce/data/repositories/brands/brands_repository.dart';
import 'package:e_commerce/data/repositories/products/product_repository.dart';
import 'package:e_commerce/dummy_data.dart';
import 'package:e_commerce/features/shop/models/brand_model.dart';
import 'package:e_commerce/features/shop/models/product_model.dart';
import 'package:e_commerce/utils/constants/loaders.dart';
import 'package:get/get.dart';

class BrandController extends GetxController{
  static BrandController get instance => Get.find();

  RxBool isLoading = true.obs;
  final RxList<BrandModel> allBrands = <BrandModel>[].obs;
  final RxList<BrandModel> featuredBrands = <BrandModel>[].obs;

  final brandRepository = Get.put(BrandRepository());
  final localData = true;
  @override
  void onInit(){
    getFeaturedBrands();
    super.onInit();
  }
  // Load Brands
  Future<void> getFeaturedBrands() async {
        // Fetch Local data or From Firebase
    if (localData) {
        // Show loader while loading categories
        isLoading.value = true;
        allBrands.assignAll(DummyData.brands);
        featuredBrands.assignAll(allBrands.where((brand)=> brand.isFeatured ?? false).take(4));
        await Future.delayed(const Duration(seconds: 2));
        isLoading.value = false;
    }else{
    try {
      isLoading.value = true;
      final brands = await brandRepository.getAllBrands();
      allBrands.assignAll(brands);
      featuredBrands.assignAll(allBrands.where((brand)=> brand.isFeatured ?? false).take(4));
    } catch (e) {
      Loaders.errorSnackBar(title: "Oh Snap", message: e.toString());
    } finally{
      isLoading.value = false;
    }
  }
  }
  // Get Brands for Categories
  Future<List<BrandModel>> getBrandsForCategory(String categoryId) async{
    
    // Fetch Local data or From Firebase
    if (localData) {
        // Query BrandCategory match with categoryId
        final brandCategoryQuery = DummyData.brandCategory.where((element) => element.categoryId == categoryId).toList();
        
        // Extract brandId from the documents
        List<String> brandIds = brandCategoryQuery.map((doc) => doc.brandId as String).toList();

        // Query to get all the documents where the brandId is in the list of brandIds, FieldPath.documentId to query documents in the collection
        final brands = DummyData.brands.where((brand) => brandIds.contains(brand.id)).take(2).toList();

        print('getBrandsForCategory : ');
        print(brands.map((e)=> print(e.toJson())));
        
        await Future.delayed(const Duration(seconds: 2));
        return brands;
    }else{
      try {
        final brands = await BrandRepository.instance.getBrandsForCategory(categoryId);
        return brands;
      } catch (e) {
        Loaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
        return [];
      }
    }
  }

  // Get Brand Specific Products from your data source
  Future<List<ProductModel>> getBrandProducts({required String brandId, int limit = -1}) async{
    
    // Fetch Local data or From Firebase
    if (localData) {
      final products = limit != -1
          ? DummyData.products
                .where((product) => product.brand!.id == brandId)
                .take(limit)
                .toList()
          : DummyData.products
                .where((product) => product.brand!.id == brandId)
                .toList();
        await Future.delayed(const Duration(seconds: 2));
        return products;
    }else{
      try {
        final products = await ProductRepository.instance.getProductsForBrand(brandId: brandId, limit: limit);
        return products;
      } catch (e) {
        Loaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
        return [];
      }
    }
  }
}