import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/utils/helpers/formatter.dart';
import 'package:get/state_manager.dart';

class AddressModel{
  String id;
  final String name;
  final String phoneNumber;
  final String street;
  final String city;
  final String state;
  final String postalCode;
  final String country;
  final DateTime? dateTime;
  bool selectedAddress;

  AddressModel({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.street,
    required this.city,
    required this.state,
    required this.postalCode,
    required this.country,
    this.dateTime,
    this.selectedAddress = false,
  });

  String get formattedPhoneNumber => Formatter.formatPhoneNumber(phoneNumber);

  static AddressModel empty() => AddressModel(
    id:'',
    name:'',
    phoneNumber:'',
    street:'',
    city:'',
    state:'',
    postalCode:'',
    country:''
  );

  Map<String, dynamic> toJson(){
    return{
      'Id': id,
      'Name': name,
      'PhoneNumbe': phoneNumber,
      'Street': street,
      'city': city,
      'State': state,
      'PostalCode': postalCode,
      'Country': country,
      'DateTime': DateTime.now(),
      'SelectedAddress': selectedAddress,
    };
  }

  factory AddressModel.fromMap(Map<String, dynamic> data){
    return AddressModel(
      id:  data['id'] as String,
      name:  data['name'] as String,
      phoneNumber:  data['phoneNumber'] as String,
      street:  data['street'] as String,
      city:  data['city'] as String,
      state:  data['state'] as String,
      postalCode:  data['postalCode'] as String,
      country:  data['country'] as String,
      selectedAddress: data['selectedAddress'] as bool,
      dateTime: (data['DateTime'] as Timestamp).toDate(),
    );
  }

  factory AddressModel.fromDocumentSnapshot(DocumentSnapshot snapshot){
    final data = snapshot.data() as Map<String, dynamic>;

    return AddressModel(
      id: snapshot.id,
      name: data['Name'] ?? '',
      phoneNumber: data['PhoneNumber'] ?? '',
      street: data['Street'] ?? '',
      city: data['City'] ?? '',
      state: data['State'] ?? '',
      postalCode: data['PostalCode'] ?? '',
      country: data['Country'] ?? '',
      dateTime: (data['DateTime'] as Timestamp).toDate(),
      selectedAddress: data['SelectedAddress'] as bool
    );
  }

  @override
  String toString() {
    return '$street, $city, $state, $postalCode, $country, $selectedAddress';
  }


  AddressModel copyWith({bool? selectedAddress}) {
    return AddressModel(
      id: id,
      name: name,
      phoneNumber: phoneNumber,
      street: street,
      city: city,
      state: state,
      postalCode: postalCode,
      country: country,
      dateTime: dateTime,
      selectedAddress: selectedAddress ?? this.selectedAddress
    );
  }
  
}