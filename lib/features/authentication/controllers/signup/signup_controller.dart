
import 'package:e_commerce/data/repositories/authentication/authentication_repository.dart';
import 'package:e_commerce/data/repositories/user/user_repository.dart';
import 'package:e_commerce/features/authentication/models/user_model.dart';
import 'package:e_commerce/features/authentication/screens/singup/verify_email.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:e_commerce/utils/constants/loaders.dart';
import 'package:e_commerce/utils/helpers/network_manager.dart';
import 'package:e_commerce/utils/popups/full_screen_loader.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  // Variables

  final hidePassword = true.obs;
  final privacyPolicy = true.obs;
  final email = TextEditingController();
  final lastName = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  final firstName = TextEditingController();
  final phoneNumber = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  // SignUp
  Future<void> signup() async {
    try {
      // Start Loading
      FullScreenLoader.openLoadingDialog("We are processing your information....", Images.loadingAnimation);
      
      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected){
        //Remove Loader
        FullScreenLoader.stopLoading(); 
        return;
      }
      
      // Form Validation
      if(!signupFormKey.currentState!.validate()){
        //Remove Loader
        FullScreenLoader.stopLoading(); 
        return;
      }
      
      
      // // Privicy Policy Check
      if (!privacyPolicy.value) {
        Loaders.warningSnackBar(
          title: 'Accept Privicy Policy',
          message: 'In Order to create a account, you must have to read and accept the Privacy Policy & Terms of Use.'
        );
        //Remove Loader
        FullScreenLoader.stopLoading(); 
        return;
      }


      // Register user in the Firebase Authentication & save user data in the Firebase
      final userCredential = await AuthenticationRepository.instance.registerWithEmailAndPassword(email.text.trim(), password.text.trim());

      // Save Authenticate user data in the Firebase Firestore
      final newUser = UserModel(
        id: userCredential.user!.uid, 
        firstName: firstName.text.trim(), 
        lastName: lastName.text.trim(), 
        username: username.text.trim(), 
        email: email.text.trim(), 
        phoneNumber: phoneNumber.text.trim(), 
        profilePicture: ''
      );
        
      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      //Remove Loader
      FullScreenLoader.stopLoading(); 

      // Show Success Message
      Loaders.successSnackBar(title: 'Congratulations', message: 'Your account has been created! Verify email to continue.');
      
      // Move to Verify Email Screen 
      Get.to(()=> VerifyEmailScreen(email: email.text.trim()));
      
       
    } catch (e) {
      //Remove Loader
      FullScreenLoader.stopLoading(); 
      Loaders.errorSnackBar(title: 'Oh Snap' , message: e.toString());
    }
  }
}
