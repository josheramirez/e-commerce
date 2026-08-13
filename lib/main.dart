import 'package:e_commerce/app.dart';
import 'package:e_commerce/data/repositories/authentication/authentication_repository.dart';
import 'package:e_commerce/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  // Add Widgets Binding
  final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  // Init Local Storage
  await GetStorage.init();

  // Await Native Splash
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // Initialize Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then(
    (FirebaseApp value) => Get.put(AuthenticationRepository())
  );

  // Initialize Authentication

  // await Firebase.initializeApp(
  //   options: defaultTargetPlatform == TargetPlatform.linux
  //       ? DefaultFirebaseOptions
  //             .web // Fallback to web config on Linux
  //       : DefaultFirebaseOptions.currentPlatform,
  // );

  runApp(const App());
}
