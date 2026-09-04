import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/utils/constants/enums.dart';

class PromoCodeModel {
  final String id;
  final String name;
  final double discount;
  final String code;
  final DiscountType? discountType;
  final DateTime? startDate;
  final DateTime? endDate;
  final bool isActive;
  final double minOrderPrice;
  final int noOfPromoCodes;
  final List<String>? userIds;

  PromoCodeModel({
    required this.id,
    required this.name,
    required this.discount,
    this.discountType,
    required this.isActive,
    required this.minOrderPrice,
    required this.noOfPromoCodes,
    required this.code,
    this.startDate,
    this.endDate,
    this.userIds
  });

  static PromoCodeModel empty() => PromoCodeModel(id: '', name: '', discount: 0, isActive: false, minOrderPrice: 0, noOfPromoCodes: 0, code: '');

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'discount': discount,
      'discountType': discountType.toString(),
      'startDate': startDate,
      'endDate': endDate,
      'isActive': isActive,
      'minOrderPrice': minOrderPrice,
      'noOfPromoCodes': noOfPromoCodes,
      'code' : code,
      'userIds' :userIds
    };
  }

  factory PromoCodeModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;

    return PromoCodeModel(
      id: snapshot.id,
      name: data['name'] ?? '',
      discount: double.tryParse(data['discount'].toString()) ?? 0.0,
      discountType: DiscountType.values.firstWhere((element) => data['discountType'] == element.toString()),
      startDate: (data['startDate'] as Timestamp).toDate(),
      endDate: (data['endDate'] as Timestamp).toDate(),
      isActive: data['isActive'] ?? false,
      minOrderPrice: (data['minOrderPrice'] as num).toDouble(),
      noOfPromoCodes: data['noOfPromoCodes'] ?? 0,
      code: data['code'] ?? '',
      userIds: List.from(data['userIds'] ?? [])
    );
  }
}