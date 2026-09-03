import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/features/shop/models/brand_model.dart';
import 'package:e_commerce/utils/exceptions/firebase_exceptions.dart';
import 'package:e_commerce/utils/exceptions/format_exceptions.dart';
import 'package:e_commerce/utils/exceptions/platform_exceptions.dart';
import 'package:flutter/services.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/state_manager.dart';

class BrandRepository extends GetxController {
  static BrandRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  // Get all Brands
  Future<List<BrandModel>> getAllBrands() async {
    try {

        final snapshot = await _db.collection('Brands').get();
        final result = snapshot.docs.map((e) => BrandModel.fromSnapshot(e)).toList();
        return result;
  
    } on FirebaseException catch(e){
      throw UFirebaseException(e.code).message;
    } on FormatException catch(_){
      throw UFormatException();
    } on PlatformException catch(e){
      throw UPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }

  // Get Brands For Category
  Future<List<BrandModel>> getBrandsForCategory(String categoryId) async {
    try {

        // Query to get all documents where categoryId matches the provided categoryId
        QuerySnapshot brandCategoryQuery = await _db.collection('BrandCategory').where('categoryId', isEqualTo: categoryId).get();
        
        // Extract brandId from the documents
        List<String> brandIds = brandCategoryQuery.docs.map((doc) => doc['brandId'] as String).toList();

        // Query to get all the documents where the brandId is in the list of brandIds, FieldPath.documentId to query documents in the collection
        final brandsQuery = await _db.collection('Brands').where(FieldPath.documentId, whereIn: brandIds).limit(2).get();
        
        // Extract brand name or other relevant data from the documents
        List<BrandModel> brands = brandsQuery.docs.map((doc) => BrandModel.fromSnapshot(doc)).toList();
        return brands;

    } on FirebaseException catch(e){
      throw UFirebaseException(e.code).message;
    } on FormatException catch(_){
      throw UFormatException();
    } on PlatformException catch(e){
      throw UPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }
  
}