import 'dart:convert';

import 'package:e_commerce/data/repositories/products/product_repository.dart';
import 'package:e_commerce/features/shop/models/product_model.dart';
import 'package:e_commerce/utils/constants/loaders.dart';
import 'package:e_commerce/utils/local_storage/storage_utility.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/state_manager.dart';

class FavoritesController extends GetxController {
  static FavoritesController get instance => Get.find();
  
  final favorites = <String, bool>{}.obs;


  @override
  void onInit() {
    super.onInit();
    initFavorites();
  }

  // Method to initialize favorites by reading from storage
  void initFavorites() {
    final json = LocalStorage.instance().readData('favorites');
    if (json != null) {
      final storedFavorites = jsonDecode(json) as Map<String, dynamic>;
      favorites.assignAll(storedFavorites.map((key, value) => MapEntry(key, value as bool)));
    }
  }

  bool isFavorite(String productId){
    return favorites[productId] ?? false;
  }

  void toggleFavoriteProduct(String productId){
    if(!favorites.containsKey(productId)){
      favorites[productId] = true;
      saveFavoritesToStorage();
      Loaders.customToast(message: 'Producto agregado a la Wishlist');
    }else{
      LocalStorage.instance().removeData(productId);
      favorites.remove(productId);
      saveFavoritesToStorage();
      favorites.refresh();
      Loaders.customToast(message: 'Producto removido de la Wishlist');
    }
  }

  void saveFavoritesToStorage(){
    final encodedFavorites = json.encode(favorites);
    LocalStorage.instance().saveData('favorites', encodedFavorites);
  }

  Future<List<ProductModel>> getFavoriteProducts() async{
    return await ProductRepository.instance.getFavoriteProducts(favorites.keys.toList());
  }
  
}