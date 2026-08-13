import 'package:e_commerce/data/repositories/user/user_repository.dart';
import 'package:e_commerce/features/personalization/controllers/user_controller.dart';
import 'package:e_commerce/features/personalization/screens/profile/profile.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:e_commerce/utils/constants/loaders.dart';
import 'package:e_commerce/utils/helpers/network_manager.dart';
import 'package:e_commerce/utils/popups/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = Get.put(UserController());
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

  @override
  void onInit(){
    initializeNames();
    super.onInit();
  }
  
  // Fetch user record
  Future<void> initializeNames() async{
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  Future<void> updateUserName() async{
    try {
      // Start Loading
      FullScreenLoader.openLoadingDialog("We are updating your information....", Images.loadingAnimation);
      
      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected){
        //Remove Loader
        FullScreenLoader.stopLoading(); 
        return;
      }
      
      // Form Validation
      if(!updateUserNameFormKey.currentState!.validate()){
        //Remove Loader
        FullScreenLoader.stopLoading(); 
        return;
      }

      // Update User first and last name in the Fireabse Firestore
      Map<String, dynamic> name = {'firstName': firstName.text.trim(), 'LastName': lastName.text.trim()};
      await userRepository.updateSingleField(name);

      // Update the Rx User value
      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();

      print('new user name:');
      print(userController);

      // Remove Loader
      FullScreenLoader.stopLoading();

      // Show Success Message
      Loaders.successSnackBar(title: 'Congratulations', message: 'Your Name has been Updated.');

      // Move to previous screen
      Get.off(() => ProfileScreen());

    } catch (e) {
      FullScreenLoader.stopLoading();
      Loaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
  
}