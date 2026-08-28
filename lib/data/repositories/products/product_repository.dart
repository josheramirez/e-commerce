import 'dart:convert';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/data/services/firebase_storage_service.dart';
import 'package:e_commerce/features/shop/models/product_model.dart';
import 'package:e_commerce/utils/constants/enums.dart';
import 'package:e_commerce/utils/exceptions/firebase_exceptions.dart';
import 'package:e_commerce/utils/exceptions/format_exceptions.dart';
import 'package:e_commerce/utils/exceptions/platform_exceptions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/state_manager.dart';

class ProductRepository extends GetxController {
  static ProductRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  // Get limited featured products
  Future<List<ProductModel>> getFeaturedProducts() async {
    try {
      final snapshot = await _db.collection('Products').get();

      if (snapshot.docs.isNotEmpty) {
        for (var doc in snapshot.docs) {
          print('Doc ID: ${doc.id}');
          var encoder = const JsonEncoder.withIndent('  ');
          print('Data: ${encoder.convert(doc.data())}'); // Prints the fields as a Map
        }
        List<ProductModel> products = snapshot.docs.map((document) => ProductModel.fromSnapshot(document)).toList();
        return products;
      }

      return [];

      // return snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();

      

    } on FirebaseException catch (e) {
      throw UFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw UFormatException();
    } on PlatformException catch (e) {
      throw UPlatformException(e.code).message;
    } catch (e) {
        debugPrint('ERROR in ProductRepository. $e');
        throw 'Something went wrong. Please try again';
    }
  }

  // Upload Dummy data from local Assets
  Future<void> uploadDummyData(List<ProductModel> products) async {
    try {
      // Upload all the products along with their images
      final storage = Get.put(FirebaseStorageService());

      // Loop through each product
      for (var product in products) {
        // get image data link from local assets
        final thumbnail = await storage.getImageDataFromAssets(product.thumbnail);

        // Upload image and get its URL
        final url = await storage.uploadImageData('Products/Images', thumbnail, product.thumbnail.toString());

        // Assign URL to product.thumbnail attribute
        product.thumbnail = url;

        // Product list of images
        if (product.images != null && product.images!.isNotEmpty) {
          List<String> imagesUrl = [];
          for(var image in product.images!){
            // Get image data link from local assets
            final assetImage = await storage.getImageDataFromAssets(image);

            // Uploadimage and get its URL
            final url = await storage.uploadImageData('Products.Images', assetImage, image);

            // Assign URL to product.thumbnail attribute
            imagesUrl.add(url);
          }
          product.images!.clear();
          product.images!.addAll(imagesUrl);
        }

        // Upload Variation Images
        if (product.productType == ProductType.variable.toString()) {
          for(var variation in product.productVariations!){
            // Get Image data link from local assets
            final assetImage = await storage.getImageDataFromAssets(variation.image);

            // Upload image and get its URL
            final url = await storage.uploadImageData('Products/Images', assetImage, variation.image);

            // Assign URL to product.thumbnail attribute
            variation.image = url;
          }
          
        }

        // Store product in Firestore
        await _db.collection('Products').doc(product.id).set(product.toJson());
        debugPrint('Product ${product.id} uploaded');
      }
    
    } on FirebaseException catch(e){
        throw e.message!;
    } on SocketException catch(e){
        throw e.message!;
    } on PlatformException catch(e){
        throw e.message!;
    } catch (e) {
        debugPrint('Error in ProductRepository');
        throw e.toString();

    }
  }

}