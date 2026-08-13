import 'dart:io';

import 'package:e_commerce/data/repositories/authentication/authentication_repository.dart';
import 'package:e_commerce/data/repositories/user/user_repository.dart';
import 'package:e_commerce/features/authentication/models/user_model.dart';
import 'package:e_commerce/features/authentication/screens/login/login.dart';
import 'package:e_commerce/features/personalization/screens/profile/re_authentificate_user_login_form.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:e_commerce/utils/constants/loaders.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/network_manager.dart';
import 'package:e_commerce/utils/popups/full_screen_loader.dart';
import 'package:file_picker/file_picker.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';


class UserController extends GetxController{
  static UserController get instance => Get.find();

  final profileLoading = false.obs;
  final userRepository = Get.put(UserRepository());
  Rx<UserModel> user = UserModel.empty().obs;

  final hidePassword = false.obs;
  final imageUploading = false.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();


  @override
  void onInit(){
    super.onInit();
    fetchUserRecord();
  }

  Future<void> fetchUserRecord() async{
    try {
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
      print('fetchUserRecord : ');
      print(user.toJson());
    
    } catch (e) {
      user(UserModel.empty());
    } finally{
      profileLoading.value = false;
    }
  }

  // Save user record from any registration provider
  Future<void> saveUserRecord(UserCredential? userCredentials) async{
    try {

      // Refresh user record
      await fetchUserRecord();
      
      if(user.value.id.isEmpty){
        if (userCredentials != null) {
          // Convert Name to First and Last Name
          final nameParts = UserModel.nameParts(userCredentials.user!.displayName ?? '');
          final username = UserModel.generateUsername(userCredentials.user!.displayName ?? '');

          // Map Data
          final user = UserModel(
            id: userCredentials.user!.uid,
            firstName: nameParts[0], 
            lastName: nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '', 
            username: username, 
            email: userCredentials.user?.email ?? '', 
            phoneNumber: userCredentials.user!.phoneNumber ?? '', 
            profilePicture: userCredentials.user!.photoURL ?? ''
          );

          // Save user Data
          await UserRepository.instance.saveUserRecord(user);
        }
      }
    } catch (e) {
      Loaders.warningSnackBar(
        title: 'Data not saved', 
        message: 'Something went wrong while saving your information. You can re-save your data in your Profile.'
      );
    }
  }

  // Delete Account Warning
  void deleteAccountWarningPopup(){
    Get.defaultDialog(
      contentPadding: EdgeInsets.all(USizes.md),
      title: 'Delete Account',
      middleText: 'Are you sure you want to delete your account permanently? This action is not reversible and all your data will be remove permanently.',
      confirm: ElevatedButton(
        onPressed: () async => deleteUserAccount(),
        style: ElevatedButton.styleFrom(backgroundColor: Colors.red, side: BorderSide(color: Colors.red)),
        child: Padding(padding: EdgeInsets.symmetric(horizontal:  USizes.lg), child: Text('Delete'))
      ),
      cancel: OutlinedButton(
        onPressed: () => Navigator.of(Get.overlayContext!).pop(), 
        child: Text('Cancel')
      )
    );
  }

  // Delete User Account
  void deleteUserAccount() async {
    try {
      FullScreenLoader.openLoadingDialog('Processing', Images.loadingAnimation);

      // First re-authenticate user
      final auth = AuthenticationRepository.instance;
      final provider = auth.currentUser!.providerData.map((e) => e.providerId).first;
      if (provider.isNotEmpty) {
        // re verify Auth Email
        if (provider == 'google.com') {
          await auth.signInWithGoogle();
          await auth.deleteAccount();
          FullScreenLoader.stopLoading();
          Get.offAll(() => LoginScreen());
        }else if(provider == 'password'){
          FullScreenLoader.stopLoading();
          Get.to(() => ReAuthentificateLoginForm());
        }
      }
    } catch (e) {
      FullScreenLoader.stopLoading();
      Loaders.warningSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

  // RE-AUTHENTICATE before deleting
  Future<void> reAuthenticateEmailAndPasswordUser() async{
    try {
      FullScreenLoader.openLoadingDialog('Processing', Images.loadingAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected){
        //Remove Loader
        FullScreenLoader.stopLoading(); 
        return;
      }
      
      // Form Validation
      if(!reAuthFormKey.currentState!.validate()){
        //Remove Loader
        FullScreenLoader.stopLoading(); 
        return;
      }

      await AuthenticationRepository.instance.reAuthenticateWithEmailAndPassword(verifyEmail.text.trim(), verifyPassword.text.trim());
      await AuthenticationRepository.instance.deleteAccount();
      FullScreenLoader.stopLoading();
      Get.offAll(() => LoginScreen());
      
    } catch (e) {
        FullScreenLoader.stopLoading();
        Loaders.warningSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

  // Fetch User Details
  Future<void> fetchUserDetails() async{
    try {
      UserModel user = await userRepository.fetchUserDetails();
    } catch (e) {
      
    }
  }

  // Uplad Profile Image
  uploadUserProfilePicture() async{
    
    try {
      if (kIsWeb) {
        // Open the picker with the type parameter restricted to image
        FilePickerResult? result = await FilePicker.platform.pickFiles(
          type: FileType.custom,
          allowedExtensions: ['jpg', 'png'],
          allowMultiple: false, // Set to true if you want to allow multi-selection
          withData: true, 
        );

    if (result != null) {
      PlatformFile file = result.files.first;

      if (kIsWeb) {
        // Use bytes directly on the web
        Uint8List? fileBytes = file.bytes;
        String fileName = result.files.first.name;
        
        if (fileBytes != null) {
          final imageUrl = await userRepository.uploadToFirebaseWeb(fileBytes, fileName);

        // Update User Image Record
        Map<String, dynamic> json = {'profilePicture': imageUrl};
        await userRepository.updateSingleField(json);

        user.value.profilePicture = imageUrl;
        user.refresh();
        
        Loaders.successSnackBar(title: 'Congratulations', message: 'Your Profile Image has been updated');
        }
        
      }

    }

      // if (result != null && result.files.single.path != null) {
      //   imageUploading.value = true;
        
      //   PlatformFile pickedFile = result.files.first;
      //   XFile xFile = pickedFile.xFile;
        
      //   // Now you can use it seamlessly across Mobile, Desktop, and Web!
      //   print("Picked file name: ${xFile.name}");
      //   print("File path: ${xFile.path}");
      //   // Do something with the image file (e.g., save to state, upload to server)
        
      //   // Upload Image
      //   final imageUrl = await userRepository.uploadImage('User/Images/Profile/', xFile);

      //   // Update User Image Record
      //   Map<String, dynamic> json = {'ProfilePicture': imageUrl};
      //   await userRepository.updateSingleField(json);

      //   user.value.profilePicture = imageUrl;
      //   user.refresh();
        
      //   Loaders.successSnackBar(title: 'Congratulations', message: 'Your Profile Image has been updated');
      // } else {
      //   // User canceled the picker
      //   print("User canceled the picker");
      // }

      }else {
        print('movil_plattaform');
        final image = await ImagePicker().pickImage(source: ImageSource.gallery, imageQuality: 70, maxHeight: 512, maxWidth: 512);
        
        if (image != null) {
          imageUploading.value = true;
          // Upload Image
          final imageUrl = await userRepository.uploadImage('User/Images/Profile/', image);

          // Update User Image Record
          Map<String, dynamic> json = {'profilePicture': imageUrl};
          await userRepository.updateSingleField(json);

          user.value.profilePicture = imageUrl;
          user.refresh();
          
          Loaders.successSnackBar(title: 'Congratulations', message: 'Your Profile Image has been updated');
        }
      }
    } catch (e) {
      Loaders.errorSnackBar(title: 'Oh Snap', message: 'Something went wrong: $e');
    } finally {
      imageUploading.value = false;
    }
  }
}