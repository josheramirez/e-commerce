import 'package:e_commerce/dummy_data.dart';
import 'package:e_commerce/features/authentication/models/user_model.dart';
import 'package:e_commerce/features/personalization/controllers/user_controller.dart';
import 'package:e_commerce/features/shop/controllers/product_market/product_market_controller.dart';
import 'package:e_commerce/features/shop/models/feedback_model.dart';
import 'package:e_commerce/features/shop/models/post_model.dart';
import 'package:e_commerce/features/shop/models/store_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/state_manager.dart';

class PostController extends GetxController {
  static PostController get instance => Get.find();

  final localData = true;
  final RxList<PostModel> allPost = <PostModel>[].obs;
  final RxList<FeedbackModel> userFeedback = <FeedbackModel>[].obs;
  final RxList<String> productFeedback = <String>[].obs;
  final RxList<StoreModel> stores = <StoreModel>[].obs;

  final productController = ProductMarketController.instance;


  final UserModel user = UserController.instance.user.value;

  @override
  void onInit(){
    // getAllPost();
    getUserFeedback();
    getAllStores();
    super.onInit();
  }

  void getAllStores() async {
    if (localData) {
      stores.assignAll(DummyData.stores);
    }
  }

  void savePost(String price, String comment, bool newStore, String storeName, String storeAddress, String productId){
    if (localData) {

        print(newStore);
        final store = newStore? StoreModel(id: '', name: storeName, address: storeAddress) : DummyData.stores.firstWhere((store) => store.name == storeName);
        print('store ${store.toString()}');
        
        final post = PostModel(id: UniqueKey().toString(), user: user, productId: productId, price: int.parse(price), store: store, comment: comment);
        
        
        print('post ${post.toJson()}');

        stores.add(store);
        stores.refresh();

        allPost.add(post);
        allPost.refresh();

        print('call ProductController');
        productController.updateProductFeedback(post);
    }
  }

  void getAllPost(String productId) async{

    if (localData) {
        allPost.assignAll(DummyData.posts.where((post) => post.productId == productId));
        print('allPost: ');
        allPost.forEach((post)=> print(post.toJson()));
    }
  }

  void handleFeedback(String feedbackValue, PostModel post){
    final postIndex = allPost.indexWhere((doc) => doc.id == post.id);

    print('post handle:');
    print('post id: ${post.toJson()}');
    print('product id: ${post.productId}');
    print('post id: ${post.id}');
    print('user id: ${post.user.id}');

    // update post feedback
    if (feedbackValue == 'positive') {
      allPost[postIndex].positiveFeedback += 1;
    }else{
      allPost[postIndex].negativeFeedback += 1;
    }

    // create new FeedBack
    final feedback = FeedbackModel(
      id: DateTime.now().toString(),
      userId: user.id, 
      postId: post.id, 
      productId: post.productId, 
      feedback: feedbackValue
    );

    // save Feedback
    userFeedback.add(feedback);

    // refresh list of user feedback about a product
    getProductFeedback(post);
  
    // refresh post to see changes in UI
    allPost.refresh();

    print('new userFeedback ${userFeedback.toJson()}');
  }

  // Get all Feedback create by User
  void getUserFeedback () {
    if(localData){
      userFeedback.addAll(DummyData.feedbacks.where((feedback) => feedback.userId == user.id));
      print('new userFeedback: ${userFeedback.length}');
      userFeedback.forEach((feedback) => print(feedback.toJson()));
    }else{
    }
  }

  // Get All Specific Product Feedback created by this User 
  void getProductFeedback (PostModel post){
    
    if(localData){
        final query = userFeedback.where((feedback) => feedback.userId == DummyData.user.id && feedback.productId == post.productId);
        productFeedback.assignAll(query.map((doc) => doc.postId).toSet());

        print('productFeedback : ${productFeedback.toJson()}');
    }else{
    }
  }
}