import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/data/repositories/products/product_repository.dart';
import 'package:e_commerce/features/shop/models/product_model.dart';
import 'package:e_commerce/utils/constants/loaders.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/state_manager.dart';

class AllProductsController extends GetxController {
  static AllProductsController get instance => Get.find();

  final repository = ProductRepository.instance;
  final RxString selectedSortOption = 'Nombre'.obs;
  final RxList<ProductModel> products = <ProductModel>[].obs;

  Future<List<ProductModel>> fetchProductsByQuery(Query? query) async{  
    try {
      if (query == null) return [];

      final products = await repository.fetchProductsByQuery(query);
      return products;
      
    } catch (e) {
      Loaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
      return [];
    }
  }

  void sortProducts(String sortOption){ 
    selectedSortOption.value = sortOption;

    switch (sortOption) {
      case 'Nombre':
        products.sort((a, b) => a.title.compareTo(b.title));
        break;
      case 'Mayor Precio':
        products.sort((a, b) => b.price.compareTo(a.price));
        break;
      case 'Menor Precio':
        products.sort((a, b) => a.price.compareTo(b.price));
        break;
      case 'Novedades':
        products.sort((a, b) => a.date!.compareTo(b.date!));
        break;
      case 'Ofertas':
        products.sort((a, b){
          if(b.salePrice > 0){
            return b.salePrice.compareTo(a.salePrice);
          }else if(a.salePrice > 0){
            return -1;
          }else {
            return 1;
          }
        });
        break;
      default:
        // Default soprting option Nombre
        products.sort((a, b) => a.title.compareTo(b.title));
        break;
    } 
  }

  void assignProducts(List<ProductModel> products){
    this.products.assignAll(products);
    sortProducts('Nombre');
  }
}