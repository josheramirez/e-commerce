import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  String id;
  String name;
  String image;
  String parentId;
  bool isFeatured;
  bool available;
  String banner;

CategoryModel({
  required this.id,
  required this.name,
  required this.image,
  this.isFeatured = false,
  this.parentId = '',
  this.available = true,
  this.banner = ''
});

// Empty Helper Function
static CategoryModel empty() => CategoryModel(id: '', name: '', image: '', parentId: '', isFeatured: false, available: false);

// Convert model to Json structure si that you can store data in Firestire
Map<String, dynamic> toJson() {
  return {
    'Name': name,
    'Image': image,
    'ParentId': parentId,
    'IsFeatured': isFeatured,
    'available': available,
    'banner': banner
  };
}

// Map Json oriented document snapshot from firebase to UserModel
factory CategoryModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document){
  if (document.data() != null) {
    final data = document.data()!;

    // Map JSON Record to the Model
    return CategoryModel(
      id: document.id,
      name: data['Name'] ?? '', 
      image: data['Image'] ?? '', 
      parentId: data['ParentId'] ?? '', 
      isFeatured: data['IsFeatured'] ?? false,
      available: data['available'] ?? true,
      banner: data['banner'] ?? '',
    );
  }else{
    return CategoryModel.empty();
  }
}

}