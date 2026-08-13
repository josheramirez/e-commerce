import 'package:e_commerce/data/repositories/user/user_repository.dart';
import 'package:e_commerce/features/authentication/screens/login/login.dart';
import 'package:e_commerce/features/authentication/screens/onboarding/onboarding.dart';
import 'package:e_commerce/features/authentication/screens/singup/verify_email.dart';
import 'package:e_commerce/navigation_menu.dart';
import 'package:e_commerce/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:e_commerce/utils/exceptions/firebase_exceptions.dart';
import 'package:e_commerce/utils/exceptions/format_exceptions.dart';
import 'package:e_commerce/utils/exceptions/platform_exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:google_sign_in/google_sign_in.dart';



class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  // Variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  User? get currentUser => _auth.currentUser;

  // Called from main.dart an app launch
  @override
  void onReady() {
    // Remove the native splah screen
    FlutterNativeSplash.remove();
    // Redirect to the appropiate screen 
    screenRedirect();
  }

  screenRedirect() async {
    final user = _auth.currentUser;
    
    print("AuthenticationRepository -> screenRedirect() , currentUser:");
    print(user);

    if(user != null){
      if(user.emailVerified){
        Get.off(() => NavigationMenu());
      }else { 
        Get.off(() => VerifyEmailScreen(email: _auth.currentUser?.email));
      }
    }else {
      
      // Local Storage
      if (kDebugMode) {
        print('=== GET STORAGE Auth Repo ===');
        print(deviceStorage.read('isFirstTime'));
      }
      deviceStorage.writeIfNull('isFirstTime', true);
      deviceStorage.read('isFirstTime') != true
          ? Get.offAll(() => LoginScreen())
          : Get.offAll(OnboardingScreen());
        
    }
  }


  // ----------------------------Email & Password sign in--------------------------//

  // EmailAuthentication - LOGIN
  Future<UserCredential> loginWithEmailAndPassword(String email, String password) async{
    try{
      return await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch(e){
      throw UFirebaseAuthException(e.code).message;
    } on FirebaseException catch(e){
      throw UFirebaseException(e.code).message;
    } on FormatException catch(_){
      throw UFormatException();
    } on PlatformException catch(e){
      throw UPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }

  // EmailAuthentication - REGISTER
  Future<UserCredential> registerWithEmailAndPassword(String email, String password) async{
    try{
      return await _auth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch(e){
      throw UFirebaseAuthException(e.code).message;
    } on FirebaseException catch(e){
      throw UFirebaseException(e.code).message;
    } on FormatException catch(_){
      throw UFormatException();
    } on PlatformException catch(e){
      throw UPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }

  // EmailAuthentication - MAIL VERIFICATION
  Future<void> sendEmailVerification() async{
    try{
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch(e){
      throw UFirebaseAuthException(e.code).message;
    } on FirebaseException catch(e){
      throw UFirebaseException(e.code).message;
    } on FormatException catch(_){
      throw UFormatException();
    } on PlatformException catch(e){
      throw UPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }

  // EmailAuthentication - FORGET PASSWORD
  Future<void> sendPasswordResetEmail(String email) async{
    try{
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch(e){
      throw UFirebaseAuthException(e.code).message;
    } on FirebaseException catch(e){
      throw UFirebaseException(e.code).message;
    } on FormatException catch(_){
      throw UFormatException();
    } on PlatformException catch(e){
      throw UPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }

  // ReAuthenticate - RE AUTHENTICATE USER
  Future<void> reAuthenticateWithEmailAndPassword(String email, String password) async{
    try{
      // Create credentials
      AuthCredential credential = EmailAuthProvider.credential(email: email, password: password);

      // ReAuthenticate
      await _auth.currentUser!.reauthenticateWithCredential(credential);

    } on FirebaseAuthException catch(e){
      throw UFirebaseAuthException(e.code).message;
    } on FirebaseException catch(e){
      throw UFirebaseException(e.code).message;
    } on FormatException catch(_){
      throw UFormatException();
    } on PlatformException catch(e){
      throw UPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }

  // GoogleAuthentication - GOOGLE
  Future<UserCredential?> signInWithGoogle() async{
    try{
      print('signInWithGoogle');
      // Trigger the authentication flow
      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth = await userAccount?.authentication;
      
      // Create new Credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken
      );

      // Once signed in, return the UserCredential
      return await _auth.signInWithCredential(credential);

    } on FirebaseAuthException catch(e){
      throw UFirebaseAuthException(e.code).message;
    } on FirebaseException catch(e){
      throw UFirebaseException(e.code).message;
    } on FormatException catch(_){
      throw UFormatException();
    } on PlatformException catch(e){
      throw UPlatformException(e.code).message;
    } catch (e) {
      if (kDebugMode) print('Something is went wrong: $e');
      return null;
    }
  }

  // LogoutUser - Valid for any authentication
  Future<void> logout() async {
    try{
      // await GoogleSignIn().signOut();
      await FirebaseAuth.instance.signOut();
      print("LOGOUT...");
      print(FirebaseAuth.instance.currentUser);
      Get.offAll(() => const LoginScreen());
    } on FirebaseAuthException catch(e){
      throw UFirebaseAuthException(e.code).message;
    } on FirebaseException catch(e){
      throw UFirebaseException(e.code).message;
    } on FormatException catch(_){
      throw UFormatException();
    } on PlatformException catch(e){
      throw UPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }

  // DELETE USER
  Future<void> deleteAccount() async {
  try{
    // await GoogleSignIn().signOut();
    await UserRepository.instance.removeUserRecord(_auth.currentUser!.uid);
    await _auth.currentUser?.delete();
   
    Get.offAll(() => const LoginScreen());
  } on FirebaseAuthException catch(e){
    throw UFirebaseAuthException(e.code).message;
  } on FirebaseException catch(e){
    throw UFirebaseException(e.code).message;
  } on FormatException catch(_){
    throw UFormatException();
  } on PlatformException catch(e){
    throw UPlatformException(e.code).message;
  } catch (e) {
    throw 'Something went wrong, Please try again';
  }
  }
}
