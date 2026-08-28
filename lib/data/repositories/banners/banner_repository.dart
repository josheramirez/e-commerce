import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/features/shop/models/banner_model.dart';
import 'package:e_commerce/utils/exceptions/firebase_exceptions.dart';
import 'package:e_commerce/utils/exceptions/platform_exceptions.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class BannerRepository extends GetxController{
  static BannerRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  // Get all Banners
  Future<List<BannerModel>> getAllBanners() async{
    try {
      
      final result = await _db.collection('Banners').where('active', isEqualTo: true).get();
      return result.docs.map((document) => BannerModel.fromSnapshot(document)).toList();
      

    } on FirebaseException catch(e){
      throw UFirebaseException(e.code).message;
    } on PlatformException catch(e){
      throw UPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }
}