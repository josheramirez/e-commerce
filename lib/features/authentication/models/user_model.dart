import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/utils/helpers/formatter.dart';

class UserModel{
  // keep final which do not want to update
  final String id;
  String firstName;
  String lastName;
  final String username;
  final String email;
  String phoneNumber;
  String profilePicture;
  String publicId;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.profilePicture,
    this.publicId = 'publicId'
  });

  /// Function to get the full name
  String get fullName => '$firstName $lastName';

  String get formattedPhoneNo => Formatter.formatPhoneNumber(phoneNumber);

  /// Static function to split full name into first name and last name
  static List<String> nameParts(fullName) => fullName.split(" ");

  /// static function to create an empty user model
  static UserModel empty() => UserModel(id: "", firstName: "", lastName: "", username: "", email: "", phoneNumber: "", profilePicture: "");

  // Generate a username from the fullname
  static String generateUsername(fullName){
    List<String> nameParts = fullName.split();
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";

    String camelCaseUsername = "$firstName$lastName";
    String usernameWithPrefix = "cwt_$camelCaseUsername";
    return usernameWithPrefix;
  }

  Map<String, dynamic> toJson(){
    return {
      'id': id,
      'firstName' : firstName,
      'lastName' : lastName,
      'username' : username,
      'email' : email,
      'phoneNumber' : phoneNumber,
      'profilePicture' : profilePicture,
      'publicId' : publicId
    };
  }

  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document){
    if(document.data() != null){
      final data = document.data()!;
      print("UserModel.fromSnapshot");
      print(data.toString());
      return UserModel(
          id: document.id,
          firstName: data['firstName'] ?? '',
          lastName: data['lastName'] ?? '',
          username: data['username'] ?? '',
          email: data['email'] ?? '',
          phoneNumber: data['phoneNumber'] ?? '',
          profilePicture: data['profilePicture'] ?? '',
        publicId: data['publicId']
      );
    }else{
      return UserModel.empty();
    }
  }

}