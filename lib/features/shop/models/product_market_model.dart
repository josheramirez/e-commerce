import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/features/shop/models/post_model.dart';
import 'package:e_commerce/features/shop/models/store_model.dart';

class ProductMarketModel {
  final String id;
  final String image;
  final String name;
  final String quantity;
  final int price;
  final StoreModel? store;
  final DateTime? updateDate;
  final PostModel? post;
  final int? commentSize;

  ProductMarketModel({
    required this.id,
    required this.image,
    required this.name,
    required this.quantity,
    required this.price,
    this.store,
    this.updateDate,
    this.post, 
    this.commentSize = 0,
  });

  static ProductMarketModel empty() => ProductMarketModel(id: '', image: '', name: '', quantity: '', price: 0);

  Map<String, dynamic> toJson(){
    return{
      'id': id,
      'name': name,
      'image': image,
      'quantity': quantity,
      'store': store?.toJson(),
      'updateDate': updateDate,
      'post': post?.toJson(),
      'commentSize': commentSize
    };
  }

  factory ProductMarketModel.fromJson(Map<String, dynamic> document){
    final data = document;
    if(data.isEmpty) return ProductMarketModel.empty();
    return ProductMarketModel(
      id:  data['id'],
      name:  data['name'],
      image:  data['image'],
      quantity:  data['quantity'],
      price:  data['price'],
      store:  StoreModel.fromJson(data['store']),
      updateDate:   (data['updateDate'] as Timestamp).toDate(),
      post:  PostModel.fromJson(data['post']),
      commentSize:  data['commentSize']
    );
  }

  factory ProductMarketModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document){
    if(document.data() != null){
      Map<String, dynamic> data = document.data()!;
      return ProductMarketModel(
        id:  data['id'],
        name:  data['name'],
        image:  data['image'],
        quantity:  data['quantity'],
        price:  data['price'],
        store:  StoreModel.fromJson(document['store']),
        updateDate:  (data['updateDate'] as Timestamp).toDate(),
        post: PostModel.fromJson(data['post']),
        commentSize:  data['commentSize']
      );
    }else{
      return ProductMarketModel.empty();
    }
  }


  // Clones the existing model while altering specified properties
  ProductMarketModel copyWith({int? commentSize}) {
    return ProductMarketModel(
      id: this.id, // ID remains the same
      name:  this.name,
      image:  this.image,
      quantity:  this.quantity,
      price: this.price,
      store:  this.store,
      updateDate: this.updateDate,
      post: this.post,
      commentSize: commentSize ?? this.commentSize,
    );
  }

}