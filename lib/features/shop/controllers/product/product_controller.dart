import 'dart:convert';

import 'package:e_commerce/data/repositories/products/product_repository.dart';
import 'package:e_commerce/dummy_data.dart';
import 'package:e_commerce/features/shop/models/product_model.dart';
import 'package:e_commerce/utils/constants/enums.dart';
import 'package:e_commerce/utils/constants/loaders.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/state_manager.dart';

class ProductController extends GetxController{
  static ProductController get intance => Get.find();

  final isLoading = false.obs;
  final productRepository = Get.put(ProductRepository());
  RxList<ProductModel> featuredProducts = <ProductModel>[].obs;

  @override
  void onInit(){
    fetchFeaturedProducts();
    super.onInit();
  }

  final bool localData = true;

  Future<List<ProductModel>> getAllProducts() async{

    // Fetch Local data or From Firebase
    if (localData) {
        try {
          // Show loader while loading categories
          isLoading.value = true;
          final products = DummyData.products.toList();
          // await Future.delayed(const Duration(seconds: 3));
          isLoading.value = false;
          // print("products $products");
          return products;
        } catch (e) {
            isLoading.value = false;
            return [];
        }
    }else{
      try {
        // Show Loader 
        isLoading.value = true;

        // Fetch Products
        final products = await productRepository.getAllProducts();
        return products;
        
      } catch (e) {
        Loaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
        return [];
      } finally {
          isLoading.value = false;
      }
    }
  }


  void fetchFeaturedProducts() async{

    // Fetch Local data or From Firebase
    if (localData) {
        try {
          // Show loader while loading categories
          isLoading.value = true;
          featuredProducts.assignAll(DummyData.products.take(6).toList());
          // await Future.delayed(const Duration(seconds: 3));
          isLoading.value = false;
        } catch (e) {

        } finally{
          isLoading.value = false;
        }
    }else{
      try {
        // Show Loader 
        isLoading.value = true;

        // Fetch Products
        final products = await productRepository.getFeaturedProducts();

        // Assign Products
        featuredProducts.assignAll(products);

        
      } catch (e) {
        Loaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      } finally {
          isLoading.value = false;
      }
    }
  }

  Future<List<ProductModel>> fetchAllFeaturedProducts() async{
    // Fetch Local data or From Firebase
    if (localData) {
        try {
          final products = DummyData.products;
          // await Future.delayed(const Duration(seconds: 3));
          return products;
        } catch (e) {
          Loaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
          return [];
        }
    }else{
      try {
        // Fetch All Products
        final products = await productRepository.getAllFeaturedProducts();
        return products;
      } catch (e) {
         Loaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
         return [];
      }
    }
  }


  Future<String> getUrlFromGs(String gsUrl) async {
  try {
    // Convert the gs:// link into a storage reference
    Reference ref = FirebaseStorage.instance.refFromURL(gsUrl);
    
    // Fetch the public HTTP download URL
    String downloadUrl = await ref.getDownloadURL();
    return downloadUrl;
  } catch (e) {
    return '';
  }
}

  String getProductPrice(ProductModel product){
    double smallestPrice = double.infinity;
    double largestPrice = 0.0;

    // If no variation exist, return the simple price or sale price
    if (product.productType == ProductType.single.toString()) {
      return (product.salePrice > 0 ? product.salePrice : product.price).toString();
    }else{
      // Calculate the smallest and largest prices among variations
      for(var variation in product.productVariations!){
        // Determine the price to consider (sale price if available, otherwise regular price)
        double priceToConsider =  variation.salePrice > 0.0 ? variation.salePrice : variation.price;

        // Update smallest and largestprice
        if (priceToConsider < smallestPrice) {
          smallestPrice = priceToConsider;
        }

        if (priceToConsider > largestPrice) {
          largestPrice = priceToConsider;
        }
      }

      // If smallest and largest price are the same, return a single price
      if(smallestPrice.isEqual(largestPrice)){
        return largestPrice.toString();
      }else { 
        // Otherwise return a price range
        return '$smallestPrice - \$$largestPrice';
      }
    }
    
  }

  String? calculateSalePercentage(double originalPrice, double? salePrice){
    if(salePrice == null || salePrice <= 0.0) return null;
    if(originalPrice <= 0) return null;

    double percentage = ((originalPrice - salePrice) / originalPrice) *100;
    return percentage.toStringAsFixed(0);
  }

  String getProductStockStatus(int stock){
    return stock > 0 ? 'In Stock' : 'Out of Stock';
  }
}