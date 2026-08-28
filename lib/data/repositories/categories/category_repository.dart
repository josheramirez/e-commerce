import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/data/services/firebase_storage_service.dart';
import 'package:e_commerce/features/shop/models/category_model.dart';
import 'package:e_commerce/utils/exceptions/firebase_exceptions.dart';
import 'package:e_commerce/utils/exceptions/platform_exceptions.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CategoryRepository extends GetxController {
  static CategoryRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;
  
  // Get all categories
  Future<List<CategoryModel>> getAllCategories() async{
    try {
      final snapshot = await _db.collection('Categories').get();
      final list = snapshot.docs.map((document) => CategoryModel.fromSnapshot(document)).toList();
  
      return list;

    } on FirebaseException catch(e){
      throw UFirebaseException(e.code).message;
    } on PlatformException catch(e){
      throw UPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }

  // Upload Categories to the Cloud Firebase
  Future<void> uploadDummyData(List<CategoryModel> categories) async{
    try {
      // Upload all the Categories along with their Images
      final storage = Get.put(FirebaseStorageService());

      // Loop through each category
      for (var category in categories) {
        // Get ImageData link from the local Assets
        final file = await storage.getImageDataFromAssets(category.image);

        // Upload Image and Get its URL
        final url = await storage.uploadImageData('Categories', file, category.name);

        // Assign Url to Category.image attribute
        category.image = url;

        // Store Category in FIrestore
        await _db.collection('Categories').doc(category.id).set(category.toJson());
      }
      
    } on FirebaseException catch(e){
      throw UFirebaseException(e.code).message;
    } on PlatformException catch(e){
      throw UPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }
}