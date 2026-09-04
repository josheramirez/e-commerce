
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/data/repositories/authentication/authentication_repository.dart';
import 'package:e_commerce/features/shop/models/order_model.dart';
import 'package:get/get.dart';

class OrderRepository extends GetxController{
  static OrderRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  // Get all order realated to current user
  Future<List<OrderModel>> fetchUserOrders() async{
    try {
      final userId = AuthenticationRepository.instance.currentUser!.uid;
      if(userId.isEmpty) throw 'No se pudo encontrar informacion del usuario, intentale en unos minutos.';

      final result =  await _db.collection('Users').doc(userId).collection('Orders').get();
      return result.docs.map((documentSnapshot) => OrderModel.fromSnapshot(documentSnapshot)).toList();
    } catch (e) {
      throw 'Something went wrong while fetching Order Information. Try again later';
    }
  }

  // Store new user order
  Future<void> saveOrder(OrderModel order, String userId) async {
    try {
      await _db.collection('Users').doc(userId).collection('Orders').add(order.toJson());
    } catch (e) {
      throw 'Something went wrong while saving Order Information. Try again later';
    }
  }
}