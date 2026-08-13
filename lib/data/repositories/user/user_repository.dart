import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/data/repositories/authentication/authentication_repository.dart';
import 'package:e_commerce/features/authentication/models/user_model.dart';
import 'package:e_commerce/utils/exceptions/firebase_exceptions.dart';
import 'package:e_commerce/utils/exceptions/format_exceptions.dart';
import 'package:e_commerce/utils/exceptions/platform_exceptions.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Function to save user data to Firestore.
  Future<void> saveUserRecord(UserModel user) async{
    try{
      await _db.collection("Users").doc(user.id).set(user.toJson());
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

  // Function to save user data to Firestore.
  Future<UserModel> fetchUserDetails() async{
    try{
      final documentSnapshot = await _db.collection("Users").doc(AuthenticationRepository.instance.currentUser?.uid).get();
      
      print( 'fetchUserDetails() documentSnapshot');
      print(documentSnapshot.toString());

      if (documentSnapshot.exists) {
        return UserModel.fromSnapshot(documentSnapshot);
      } else{
        return UserModel.empty();
      }

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

  // Function to update user data in Firestore.
  Future<void> updateUserDetails(UserModel updatedUser) async{
    try{
      await _db.collection("Users").doc(updatedUser.id).update(updatedUser.toJson());
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

  // Update any field in specific Users Collection
  Future<void> updateSingleField(Map<String, dynamic> json) async {
    try {
      await _db.collection("Users").doc(AuthenticationRepository.instance.currentUser?.uid).update(json);
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

  // Funtion to remove user data from Firestore
  Future<void> removeUserRecord(String userId) async {
    try {
      await _db.collection("Users").doc(userId).delete();
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


  // Upload any Image
  Future<String> uploadImage(String path, XFile image) async{
    try {
      
      final ref = FirebaseStorage.instance.ref(path).child(image.name);
      await ref.putFile(File(image.path));
      final url = await ref.getDownloadURL();
      return url;

    } on FirebaseException catch(e){
      throw UFirebaseException(e.code).message;
    } on FormatException catch(_){
      throw UFormatException();
    } on PlatformException catch(e){
      throw UPlatformException(e.code).message;
    } catch (e) {
      print(e.toString());
      throw 'Something went wrong, Please try again $e';
    }
  }

  // FOR WEB
Future<String> uploadToFirebaseWeb(Uint8List bytes, String fileName) async {
  final storageRef = FirebaseStorage.instance.ref().child("User/Images/Profile/$fileName");
  
  // Use putData for raw bytes on Web
  await storageRef.putData(bytes); 
        final url = await storageRef.getDownloadURL();
      return url;
}


}