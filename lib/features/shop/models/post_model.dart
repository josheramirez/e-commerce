import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/features/authentication/models/user_model.dart';
import 'package:e_commerce/features/shop/models/product_market_model.dart';
import 'package:e_commerce/features/shop/models/product_model.dart';
import 'package:e_commerce/features/shop/models/store_model.dart';

class PostModel {
  String id;
  UserModel user;
  String productId;
  int price;
  StoreModel store;
  String comment;
  int positiveFeedback;
  int negativeFeedback;
  final DateTime timestamp;
  
  PostModel({
    required this.id,
    required this.user,
    required this.productId,
    required this.price,
    required this.store,
    required this.comment,
    this.positiveFeedback = 0,
    this.negativeFeedback = 0,
    
  }): timestamp = DateTime.now();

  static PostModel empty() => PostModel(id: '', user: UserModel.empty(), price: 0, store: StoreModel.empty(), comment: '', productId: '');
  
  /// Convert Model to Json/Map
  Map<String, dynamic> toJson(){
    return {
      'id': id,
      'user': user.toJson(),
      'productId': productId,
      'price': price,
      'store': store,
      'comment' : comment,
      'positiveFeedback' : positiveFeedback,
      'negativeFeedback' : negativeFeedback,
      'timestamp' : timestamp
    };
  }

  factory PostModel.fromJson(Map<String, dynamic> document){
    final data = document;
    if(data.isEmpty) return PostModel.empty();

    return PostModel(
      id: data['id'],
      user: UserModel.fromJson(data['user']),
      productId: data['productId'],
      price: data['price'],
      store: StoreModel.fromJson(data['store']),
      comment: data['comment'],
      positiveFeedback: data['positiveFeedback'],
      negativeFeedback: data['negativeFeedback'],
    );
  }

  factory PostModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document){
    if(document.data() != null){
      Map<String, dynamic> data = document.data()!;
      return PostModel(
        id: data['id'],
        user: UserModel.fromJson(data['user']),
        productId: data['productId'],
        price: data['price'],
        store: StoreModel.fromJson(data['store']),
        comment: data['comment'],
        positiveFeedback: data['positiveFeedback'],
        negativeFeedback: data['negativeFeedback'],
      );
    }else{
      return PostModel.empty();
    }

  }

}