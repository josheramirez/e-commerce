import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/data/repositories/authentication/authentication_repository.dart';
import 'package:e_commerce/features/personalization/models/address_model.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/state_manager.dart';

class AddressRepository extends GetxController {
  static AddressRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<List<AddressModel>> fetchUserAddress() async{
    try {
      final userId = AuthenticationRepository.instance.currentUser!.uid;
      if(userId.isEmpty) throw 'Unable to find user information. Try again in few minutes.';

      final result = await _db.collection('Users').doc(userId).collection('Addresses').get();
      return result.docs.map((documentSnapshot) => AddressModel.fromDocumentSnapshot(documentSnapshot)).toList();

    } catch (e) {
      throw 'Something went wrong.';
    }
  }

  // Clear the 'selected' filed for all address
  Future<void> updateSelectedField(String addressId, bool selected) async{
    try {
      final userId = AuthenticationRepository.instance.currentUser!.uid;
      await _db.collection('Users').doc(userId).collection('Addresses').doc(addressId).update({'SelectedAddress': selected});
    } catch (e) {
      throw 'Unable to update your address selection, Try again later';
    }
  }

  // Store new user Address
  Future<String> addAddress(AddressModel address) async{
    try {
      final userId = AuthenticationRepository.instance.currentUser!.uid;
      final currentAddress = await _db.collection('Users').doc(userId).collection('Addresses').add(address.toJson());
      return currentAddress.id;
    } catch (e) {
      throw 'Something went wrong saving Address Information. Try again later.';
    }
  }
  
}