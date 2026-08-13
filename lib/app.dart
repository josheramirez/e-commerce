import 'package:e_commerce/bindings/general_bindings.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {

//     return GetMaterialApp(
//       debugShowCheckedModeBanner: false,
//       themeMode: ThemeMode.system,
//       theme: UAppTheme.lightTheme,
//       darkTheme: UAppTheme.darkTheme,

//       getPages: UAppRoutes.screens,

//       initialBinding: UBindings(),
//       home: LoadingScreen()
//     );
//   }
// }

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // return GetMaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   theme: ThemeData(
    //     useMaterial3: true,
    //   ),
    //   home: NavigationMenu()
    // );

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      initialBinding: GeneralBindings(),
      home: Scaffold(
        backgroundColor: UColors.primary,
        body: Center(child: CircularProgressIndicator(color: Colors.white)),
      ),
    );
  }
}
