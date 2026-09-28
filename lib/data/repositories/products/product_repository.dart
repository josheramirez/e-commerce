import 'dart:convert';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/data/services/firebase_storage_service.dart';
import 'package:e_commerce/dummy_data.dart';
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

  final localData = true;
  final _db = FirebaseFirestore.instance;

  // Get limited featured products
  Future<List<ProductModel>> getAllProducts() async {
    try {
      final snapshot = await _db.collection('Products').get();

      if (snapshot.docs.isNotEmpty) {
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
        
        throw 'Something went wrong. Please try again';
    }
  }



  // Get limited featured products
  Future<List<ProductModel>> getFeaturedProducts() async {
    try {
      final snapshot = await _db.collection('Products').where('isFeatured', isEqualTo: true).limit(4).get();

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
        
        throw 'Something went wrong. Please try again';
    }
  }

  // Get limited All featured products
  Future<List<ProductModel>> getAllFeaturedProducts() async {
    try {
        final snapshot = await _db.collection('Products').where('isFeatured', isEqualTo: true).get();
        return snapshot.docs.map((document) => ProductModel.fromSnapshot(document)).toList();
    } on FirebaseException catch (e) {
      throw UFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw UFormatException();
    } on PlatformException catch (e) {
      throw UPlatformException(e.code).message;
    } catch (e) {
        throw 'Something went wrong. Please try again';
    }
  }

  //  Get Products based on the brand 
  Future<List<ProductModel>> fetchProductsByQuery(Query query) async {
    try {
      final querySnapshot = await query.get();
      final List<ProductModel> productList = querySnapshot.docs.map((doc) => ProductModel.fromQuerySnapshot(doc)).toList();
      return productList;
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

  // Get Products For Brand
  Future<List<ProductModel>> getProductsForBrand({required String brandId, int limit = -1}) async {
    try {

      final querySnapshot = limit == -1
          ? await _db
                .collection('Products')
                .where('Brand.id', isEqualTo: brandId)
                .get()
          : await _db
                .collection('Products')
                .where('Brand.id', isEqualTo: brandId)
                .limit(limit)
                .get();

      final products = querySnapshot.docs.map((doc) => ProductModel.fromSnapshot(doc)).toList();
      return products;

    } on FirebaseException catch (e) {
      throw UFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw UPlatformException(e.code).message;
    } catch (e) {
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

  // Get Products From Category
  Future<List<ProductModel>> getProductsForCategory({required String categoryId, int limit = 4}) async {
    try {

      // Query to get all documents where productId matches the provided categoryId & Fecth limited or unlimited based on limit
      QuerySnapshot productCategoryQuery = limit == -1
          ? await _db
                .collection('ProductCategory')
                .where('categoryId', isEqualTo: categoryId)
                .get()
          : await _db
                .collection('ProductCategory')
                .where('categoryId', isEqualTo: categoryId)
                .limit(limit)
                .get();

      // Extract productIds from the documents
      List<String> productIds = productCategoryQuery.docs.map((doc) => doc['productId'] as String).toList();
      
      // Query to get all documents where the brandId is in the list od brandIds, FilePath.documentId to query documentss in collection
      final productsQuery =  await _db.collection('Products').where(FieldPath.documentId, whereIn: productIds).get();
      
      // Extract brand names or other relevant data from the documents
      List<ProductModel> products = productsQuery.docs.map((doc) => ProductModel.fromSnapshot(doc)).toList();
      return products;

    } on FirebaseException catch (e) {
      throw UFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw UPlatformException(e.code).message;
    } catch (e) {
        throw 'Something went wrong. Please try again';
    }
  }

  // Get limited featured products
  Future<List<ProductModel>> getFavoriteProducts(List<String> productIds) async {
    if (localData) {
      
      final products = DummyData.products.where((product) => productIds.contains(product.id)).toList();
      // await Future.delayed(const Duration(seconds: 2));
      return products;

    }else{
      try {

          final snapshot = await _db.collection('Products').where(FieldPath.documentId, whereIn: productIds).get();
          return snapshot.docs.map((document) => ProductModel.fromSnapshot(document)).toList();

      } on FirebaseException catch (e) {
        throw UFirebaseException(e.code).message;
      } on FormatException catch (_) {
        throw UFormatException();
      } on PlatformException catch (e) {
        throw UPlatformException(e.code).message;
      } catch (e) {
          debugPrint('ERROR in ProductRepository getFavoriteProducts. $e');
          throw 'Something went wrong. Please try again';
      }
    }
    
  }
}