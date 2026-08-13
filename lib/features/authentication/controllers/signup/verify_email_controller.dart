import 'dart:async';
import 'package:e_commerce/common/widgets/success_screen/success_screen.dart';
import 'package:e_commerce/data/repositories/authentication/authentication_repository.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:e_commerce/utils/constants/loaders.dart';
import 'package:e_commerce/utils/constants/texts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  // Send email Whenever Verify Screen appears & Set timer for auto redirect.
  @override
  void onInit(){
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }

  // Send Email Verification link
  sendEmailVerification() async{
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      Loaders.successSnackBar(title: 'Email Sent', message: 'Please Check your inbox and verify your mail.');
    } catch (e) {
      Loaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  // Timer to automatically redirect on Email Verification
  setTimerForAutoRedirect(){
    Timer.periodic(Duration(seconds: 1), (timer) async {
      print("in setTimerForAutoRedirect");
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if(user?.emailVerified ?? false){
        timer.cancel();
        Get.off(
          () => SuccessScreen(
            image: Images.logoAppWhite, 
            title: UTexts.accountCreatedTitle, 
            subtitle: UTexts.accountCreatedSubTitle, 
            onPress: ()=> AuthenticationRepository.instance.screenRedirect()
          ),
        );
      }
    });
  }

  // Manually Check if Email Verified
  checkEmailVerificationStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    
    if(currentUser != null && currentUser.emailVerified){
      Get.off(
        () => SuccessScreen(
          image: Images.mailVerifcation, 
          title: UTexts.accountCreatedTitle, 
          subtitle: UTexts.accountCreatedSubTitle, 
          onPress: () => AuthenticationRepository.instance.screenRedirect()
        ),
      );
    }
  }
}