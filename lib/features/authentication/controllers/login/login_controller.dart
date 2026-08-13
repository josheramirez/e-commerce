import 'package:e_commerce/data/repositories/authentication/authentication_repository.dart';
import 'package:e_commerce/features/personalization/controllers/user_controller.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:e_commerce/utils/constants/loaders.dart';
import 'package:e_commerce/utils/helpers/network_manager.dart';
import 'package:e_commerce/utils/popups/full_screen_loader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  final userController = Get.put(UserController());
  
  @override
  void onInit(){
    // localStorage.writeIfNull('REMEMBER_ME_EMAIL', "");REMEBER_ME_EMAIL
    // localStorage.writeIfNull('REMEMBER_ME_PASSWORD', "");
    email.text = localStorage.read('REMEMBER_ME_EMAIL') ?? '';
    password.text = localStorage.read('REMEMBER_ME_PASSWORD') ?? '';
    super.onInit();
  }

  // Email and Password SignIn
  Future<void> emailAndPasswordSignIn() async{
    try {
      // Start Loading
      FullScreenLoader.openLoadingDialog("Logging you in...", Images.loadingAnimation);

      // Check Internet Connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if(!loginFormKey.currentState!.validate()){
        //Remove Loader
        FullScreenLoader.stopLoading(); 
        return;
      }

      // Save Data and Remember Me is Selected
      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }
      
      // Login user using Email and Password Authentication
      await AuthenticationRepository.instance.loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      // Remove Loader
      FullScreenLoader.stopLoading();

      // Redirect
      AuthenticationRepository.instance.screenRedirect();

    } catch (e) {
      FullScreenLoader.stopLoading();
      Loaders.errorSnackBar(title: "Oh Snap", message: e.toString());
    }
  }

  Future<void> googleSignIn() async{
    try {
      print('googleSignIn()');
      // Start Loading
      FullScreenLoader.openLoadingDialog("Logging you in...", Images.loadingAnimation);
    
      // Check Internet Connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }

      // Google Authentication
      final userCredentials = await AuthenticationRepository.instance.signInWithGoogle();

print('userController $userCredentials');
      // Save User Record
      await userController.saveUserRecord(userCredentials);

      // Remove Loader
      FullScreenLoader.stopLoading();

      // Redirect
      AuthenticationRepository.instance.screenRedirect();
      
    } catch (e) {
      Loaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}