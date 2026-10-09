import 'package:e_commerce/dummy_data.dart';
import 'package:e_commerce/features/shop/models/post_model.dart';
import 'package:e_commerce/features/shop/models/product_market_model.dart';
import 'package:e_commerce/features/shop/screens/all_products/all_products.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/state_manager.dart';

class ProductMarketController extends GetxController {
  static ProductMarketController get instance => Get.find();

  final localData = true;
  final RxList<ProductMarketModel> products = <ProductMarketModel>[].obs;
  var isLoading = true.obs;
  RxBool refreshData = true.obs;

  @override
  void onInit() {
    getAllMarketProduct();
    super.onInit();
  }

  Future<void> getAllMarketProduct() async {
    List<ProductMarketModel> productsComment = [];

    if (localData) {
      isLoading.value = true;
      // products.assignAll(DummyData.productsMarket);
      final allProducts = DummyData.productsMarket;

      for (var product in allProducts) {
        final allPosts = DummyData.posts
            .where((post) => post.productId == product.id)
            .toList();
        final newProduct = product.copyWith(commentSize: allPosts.length);
        productsComment.add(newProduct);
      }

      productsComment.map((product) => print(product.toJson()));
      products.assignAll(productsComment);

      isLoading.value = false;
    } else {}
  }

  void updateProductFeedback(PostModel post) {
    List<ProductMarketModel> productsComment = [];
    final allProducts = products;

    for (var product in allProducts) {
      final allPosts = DummyData.posts
          .where((post) => post.productId == product.id)
          .toList();
      if (product.id == post.productId) {
        allPosts.add(post);
      }
      final newProduct = product.copyWith(commentSize: allPosts.length);
      productsComment.add(newProduct);
    }
    productsComment.map((product) => print(product.toJson()));
    products.assignAll(productsComment);
  }

  // void getStats(){

  //       List<Map<String, dynamic>> updatedItems = this.products.map((item) {
  //       if (item['id'] == 2) {
  //         // Create a new map copy with the updated value using the spread operator
  //         return {...item, 'price': 8};
  //       }
  //       return item;
  //     }).toList();
  // }
}
